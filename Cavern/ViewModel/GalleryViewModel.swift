//
//  GalleryViewModel.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/28/22.
//

import Foundation
import Firebase
import SwiftUI

class GalleryViewModel: ObservableObject {
    
    @Published var list = [PictureModel]()
    private let db = Firestore.firestore()
    
    func getGallery() {
        db.collection("gallery").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no gallery")
                return
            }
            
            self.list = documents.map { (queryDocumentSnapshot) in
                let data = queryDocumentSnapshot.data()
                
                let id = queryDocumentSnapshot.documentID
                let title = data["title"] as? String ?? ""
                let body = data["body"] as? String ?? ""
                let image_uri = data["image_uri"] as? String ?? ""
                let photographer = data["photographer"] as? String ?? ""
                
                return PictureModel(id: id, title: title, image_uri: image_uri, photographer: photographer, body: body)
            }
        }
    }
    
}

//
//  ArticleViewModel.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/27/22.
//

import Foundation
import Firebase

class ArticleViewModel: ObservableObject {
    
    @Published var list = [ArticleModel]()
    private let db = Firestore.firestore()
    
    func getArticles() {
        db.collection("articles").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no articles")
                return
            }
            
            self.list = documents.map { (queryDocumentSnapshot) in
                let data = queryDocumentSnapshot.data()
                
                let id = queryDocumentSnapshot.documentID
                let title = data["title"] as? String ?? ""
                let body = data["body"] as? String ?? ""
                let image_uri = data["image_uri"] as? String ?? ""
                let ordinal = data["ordinal"] as? Int ?? -1
                
                return ArticleModel(id: id, title: title, body: body, image_uri: image_uri, ordinal: ordinal)
            }
        }
    }
}

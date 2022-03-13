//
//  AllPictures.swift
//  Cavern
//
//  Created by Isaac Zahau on 3/12/22.
//

import SwiftUI
import WaterfallGrid

struct AllPictures: View {
    
    @State var pictureData = [
        PictureModel(id: "id1", title: "Traditional Clothing", image_uri: "traditional", photographer: "John Doe", body: ""),
        PictureModel(id: "id2", title: "River", image_uri: "mountain_1", photographer: "John Doe", body: ""),
        PictureModel(id: "id3", title: "Boat", image_uri: "mountain_2", photographer: "John Doe", body: "")
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color("primary")
            
            WaterfallGrid($pictureData) { $image in
                
                NavigationLink(destination: PictureInfo(selectedImage: $image), label: {
                    
                    Image(image.image_uri)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(5)
                })
                    .fixedSize(horizontal: false, vertical: true)
                
            }
            .gridStyle(
                columns: 2
            )
            .padding(.top, 128)
        }
        .ignoresSafeArea()
    }
}

struct AllPictures_Previews: PreviewProvider {
    static var previews: some View {
        AllPictures()
    }
}

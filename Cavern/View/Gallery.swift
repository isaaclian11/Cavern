//
//  Gallery.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/13/22.
//

import SwiftUI
import WaterfallGrid

struct Gallery: View {
    
    @State var imageNames = [
        ImageModel(id: 0, image_name: "mountain_1"),
        ImageModel(id: 1, image_name: "mountain_2"),
        ImageModel(id: 2, image_name: "traditional"),
        ImageModel(id: 3, image_name: "mountain_3"),
        ImageModel(id: 4, image_name: "vector_mountain_1"),
        ImageModel(id: 5, image_name: "vector_mountain_1"),
        ImageModel(id: 6, image_name: "chin_state")
//        ImageModel(id: 7, image_name: "traditional"),
//        ImageModel(id: 8, image_name: "mountain_1"),
//        ImageModel(id: 9, image_name: "mountain_2"),
//        ImageModel(id: 10, image_name: "mountain_3"),
//        ImageModel(id: 11, image_name: "mountain_4"),
//        ImageModel(id: 12, image_name: "mountain_1"),
//        ImageModel(id: 13, image_name: "traditional"),
//        ImageModel(id: 14, image_name: "mountain_3"),
//        ImageModel(id: 15, image_name: "mountain_4"),
//        ImageModel(id: 16, image_name: "cavern"),
//        ImageModel(id: 17, image_name: "cross"),
//        ImageModel(id: 18, image_name: "migration"),
//        ImageModel(id: 19, image_name: "mountain_4"),
//        ImageModel(id: 20, image_name: "mountain_1"),
//        ImageModel(id: 21, image_name: "mountain_2"),
//        ImageModel(id: 22, image_name: "mountain_3"),
//        ImageModel(id: 23, image_name: "mountain_4")
    ]
    
    var body: some View {
        ZStack {
            
            Color("primary")
            
            VStack {
                
                HStack {
                    
                    Text("Gallery")
                        .font(.system(size: 40, weight: .regular))
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                }
                .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    WaterfallGrid(imageNames) { image in
                        Image(image.image_name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(5)
                            
                    }
                    .gridStyle(
                        columns: 2
                    )
                }
            }
        }
    }
}

struct Gallery_Previews: PreviewProvider {
    static var previews: some View {
        Gallery()
    }
}

struct ImageModel : Identifiable {
    var id : Int
    var image_name : String
}

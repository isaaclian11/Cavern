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
        ImageModel(id: 3, image_name: "bird"),
        ImageModel(id: 4, image_name: "mountain_1"),
        ImageModel(id: 5, image_name: "traditional"),
        ImageModel(id: 6, image_name: "bird")
    ]
    
    @State var selectedImage = 0
    
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
                        
                        NavigationLink(destination: PictureInfo(selectedImage: $selectedImage), label: {
                            
                            Image(image.image_name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(5)
                        })
                            
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

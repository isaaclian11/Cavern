//
//  PictureInfo.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/25/22.
//

import SwiftUI

struct PictureInfo: View {
    
    @Binding var selectedImage : Int
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack (alignment: .bottomTrailing) {
                Image("traditional")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 120)
                
                ZStack {
                    HStack(spacing: 20) {
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                            .frame(width: 1, height: 1)
                        
                        Text("Isaac Zahau")
                            .font(.system(size: 8, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                .background(Color("primary"))
                .clipShape(Rectangle())
                .opacity(0.5)
                .cornerRadius(16)
                .padding(.trailing, 8)
                .padding(.bottom, 16)
            }
            
            Text("Traditional Dress")
                .font(.title)
                .foregroundColor(.white)
                .padding(.leading)
                .padding(.top, 40)
            
            Spacer()
        }
        .ignoresSafeArea()
        .background(Color("primary"))
    }
}

struct PictureInfo_Previews: PreviewProvider {
    static var previews: some View {
        PictureInfo(selectedImage: .constant(0))
    }
}

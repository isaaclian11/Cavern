//
//  PictureInfo.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/25/22.
//

import SwiftUI

struct PictureInfo: View {
    
    // 1
    private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    // 2
    private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        
        // Image was pulled down
        if offset > 0 {
            return -offset
        }
        
        return 0
    }
    
    private func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let imageHeight = geometry.size.height
        
        if offset > 0 {
            return imageHeight + offset
        }
        
        return imageHeight
    }
    
    @Binding var selectedImage : Int
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            Color("primary")
            
            ScrollView(.vertical) {
                ZStack {
                    
                    VStack(alignment: .leading) {
                        
                        ZStack (alignment: .bottomTrailing) {
                            
                            GeometryReader { geometry in
                                Image("traditional")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width, height: self.getHeightForHeaderImage(geometry))
                                    .clipped()
                                    .offset(x: 0, y: self.getOffsetForHeaderImage(geometry)) // 3
                            }.frame(height: UIScreen.main.bounds.height )
                            
                            
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
                        
                        
                        Text("Traditional Clothes")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.top, 40)
                            .padding(.leading)
                        
                        Text("It is estimated that at least 60,000 Chin refugees are living in India while more than 20,000 Chin refugees are living in Malaysia.  Several thousands more are scattered in North America, Europe, Australia and New Zealand (Chin Human Rights Organization, 2010).The majority of Chin refugees entering the United States and coming to Seattle are Christians who are either young, single males or young couples (20-40 years old), some with children.")
                            .lineSpacing(10)
                            .font(.body)
                            .foregroundColor(Color.white)
                            .padding()
                        
                        
                        Spacer()
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct PictureInfo_Previews: PreviewProvider {
    static var previews: some View {
        PictureInfo(selectedImage: .constant(0))
    }
}

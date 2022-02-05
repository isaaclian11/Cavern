//
//  Geography.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/4/22.
//

import SwiftUI

struct Geography: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            Image("chin_state")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 20)
            
            ZStack {
                Image("myanmar_map")
                    .resizable()
                    .scaledToFit()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("black")))
                    .frame(width: 140, height: 250)
                    .padding(.horizontal)
                    .padding(.bottom, 48)
                
                Text("Myanmar")
                    .font(.system(size: 10, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.bottom, 60)
            }
            
        }
        
    }
}

struct Geography_Previews: PreviewProvider {
    static var previews: some View {
        Geography()
    }
}

//
//  ShortHolder.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/2/22.
//

import SwiftUI
import SSSwiftUIGIFView

struct Short: View {
    var body: some View {
        
        ZStack {
            SwiftUIGIFPlayerView(gifName: "elephant")
        }
        .ignoresSafeArea(.all)
    }
}

struct ShortHolder_Previews: PreviewProvider {
    static var previews: some View {
        Short()
    }
}

//
//  FlexibleSheet.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/4/22.
//

import SwiftUI

enum SheetMode {
    case none
    case quarter
//    case full
}

struct FlexibleSheet<Content: View>: View {
    
    let content: () -> Content
    let sheetMode: Binding<SheetMode>
    
    init(sheetMode: Binding<SheetMode>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.sheetMode = sheetMode
    }
    
    private func calculateOffset() -> CGFloat {
        
        switch sheetMode.wrappedValue {
        case .none:
            return UIScreen.main.bounds.height
        case .quarter:
            return UIScreen.main.bounds.height - 170
//        case .full:
//            return 0
        }
        
    }
    
    var body: some View {
        content()
            .offset(y: calculateOffset())
            .animation(.spring())
            .ignoresSafeArea()
    }
}

struct FlexibleSheet_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleSheet(sheetMode: .constant(.none)) {
            VStack{
                Text("Hello World!")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
        }
    }
}

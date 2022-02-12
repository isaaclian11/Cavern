//
//  FalamArticle.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/11/22.
//

import SwiftUI

struct CityModal: View {
    
    @Binding var selectedCity : Int
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color("primary")
            
            switch selectedCity {
            case 0 :
                VStack {
                    Text("Falam Township")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 36)
                    
                    Text("Falam Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.top, 12)
                }
            case 1 :
                VStack {
                    Text("Matupi Township")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 36)
                    
                    Text("Matupi Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.top, 12)
                }
            case 2 :
                VStack {
                    Text("Hakha Township")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 36)
                    
                    Text("Hakha Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.top, 12)
                }
            case 3 :
                VStack {
                    Text("Aizawl Township")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 36)
                    
                    Text("Aizawl Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.top, 12)
                }
            case 4 :
                VStack {
                    Text("Tedim Township")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 36)
                    
                    Text("Tedim Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.top, 12)
                }
            case 5 :
                VStack {
                    Text("Thantlang Township")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 36)
                    
                    Text("Thantlang Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.top, 12)
            }
            case _ :
                VStack{
                    
                }
        }
    }
}
}

struct FalamArticle_Previews: PreviewProvider {
    static var previews: some View {
        CityModal(selectedCity: .constant(1))
    }
}

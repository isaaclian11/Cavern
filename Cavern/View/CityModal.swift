//
//  FalamArticle.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/11/22.
//

import SwiftUI

struct CityInfo: Identifiable {
    var id: Int
    var city_name : String
    var city_info : String
}

struct CityModal: View {
    
    @Binding var selectedCity : Int
    @State var cities = [
        CityInfo(id: 0, city_name: "Falam Township", city_info: "Falam Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level."),
        CityInfo(id: 1, city_name: "Matupi Township", city_info: "Matupi Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level."),
        CityInfo(id: 2, city_name: "Hakha Township", city_info: "Hakha Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level."),
        CityInfo(id: 3, city_name: "Aizawl Township", city_info: "Aizawl Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level."),
        CityInfo(id: 4, city_name: "Tedim Township", city_info: "Tedim Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level."),
        CityInfo(id: 5, city_name: "Thantlang Township", city_info: "Thantlang Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level."),
    ]
    
    var body: some View {
        
        let city = getCityInfo(selectedCity: selectedCity)
        
        ZStack(alignment: .top) {
            
            Color("primary")
            
            VStack {
                Text(city.city_name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Text(city.city_info)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
    
    func getCityInfo(selectedCity: Int) -> CityInfo {
        return cities[selectedCity]
    }
}

struct FalamArticle_Previews: PreviewProvider {
    static var previews: some View {
        CityModal(selectedCity: .constant(0))
    }
}

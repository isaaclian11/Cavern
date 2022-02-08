//
//  Geography.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/4/22.
//

import SwiftUI

struct Geography: View {
    
    @State private var selectedCity = ""
    @State private var isShowing = false
    
    private let FALAM = "Falam"
    private let MATUPI = "Matupi"
    private let HAKHA = "Hahka"
    private let AIZAWL = "Aizawl"
    private let TEDIM = "Tedim"
    private let THANTLANG = "Thantlang"

    var body: some View {
                
        ZStack {
            
            ZStack {
                Image("chin_state")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 20)
                    
               
                // Matupi
                Image("map_marker")
                    .resizable()
                    .frame(width:20, height: 20)
                    .padding(.trailing, UIScreen.main.bounds.width * 0.2)
                    .padding(.top, UIScreen.main.bounds.height * 0.15)
                    .foregroundColor(selectedCity == MATUPI ? Color.red : Color.black)
                

                // Hakha
                Image("map_marker")
                    .resizable()
                    .frame(width:20, height: 20)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.2)
                    .padding(.trailing, UIScreen.main.bounds.width * 0.1)
                    .foregroundColor(selectedCity == HAKHA ? Color.red : Color.black)
                

                // Thantlang
                Image("map_marker")
                    .resizable()
                    .frame(width:20, height: 20)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.24)
                    .padding(.trailing, UIScreen.main.bounds.width * 0.24)
                    .foregroundColor(selectedCity == THANTLANG ? Color.red : Color.black)
                

                // Falam
                Image("map_marker")
                    .resizable()
                    .frame(width:20, height: 20)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.32)
                    .padding(.trailing, UIScreen.main.bounds.width * 0.01)
                    .foregroundColor(selectedCity == FALAM ? Color.blue : Color.black)
                    .onTapGesture {
                        updateSelectedCity(city: "Falam")
                    }
        

                // Tedim
                Image("map_marker")
                    .resizable()
                    .frame(width:20, height: 20)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.5)
                    .padding(.trailing, UIScreen.main.bounds.width * 0.1)
                    .foregroundColor(selectedCity == TEDIM ? Color.red : Color.black)
                

                // Aizawl
                Image("map_marker")
                    .resizable()
                    .frame(width:20, height: 20)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.6)
                    .padding(.trailing, UIScreen.main.bounds.width * 0.66)
                    .foregroundColor(selectedCity == AIZAWL ? Color.red : Color.black)
            }
        
            VStack {
                ZStack {
                    
                    Image("myanmar_map")
                        .resizable()
                        .scaledToFit()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                        .frame(width: 140, height: 250)
                        .padding(.horizontal)
                        .padding(.top, 48)
                    
                    Text("Myanmar")
                        .font(.system(size: 10, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.bottom, 60)
                }
                .padding(.leading, UIScreen.main.bounds.width * 0.6)
                
                Spacer()
                
                HStack {
                    ScrollView(.horizontal) {
                        
                        HStack(spacing: 5) {
                            Text(MATUPI)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color("primary"))
                                .clipShape(Capsule())
                            
                            Text(HAKHA)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color("primary"))
                                .clipShape(Capsule())
                            
                            Text(THANTLANG)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color("primary"))
                                .clipShape(Capsule())
                            
                            Text(FALAM)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color("primary"))
                                .clipShape(Capsule())
                            
                            Text(TEDIM)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color("primary"))
                                .clipShape(Capsule())
                            
                            Text(AIZAWL)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color("primary"))
                                .clipShape(Capsule())
                        }
                        .padding(.leading, 24)
                        .padding(.bottom, 40)
                    }
                    
                }
                
            }
    
            
            CityModal(isShowing: $isShowing, selectedCity: $selectedCity)
            
        }
        .onChange(of: isShowing) { value in
            if value == false {
                selectedCity = ""
            }
        }
    }
    
    func updateSelectedCity(city: String) -> () {
        if selectedCity == city {
            selectedCity = ""
        } else {
            selectedCity = city
        }
        isShowing = true
    }
}

struct Geography_Previews: PreviewProvider {
    static var previews: some View {
        Geography()
    }
}


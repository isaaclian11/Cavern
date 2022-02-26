//
//  Geography.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/4/22.
//

import SwiftUI

struct Geography: View {
    
    @State private var selectedCity = 0
    @State private var isShowing = false
    
    private let FALAM = "Falam"
    private let MATUPI = "Matupi"
    private let HAKHA = "Hakha"
    private let AIZAWL = "Aizawl"
    private let TEDIM = "Tedim"
    private let THANTLANG = "Thantlang"
    
    @State var cities = [
        City(id: 0, city_name: "Falam"),
        City(id: 1, city_name: "Matupi"),
        City(id: 2, city_name: "Hakha"),
        City(id: 3, city_name: "Aizawl"),
        City(id: 4, city_name: "Tedim"),
        City(id: 5, city_name: "Thantlang"),
    ]
    
    // gesture props
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        let height = UIScreen.main.bounds.height - 100
        let maxHeight = height - 200

        ZStack {
            
            ZStack {
                ZStack {
                    
                    Image("chin_state")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    
                    // Matupi
                    Image("map_marker")
                        .resizable()
                        .frame(width:20, height: 20)
                        .padding(.top, UIScreen.main.bounds.height * 0.15)
                        .padding(.trailing, UIScreen.main.bounds.width * 0.13)
                        .foregroundColor(selectedCity == 1 && isShowing ? Color.white : Color.black)
                        .onTapGesture {
                            if offset >= 0 {
                                updateSelectedCity(city: 1)
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                            }
                        }
                    
                    // Hakha
                    Image("map_marker")
                        .resizable()
                        .frame(width:20, height: 20)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.2)
                        .padding(.trailing, UIScreen.main.bounds.width * 0.0)
                        .foregroundColor(selectedCity == 2 && isShowing ? Color.white : Color.black)
                        .onTapGesture {
                            if offset >= 0 {
                                updateSelectedCity(city: 2)
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                            }
                        }
                    
                    // Thantlang
                    Image("map_marker")
                        .resizable()
                        .frame(width:20, height: 20)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.24)
                        .padding(.trailing, UIScreen.main.bounds.width * 0.15)
                        .foregroundColor(selectedCity == 5 && isShowing ? Color.white : Color.black)
                        .onTapGesture {
                            if offset >= 0  {
                                updateSelectedCity(city: 5)
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                            }
                        }
                    
                    // Falam
                    Image("map_marker")
                        .resizable()
                        .frame(width:20, height: 20)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.32)
                        .padding(.trailing, UIScreen.main.bounds.width * 0)
                        .foregroundColor(selectedCity == 0 && isShowing ? Color.white : Color.black)
                        .onTapGesture {
                            if offset >= 0  {
                                updateSelectedCity(city: 0)
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                            }
                        }
                    
                    
                    // Tedim
                    Image("map_marker")
                        .resizable()
                        .frame(width:20, height: 20)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.5)
                        .padding(.trailing, UIScreen.main.bounds.width * 0)
                        .foregroundColor(selectedCity == 4 && isShowing ? Color.white : Color.black)
                        .onTapGesture {
                            if offset >= 0  {
                                updateSelectedCity(city: 4)
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                            }
                        }
                    
                    // Aizawl
                    Image("map_marker")
                        .resizable()
                        .frame(width:20, height: 20)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.6)
                        .padding(.trailing, UIScreen.main.bounds.width * 0.55)
                        .foregroundColor(selectedCity == 3 && isShowing ? Color.white : Color.black)
                        .onTapGesture {
                            if offset >= 0  {
                                updateSelectedCity(city: 3)
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                            }
                        }
                }
                
                VStack {
                    ZStack {
                        
                        Image("myanmar_map")
                            .resizable()
                            .scaledToFit()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                            .frame(width: 140, height: 250)
                            .padding(.horizontal)
                            .padding(.top, 16)
                        
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
                                
                                ForEach(cities){city in
                                    
                                    Text(city.city_name)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 16)
                                        .background(Color("primary"))
                                        .clipShape(Capsule())
                                        .onTapGesture {
                                            if !isShowing {
                                                updateSelectedCity(city: city.id)
                                            }
                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            impactMed.impactOccurred()
                                        }
                                }
                            }
                            .padding(.leading, 24)
                            .padding(.bottom)
                        }
                        
                    }
                    
                }
            }
            .onTapGesture {
                if isShowing {
                    updateSelectedCity(city: selectedCity)
                    withAnimation {
                        offset = 0
                    }
                    lastOffset = offset
                }
            }
            .blur(radius: getBlurRadius())
            
            
            ZStack {
                ZStack {
                    CityModal(selectedCity: $selectedCity)
                        .clipShape(RoundedCorners(corners: [.topLeft, .topRight], radius: 30))
                    
                    VStack {
                        
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 40, height: 4)
                            .padding(.top, 10)
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                }
                .offset(y: isShowing ? height - 200 : height)
                .transition(.move(edge: .bottom))
                .offset(y: -offset > 0 ? -offset <= (height - 200) ? offset : -(height - 200) : 0)
                .gesture(DragGesture().updating($gestureOffset, body: {
                    value, out, _ in
                    
                    out = value.translation.height
                    onChange()
                }).onEnded({value in
                    
                    withAnimation {
                        // low, mid, high states
                        if -offset > 200 && -offset < maxHeight / 2 { // mid
                            offset = -(maxHeight / 3)
                        }else if -offset > maxHeight / 2 { // high
                            offset = -maxHeight
                        }else if -offset < 0 {
                            updateSelectedCity(city: selectedCity)
                        }
                        else {
                            offset = 0
                        }
                    }
                    
                    lastOffset = offset
                }))
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
        }
    }
    
    func updateSelectedCity(city: Int) -> () {
        withAnimation {
            self.isShowing.toggle()
        }
        selectedCity = city
    }
    
    func onChange() {
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
    func getBlurRadius() -> CGFloat {
        
        let progress = -offset / (UIScreen.main.bounds.height - 100)
        return progress * 30
    }
}

struct Geography_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct City : Identifiable {
    var id: Int
    var city_name: String
}

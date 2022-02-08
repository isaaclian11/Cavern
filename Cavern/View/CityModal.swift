//
//  CityModal.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/6/22.
//

import SwiftUI

struct CityModal: View {
    
    @Binding var isShowing: Bool
    @Binding var selectedCity: String
    
    @State var currentHeight: CGFloat = 240
    @State private var isDragging = false
    
    let minHeight: CGFloat = 240
    let maxHeight: CGFloat = UIScreen.main.bounds.height - 40
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                        currentHeight = minHeight
                    }
                
                mainView
                    .transition(.move(edge: .bottom))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
        
    }
    
    var mainView: some View {
        VStack {
            
            ZStack {
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.00001)) // for dragging
            .gesture(dragGesture)
            
            ZStack {
                VStack {
                    Text("Falam Township")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("Falam Township is located in the Chin State of Myanmar. It is located 5280 feet above sea level.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal)
                        .padding(.top)
                        
                }
            }
            .frame(maxHeight: .infinity)
            .padding(.bottom, 69)
            
        }
        .frame(height: currentHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: currentHeight / 2)
            }
            .foregroundColor(Color("primary"))
        )
        .animation(isDragging ? nil : .easeInOut(duration: 0.45))
        
    }
    
    @State private var prevDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if !isDragging {
                    isDragging = true
                }
                let dragAmount = val.translation.height - prevDragTranslation.height
                if currentHeight > maxHeight || currentHeight < minHeight {
                    currentHeight -= dragAmount / 6
                } else {
                    currentHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = .zero
                isDragging = false
                if currentHeight > maxHeight {
                    currentHeight = maxHeight
                } else if currentHeight < minHeight {
                    currentHeight = minHeight
                    isShowing = false
                }
            }
    }
}

struct CityModal_Previews: PreviewProvider {
    static var previews: some View {
        CityModal(isShowing: .constant(true), selectedCity: .constant(""))
    }
}

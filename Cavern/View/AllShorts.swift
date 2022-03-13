//
//  AllShorts.swift
//  Cavern
//
//  Created by Isaac Zahau on 3/11/22.
//

import SwiftUI

struct AllShorts: View {
    
    @Binding var shortList: [StoryCard]
    
    @State var stories = [
        
        //<ahref="https://www.vecteezy.com/free-vector/cave">Cave Vectors by Vecteezy</a>
        StoryCard(id: 0, image_uri: "shorts_mountain", title: "The Chin Origin", body: ""),
        
        // <a href="https://www.vecteezy.com/free-vector/cross">Cross Vectors by Vecteezy</a>
        StoryCard(id: 1, image_uri: "bird", title: "Culture", body: ""),
        
        //<a href="https://www.vecteezy.com/free-vector/map">Map Vectors by Vecteezy</a>
        StoryCard(id: 2, image_uri: "bird", title: "Geography", body: "")
    ]
    
    var body: some View {
        
        ZStack{
            
            Color("primary")
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(stories){story in
                        NavigationLink(destination: Short(), label: {
                            ZStack (alignment: .topLeading) {
                                Image(story.image_uri)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 350, height: 500)
                                    .cornerRadius(15)
                                
                                VStack (alignment: .leading, spacing: 2) {
                                    Text("The Chin Origin")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .bold))
                                        .padding(.top, 32)
                                        .padding(.horizontal)
                                    
                                    Text("Learn the history of the Chin people")
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                    
                                }
                            }
                        })
                    }
                }
                .padding(.top, 144)
                .padding(.bottom, 32)
            }
        }
        .ignoresSafeArea()
    }
}

struct AllShorts_Previews: PreviewProvider {
    static var previews: some View {
        AllShorts(shortList: .constant([]))
    }
}

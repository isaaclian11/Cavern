//
//  Home.swift
//  Cavern
//
//  Created by Isaac Zahau on 1/31/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack {
                    
                    Header()
                        .navigationBarHidden(true)
                        .navigationBarTitle(Text("Home"))
                    
                            
                    ScrollView(.vertical, showsIndicators: false) {
                                                    
                        ArticlesView()
                            .padding(.top, 30)
                        
                        ShortsView()
                            .padding(.top, 30)
                        
                        Gallery()
                            .padding(.top, 30)
                            .padding(.horizontal, 8)
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("primary"))
                .preferredColorScheme(.dark)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .accentColor(.white)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct Card : Identifiable {
    
    var id : Int
    var image : String
    var offset : CGFloat
    var title : String
}

struct ShortsView: View {
    
    @State var stories = [
        
        //<ahref="https://www.vecteezy.com/free-vector/cave">Cave Vectors by Vecteezy</a>
        Card(id: 0, image: "bird", offset: 0, title: "The Chin Origin"),
        
        // <a href="https://www.vecteezy.com/free-vector/cross">Cross Vectors by Vecteezy</a>
        Card(id: 1, image: "bird", offset: 0, title: "Culture"),
        
        //<a href="https://www.vecteezy.com/free-vector/map">Map Vectors by Vecteezy</a>
        Card(id: 2, image: "bird", offset: 0, title: "Geography")
    ]
    
    @State var scrolled = 0
    
    var body: some View {
        VStack {
            HStack {
                
                Text("Shorts")
                    .font(.system(size: 40, weight: .regular))
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
            }
            .padding(.horizontal)
            
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(stories){story in
                            NavigationLink(destination: Short(), label: {
                                ZStack (alignment: .topLeading) {
                                    Image(story.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 300, height: 400)
                                        .cornerRadius(15)
                                    
                                    VStack (alignment: .leading, spacing: 2) {
                                        Text("The Chin Origin")
                                            .font(.system(size: 24, weight: .bold))
                                            .padding(.top, 32)
                                            .padding(.horizontal)
                                        
                                        Text("Learn the history of the Chin people")
                                            .padding(.horizontal)

                                    }
                                }
                            })
                        }
                    }
                    .padding(.leading)
                }
            }
        }
    }
    
    func calculateWidth() -> CGFloat {
        
        // Horizontal Padding of 30
        let screen = UIScreen.main.bounds.width - 50
        
        // showing the first three cards and hiding the rest
        
        let width = screen - (2 * 30)
        
        return width
    }
    
}

struct ArticlesView: View {
    
    @State var articles = [
        //<ahref="https://www.vecteezy.com/free-vector/cave">Cave Vectors by Vecteezy</a>
        Card(id: 0, image: "mountain_1", offset: 0, title: "The Chin Origin"),
        
        // <a href="https://www.vecteezy.com/free-vector/cross">Cross Vectors by Vecteezy</a>
        Card(id: 1, image: "mountain_2", offset: 0, title: "Culture"),
        
        //<a href="https://www.vecteezy.com/free-vector/map">Map Vectors by Vecteezy</a>
        Card(id: 2, image: "myanmar", offset: 0, title: "Geography")
    ]
        
    var body: some View {
                
        VStack {
            
            HStack {
                
                Text("Read")
                    .font(.system(size: 40, weight: .regular))
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
            }
            .padding(.leading)
            
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 20) {
                        ForEach(articles){article in
                            
                            NavigationLink(destination: {
                                if article.id == 2 {
                                    Geography()
                                } else {
                                    Article()
                                }
                            }, label: {
                                ZStack(alignment: .bottom) {
                                    Image(article.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 200)
                                        .cornerRadius(15)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        HStack {
                                            Text(article.title)
                                                .font(.system(size: 16))
                                                .fontWeight(.regular)
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                        }
                                                                                
                                        Text("5 min read")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(.vertical, 6)
                                            .padding(.horizontal, 25)
                                            .background(Color("capsule"))
                                            .clipShape(Capsule())
                                    }
                                    .padding(.leading)
                                    .padding(.bottom)
                                }
                            })
                        }
                    }
                    .padding(.leading)
                }
                
            }
        }
    }
}

struct Header: View {
    var body: some View {
        HStack(alignment: .bottom) {
            
            VStack(alignment: .leading) {
                
                Text("Cavern")
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .background(Color("primary"))
            
        }
        .padding()
    }
}

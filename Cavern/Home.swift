//
//  Home.swift
//  Cavern
//
//  Created by Isaac Zahau on 1/31/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
       Learn()
        
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


struct Learn: View {
    
    
    var body: some View {
        
        VStack {
                        
            ScrollView(.vertical, showsIndicators: false) {
                
                Header()

                    
                ArticlesView()
                
                
                ShortsView()
                    .padding(.top, 30)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background((
            LinearGradient(gradient: .init(colors: [Color("primary"), Color("secondary")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        ))
    }
}

struct ShortsView: View {
    
    @State var stories = [
        
        //<ahref="https://www.vecteezy.com/free-vector/cave">Cave Vectors by Vecteezy</a>
        Card(id: 0, image: "cavern", offset: 0, title: "The Chin Origin"),
        
        // <a href="https://www.vecteezy.com/free-vector/cross">Cross Vectors by Vecteezy</a>
        Card(id: 1, image: "cross", offset: 0, title: "Culture"),
        
        //<a href="https://www.vecteezy.com/free-vector/map">Map Vectors by Vecteezy</a>
        Card(id: 2, image: "migration", offset: 0, title: "Geography")
    ]
    
    @State var scrolled = 0
    
    var body: some View {
        VStack {
            HStack {
                
                Text("Shorts")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
            }
            .padding(.horizontal)
            
            ZStack {
                ForEach(stories.reversed()){story in
                    
                    HStack {
                        
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                            
                            Image(story.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            // dynamic frame and height
                                .frame(width: calculateWidth(), height: (UIScreen.main.bounds.height / 1.8) - CGFloat(story.id - scrolled) * 50)
                                .cornerRadius(15)
                            // changing size based on scrolled
                            
                                .offset(x: story.id - scrolled <= 2 ? CGFloat(story.id - scrolled) * 30 : 60)
                            
                            VStack(alignment: .leading, spacing: 18) {
                                
                                HStack {
                                    Text(story.title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                
                                Button(action: {}) {
                                    
                                    Text("5 min read")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 25)
                                        .background(Color("capsule"))
                                        .clipShape(Capsule())
                                }
                            }
                            .frame(width: calculateWidth() - 40)
                            .padding(.leading, 20)
                            .padding(.bottom, 20)
                        }
                        
                        Spacer(minLength: 0)
                    }
                    .contentShape(Rectangle())
                    // gesture
                    .offset(x: story.offset)
                    .gesture(DragGesture().onChanged({ (value) in
                        
                        withAnimation{
                            
                            // disable gesture for final card
                            
                            if value.translation.width < 0 && story.id != stories.last!.id {
                                stories[story.id].offset = value.translation.width
                            }
                            else {
                                
                                // restore all cards
                                
                                if story.id > 0 {
                                    stories[story.id - 1].offset = -(calculateWidth() + 60) + value.translation.width
                                }
                            }
                        }
                        
                    }).onEnded({ (value) in
                        
                        withAnimation {
                            
                            if value.translation.width < 0 {
                                
                                if -value.translation.width > 100 && story.id != stories.last!.id {
                                    
                                    // move card away
                                    stories[story.id].offset = -(calculateWidth() + 60)
                                    scrolled += 1
                                }
                                else {
                                    stories[story.id].offset = 0
                                }
                            }
                            else {
                                
                                if story.id > 0 {
                                    if value.translation.width > 100 {
                                        stories[story.id - 1].offset = 0
                                        scrolled -= 1
                                    }
                                    else {
                                        
                                        stories[story.id - 1].offset = -(calculateWidth() + 60)
                                    }
                                }
                            }
                            
                        }
                    }))
                    
                }
            }
            // max height
            .frame(height: UIScreen.main.bounds.height / 1.8)
            .padding(.horizontal, 25)
            
            Spacer()
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
        Card(id: 0, image: "cross", offset: 0, title: "The Chin Origin"),
        
        // <a href="https://www.vecteezy.com/free-vector/cross">Cross Vectors by Vecteezy</a>
        Card(id: 1, image: "cavern", offset: 0, title: "Culture"),
        
        //<a href="https://www.vecteezy.com/free-vector/map">Map Vectors by Vecteezy</a>
        Card(id: 2, image: "migration", offset: 0, title: "Geography")
    ]
    
    @State var selectedArticle: Card?
    @State var isSelected = false
    
    var body: some View {
                
        VStack {
            HStack {
                
                Text("Read")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
            }
            .padding(.leading)
            
            HStack {
                
                ScrollView(.horizontal) {
                    
                    HStack (spacing: 20) {
                        
                        ForEach(articles){article in
                            
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
                                            .fontWeight(.bold)
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
                            .onTapGesture {
                                self.selectedArticle = article
                                self.isSelected.toggle()
                            }
                        }
                    }
                    .padding(.leading)
                }
                
            }
            .fullScreenCover(isPresented: $isSelected, content: Article.init)
            
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

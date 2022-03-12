//
//  Home.swift
//  Cavern
//
//  Created by Isaac Zahau on 1/31/22.
//

import SwiftUI
import WaterfallGrid

struct Home: View {
    
    @ObservedObject var galleryViewModel = GalleryViewModel()
    
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
                .background(Color("primary"))
                .preferredColorScheme(.dark)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            
        }
        .onAppear(perform: {
            galleryViewModel.getGallery()
        })
        .accentColor(.white)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}

struct Card : Identifiable {
    
    var id : Int
    var image_uri : String
    var title : String
    var body : String
}

struct ShortsView: View {
    
    @State var stories = [
        
        //<ahref="https://www.vecteezy.com/free-vector/cave">Cave Vectors by Vecteezy</a>
        Card(id: 0, image_uri: "shorts_mountain", title: "The Chin Origin", body: ""),
        
        // <a href="https://www.vecteezy.com/free-vector/cross">Cross Vectors by Vecteezy</a>
        Card(id: 1, image_uri: "bird", title: "Culture", body: ""),
        
        //<a href="https://www.vecteezy.com/free-vector/map">Map Vectors by Vecteezy</a>
        Card(id: 2, image_uri: "bird", title: "Geography", body: "")
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
                                    Image(story.image_uri)
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
    
}

struct ArticlesView: View {
    
    @ObservedObject var articleViewModel = ArticleViewModel()
    
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
                        ForEach($articleViewModel.list) { $article in
                            
                            NavigationLink(destination: {
                                Article(article: $article)
                            }, label: {
                                ZStack(alignment: .bottom) {
                                    Image(article.image_uri)
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
    
    init() {
        articleViewModel.getArticles()
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
            
            Image("logo2")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .background(Color("primary"))
            
        }
        .padding()
    }
}

struct Gallery: View {
    
    @ObservedObject var galleryViewModel = GalleryViewModel()
    
    @State var pictureData = [
        PictureModel(id: "id1", title: "Traditional Clothing", image_uri: "traditional", photographer: "John Doe", body: "")
//        PictureModel(id: "id2", title: "River", image_uri: "mountain_1", photographer: "John Doe", body: ""),
//        PictureModel(id: "id3", title: "Boat", image_uri: "mountain_2", photographer: "John Doe", body: "")
    ]
    
    var body: some View {
        ZStack {
            
            Color("primary")
            
            VStack {
                HStack {
                    Text("Gallery")
                        .font(.system(size: 40, weight: .regular))
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                }
                .padding(.horizontal)
                
                WaterfallGrid($pictureData) { $image in

                    NavigationLink(destination: PictureInfo(selectedImage: $image), label: {

                        Image(image.image_uri)
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                    })
                        .fixedSize(horizontal: false, vertical: true)

                }
                .gridStyle(
                    columns: 2
                )
            }
        }
    }
    
    init() {
        galleryViewModel.getGallery()
    }
}

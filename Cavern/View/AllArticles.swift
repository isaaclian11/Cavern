//
//  AllArticles.swift
//  Cavern
//
//  Created by Isaac Zahau on 3/12/22.
//

import SwiftUI

struct AllArticles: View {
    
    @Binding var articles : [ArticleModel]
    @State var mockArticles = [
        ArticleModel(id: "id1", title: "The Chin Origin", body: "", image_uri: "mountain_1", ordinal: 1),
        ArticleModel(id: "id2", title: "The Chin Culture", body: "", image_uri: "mountain_2", ordinal: 1),
        ArticleModel(id: "id3", title: "The Chin Religion", body: "", image_uri: "story", ordinal: 1)
    ]
    
    var body: some View {
        ZStack {
            
            Color("primary")
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack (spacing: 20) {
                    ForEach($mockArticles) { $article in
                        NavigationLink(destination: {
                            Article(article: $article)
                        }, label: {
                            ZStack(alignment: .bottomLeading) {
                                Image(article.image_uri)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 350, height: 400)
                                    .cornerRadius(15)
                                
                                VStack(alignment: .leading) {
                                    Text(article.title)
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.white)
                                    
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
                .padding(.top, 144)
                .padding(.bottom, 32)
            }
        }
        .ignoresSafeArea()
    }
}

struct AllArticles_Previews: PreviewProvider {
    static var previews: some View {
        AllArticles(articles: .constant([]))
    }
}

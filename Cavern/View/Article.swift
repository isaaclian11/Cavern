//
//  Article.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/1/22.
//

import SwiftUI

struct Article: View {
    
    @Binding var article : ArticleModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Color("primary")
            
            ScrollView(.vertical) {
                ZStack {
                    
                    VStack(alignment: .leading) {
                        
                        Image(article.image_uri)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding(.top, 80)
                            .padding(.horizontal)
                        
                        Text(article.title)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.top)
                            .padding(.leading)
                        
                        Text(article.body)
                            .lineSpacing(10)
                            .font(.body)
                            .foregroundColor(Color.white)
                            .padding()
                        
                        Spacer()
                    }
                }
            }
            .padding(.top, 40)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Article_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct ArticleComponents: Identifiable {
    var id: String
    var title: String
    var text: String
}

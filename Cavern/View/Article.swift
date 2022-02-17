//
//  Article.swift
//  Cavern
//
//  Created by Isaac Zahau on 2/1/22.
//

import SwiftUI

struct Article: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Color("primary")
            
            ScrollView(.vertical) {
                ZStack {
                    
                    VStack(alignment: .leading) {
                        
                        Image("mountain_1")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding(.top, 80)
                            .padding(.horizontal)
                        
                        Text("The Chin Origin")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.top)
                            .padding(.leading)
                        
                        Text("It is estimated that at least 60,000 Chin refugees are living in India while more than 20,000 Chin refugees are living in Malaysia.  Several thousands more are scattered in North America, Europe, Australia and New Zealand (Chin Human Rights Organization, 2010).The majority of Chin refugees entering the United States and coming to Seattle are Christians who are either young, single males or young couples (20-40 years old), some with children.")
                            .lineSpacing(10)
                            .font(.body)
                            .foregroundColor(Color.white)
                            .padding()
                        
                        Text("Most are uneducated and come from villages.  Many are pushed to leave by their parents for fear that they will be forced by the government to take part in dangerous or difficult jobs that range from road paving to human mine sweeping – it has been documented that civilians forced to porter in Burma’s conflict areas are sometimes sent before the troops so that they will detonate mines  (Online Burma/Myanmar Library, 2010).  The government is known to treat ethnic groups and non-Buddhists more harshly than the predominant Burman ethnic group (68%) and Buddhists (89%) (CIA World Factbook, 2009).")
                            .lineSpacing(10)
                            .font(.body)
                            .foregroundColor(Color.white)
                            .padding()
                             
                         Text("The Chins are a double minority, explained one refugee interviewed for this profile.  Because of this discrimination, some Chin refugees may not want to be called Burmese.The Chins who flee Burma usually enter the United States directly from Thailand, Malaysia, and India. For most leaving Burma, the trip is illegal, dangerous, and expensive.  There are brokers involved who charge approximately $1000 per person to transport refugees across the border.  If those fleeing are caught by either the Burmese government or the government of the country they are trying to enter, they face imprisonment that may include harsh treatment such as being beaten.  Those in refugee camps (located mainly in Thailand) are told that it will be easier to gain entry into the United States if they have children, thus many young, new parents (sometimes still in their teen years) are entering the United States and need jobs immediately in order to support their young families.")
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
        Article()
    }
}

struct ArticleComponents: Identifiable {
    var id: String
    var title: String
    var text: String
}

//
//  ContentView.swift
//  LearnByDoing
//
//  Created by Lori Rothermel on 6/24/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        let cards: [Card] = cardData
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { card in
                    CardView(card: card)
                }  // ForEach
            }  // HStack
            .padding(15)
        }  // ScrollView
        
        .padding()
        
        
    }  // some View
}  // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//    .onAppear {
//                Thread.sleep(forTimeInterval: 3.0)
//            }

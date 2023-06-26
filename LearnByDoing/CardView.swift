//
//  CardView.swift
//  LearnByDoing
//
//  Created by Lori Rothermel on 6/24/23.
//

import SwiftUI

struct CardView: View {
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    var card: Card
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }  // VStack
            .offset(y: moveDownward ? -218 : -300)
            
            Button {
                self.showAlert.toggle()
                playSound(sound: "sound-chime", type: "mp3")
                self.hapticImpact.impactOccurred()
            } label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                    
                }  // HStack
                .padding(.vertical)
                .padding(.horizontal, 50)
                .background(
                    LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                )  // .background
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }  // Button
            .offset(y: moveUpward ? 210 : 300)
            
        }  // ZStack
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
        )  // .background
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear {
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }  // withAnimation
            
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownward.toggle()
                self.moveUpward.toggle()
            }  // withAnimation
            
        }  // .onAppear
        .alert(isPresented: $showAlert) {
            Alert(title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("OK")))
        }  // .alert
        
    }  // some View
}  // CardView


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  ContentView.swift
//  newIOS
//
//  Created by omar almutairi on 22/08/2021.
//

import SwiftUI

struct ContentView: View {
    

    @State
    var sportEmojis = ["⚽️","🏀","🏈","🎾","🏐","🏉","🥏","🎱","🏓","🏸","🏒","🥍","🏏","🪃","🥅","⛳️","🪁","🏹","🎣","🤿"]
    @State
    var animalEmojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐵","🐸","🐔","🐧"]
    @State
    var foodEmojis = ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🍅","🌶","🥕","🌽","🥬"]
    @State
    var currentEmojis = ["⚽️","🏀","🏈","🎾","🏐","🏉","🥏","🎱","🏓","🏸","🏒","🥍","🏏","🪃","🥅","⛳️","🪁","🏹","🎣","🤿"]
    
    func changeMode(nextMode: Array<String>){
        currentEmojis = nextMode
        currentEmojis = currentEmojis.shuffled()
    }
    @State var emojiCount = 12
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            HStack{
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]){
                ForEach(currentEmojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                        .aspectRatio(2/3, contentMode:.fit)
                    }
                }
                }
            }
            .foregroundColor(.red)
            HStack{
                animalMode
                Spacer()
                sportMode
                Spacer()
                foodMode
            }.font(.largeTitle)
            .padding(.horizontal)
                }
        .padding(.horizontal)
    }
    
    
    var sportMode: some View{
        Button(
            action: {
                changeMode(nextMode: sportEmojis)
                emojiCount = Int.random(in: 1...12)
            },
            label: {Image(systemName: "car")})
    }
    
    var foodMode: some View{
        Button(
            action: {
                changeMode(nextMode: foodEmojis)
                emojiCount = Int.random(in: 1...12)
                },
            label: {Image(systemName: "gamecontroller")})
    }
    
    var animalMode: some View{
        Button(
            action: {
                changeMode(nextMode: animalEmojis)
                emojiCount = Int.random(in: 1...12)
                },
            label: {Image(systemName: "tortoise")})
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        
        ZStack{
        let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp{
            shape
                .fill()
                .foregroundColor(.white)
            shape
                .strokeBorder(lineWidth: 3.0)
            Text(content)
                .font(.largeTitle)
            } else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}

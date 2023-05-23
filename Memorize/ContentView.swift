//
//  ContentView.swift
//  Memorize
//
//  Created by Anthony Sky Ng-Thow-Hing on 7/1/22.
//

import SwiftUI

struct ContentView: View {
    
    //When viewmodel says something changed, view is rebuilt
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
    @State var emojiCount = 14
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
    
   
}

struct CardView: View { //all structs immutable
    let card: MemoryGame<String>.Card
    @State var isFaceUp: Bool = true //pointer to a boolean
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else{
               shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            
    }
}

//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anthony Sky Ng-Thow-Hing on 10/8/22.
//

import SwiftUI

//Viewmodel that creates the models to be displayed
// 'the truth' in our app for our UI
//Gatekeeper protects the model from being changed from the UI
class EmojiMemoryGame: ObservableObject {
    
    //global but nested in EmojiMemoryGame
    //attatched to emojimemorygame type and exists once in entire app
    static let emojis = ["🚂", "🚀" ,"🚆" ,"🗿", "🗽", "🏟" ,"🏰" ,"🏯", "🗼", "🎡" ,"🎢" ,"🎠", "⛲️", "⛱"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) {pairIndex in emojis[pairIndex] }
    }
    
    //Automatically does objectWillChange.send()
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //Intents
    
    func choose(_ card: MemoryGame<String> .Card){
        //Automatically does objectWillChange.send()
        model.choose(card)
    }
    
}

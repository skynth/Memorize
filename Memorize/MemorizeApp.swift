//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Anthony Sky Ng-Thow-Hing on 7/1/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() //creating emoji memory game with free init
    var body: some Scene { 
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

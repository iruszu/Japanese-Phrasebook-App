//
//  PhraseCell.swift
//  JPNPhrasebook
//
//  Created by Kellie Ho on 2025-05-15.
//

import SwiftUI
import SwiftData

struct PhraseCell: View {
    let phrase: Phrase //Phrase is a model we've defined already
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 10){
            HStack(alignment: .top, spacing: 40) {
                Text("Phrase")
                    .font(.headline)
                    .foregroundColor(.blue)
                Text(phrase.text)
      
            }
            HStack(alignment: .top){
                Text("Translation")
                    .font(.headline)
                    .foregroundColor(.blue)
                Text(phrase.translation)
         
            }
            
            HStack(alignment: .top, spacing: 23) {
                Text("Category")
                    .font(.headline)
                    .foregroundColor(.blue)
                Text(phrase.category)

                
            }

        }
            
    }
}

#Preview {
    PhraseCell(phrase: .init(text: "こんにちは", category: "Greetings", translation: "hello"))
}

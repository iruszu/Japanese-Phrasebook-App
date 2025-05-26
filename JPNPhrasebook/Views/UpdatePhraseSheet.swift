//
//  UpdatePhraseSheet.swift
//  JPNPhrasebook
//
//  Created by Kellie Ho on 2025-05-16.
//

import SwiftUI

struct UpdatePhraseSheet: View {
    
    @Bindable var phrase: Phrase
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Phrase", text: $phrase.text)
                TextField("Translation", text: $phrase.translation)
                TextField("Category", text: $phrase.category)
            }
            .navigationTitle("Update Phrase")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}


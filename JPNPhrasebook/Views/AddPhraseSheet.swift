//
//  AddPhraseSheet.swift
//  JPNPhrasebook
//
//  Created by Kellie Ho on 2025-05-15.
//

import SwiftUI
import SwiftData

struct AddPhraseSheet: View {
    
    @Environment(\.modelContext) private var context //to save content to 
    @Environment(\.dismiss) private var dismiss
    @State private var text: String = ""
    @State private var translation: String = ""
    @State private var category: String = ""
    

    
    var body: some View {
    
        
        NavigationStack{
            Form{
                TextField("Phrase", text: $text)
                TextField("English Translation", text: $translation)
                TextField("Category", text: $category)
                //Category section NOT FINISHED - wishlist: make data persist
                
                
            }
            .navigationTitle("Add Phrase")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        // wishlist: save()
                        
                        let phrase = Phrase(text: text, category: category, translation: translation)
                        context.insert(phrase)
                        
                        dismiss()
                        
                    }
                }
                
                
                
            }
            
        }
        
    }
}

#Preview {
    AddPhraseSheet()
}

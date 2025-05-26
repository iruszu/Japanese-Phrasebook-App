//
//  ContentView.swift
//  JPNPhrasebook
//
//  Created by Kellie Ho on 2025-05-06.
//


import SwiftUI
import SwiftData

struct MainView: View {
    @Query var phrases: [Phrase] //amount of phrases shown starts at 0, we are fetching the phrases
    @State private var isShowingPhraseSheet = false
    @State private var phraseToEdit: Phrase? // edit phrase sheet shown for specific phrase (hence why we use "Phrase?")
    @Environment(\.modelContext) private var context
    @State private var searchPhrase = ""
    
    var filteredSearch: [Phrase] {
        guard !searchPhrase.isEmpty else { //if searchPhrase is empty, return normal phrase - otherwise if it is not empty (text in search bar) then return phrases that match the text
            return phrases
        }
    return phrases.filter {
        $0.text.localizedCaseInsensitiveContains(searchPhrase)
        }
    }
    
    
    var body: some View {

        NavigationStack {
            List {
                //ForEach function to show phrases
                ForEach(filteredSearch) { phrase in PhraseCell(phrase: phrase).onTapGesture {
                    phraseToEdit = phrase
                } }.onDelete {
                    indexSet in
                    for index in indexSet {
                        context.delete(phrases[index])
                    }
                }
            }
            .searchable(text: $searchPhrase, prompt: "Search Phrases")
            .navigationTitle("単語リスト")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingPhraseSheet) {
                AddPhraseSheet()
            }
            .sheet(item: $phraseToEdit) {
                phrase in UpdatePhraseSheet(phrase: phrase) //UpdatePhraseSheet(phrase: phrase) returns the view with a selected phrase passed into it
            }
            .toolbar {
                if !phrases.isEmpty {
                    Button("Add Phrase", systemImage: "plus") {
                        isShowingPhraseSheet = true
                    }
                }
            }
            .overlay {
                if phrases.isEmpty {
                    // wishlist
                    ContentUnavailableView(label: {
                        Label("No Phrases", systemImage: "list.bullet")}, description: {
                            Text("Add your first phrase to see it here!")}, actions: {
                                Button("Add Phrase") {
                                    isShowingPhraseSheet = true
                                }.buttonStyle(.borderedProminent)
                            }
                    ).offset(y: -65)
                 
                        }
            }
                }
    }
 
                
                
            }
        
        


#Preview {
    MainView()
}

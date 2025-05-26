//
//  JPNPhrasebookApp.swift
//  JPNPhrasebook
//
//  Created by Kellie Ho on 2025-05-06.
//

import SwiftUI

@main
struct JPNPhrasebookApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [Phrase.self])
    }
}

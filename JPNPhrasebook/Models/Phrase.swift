//
//  Phrase.swift
//  JPNPhrasebook
//
//  Created by Kellie Ho on 2025-05-15.
//

import Foundation
import SwiftData


@Model
@MainActor

class Phrase {
    var text: String
    var translation: String
    var category: String
    init(text: String, category: String, translation: String) {
        self.text = text
        self.category = category
        self.translation = translation
    }
}

//
//  UserDefaults+Properties.swift
//  ElegantEmojiPicker
//
//  Created by Valentin Perignon on 04.06.2025.
//

import Foundation

extension UserDefaults {
    var emojisUsage: [Emoji: Int] {
        get {
            return dictionary(forKey: "emojiUsage") as? [Emoji: Int] ?? [:]
        }
        set {
            set(newValue, forKey: "emojiUsage")
        }
    }
}

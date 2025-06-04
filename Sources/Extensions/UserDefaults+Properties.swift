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
            guard let encodedValue = data(forKey: "emojisUsage"),
                  let decodedValue = try? JSONDecoder().decode([Emoji: Int].self, from: encodedValue) else {
                return [:]
            }

            return decodedValue
        }
        set {
            guard let encodedValue = try? JSONEncoder().encode(newValue) else { return }
            set(encodedValue, forKey: "emojisUsage")
        }
    }
}

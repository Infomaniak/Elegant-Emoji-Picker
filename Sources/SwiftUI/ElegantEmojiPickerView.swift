//
//  ElegantEmojiPickerView.swift
//  ElegantEmojiPicker
//
//  Created by Valentin Perignon on 02.06.2025.
//

import SwiftUI

@available(iOS 14.0, *)
public struct ElegantEmojiPickerView: UIViewControllerRepresentable {
    @Binding var selectedEmoji: Emoji?

    private let configuration: ElegantConfiguration
    private let localization: ElegantLocalization
    private let backgroundColor: Color
    private let sourceNavigationBarButton: UIBarButtonItem?

    public init(
        selectedEmoji: Binding<Emoji?>,
        configuration: ElegantConfiguration = ElegantConfiguration(),
        localization: ElegantLocalization = ElegantLocalization(),
        background: Color,
        sourceNavigationBarButton: UIBarButtonItem? = nil
    ) {
        _selectedEmoji = selectedEmoji

        self.configuration = configuration
        self.localization = localization
        self.backgroundColor = background
        self.sourceNavigationBarButton = sourceNavigationBarButton
    }

    public func makeUIViewController(context: Context) -> ElegantEmojiPicker {
        let emojiPicker = ElegantEmojiPicker(
            delegate: nil,
            configuration: configuration,
            localization: localization,
            background: UIColor(backgroundColor),
            sourceNavigationBarButton: sourceNavigationBarButton
        )

        return emojiPicker
    }

    public func updateUIViewController(_ emojiPicker: ElegantEmojiPicker, context: Context) {
        // Not needed
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(selectedEmoji: _selectedEmoji)
    }
}

@available(iOS 14.0, *)
public extension ElegantEmojiPickerView {
    final class Coordinator: ElegantEmojiPickerDelegate {
        private var selectedEmoji: Binding<Emoji?>

        public init(selectedEmoji: Binding<Emoji?>) {
            self.selectedEmoji = selectedEmoji
        }

        public func emojiPicker(_ picker: ElegantEmojiPicker, didSelectEmoji emoji: Emoji?) {
            selectedEmoji.wrappedValue = emoji
        }
    }
}

@available(iOS 14.0, *)
#Preview {
    ElegantEmojiPickerView(selectedEmoji: .constant(nil), background: .white)
        .ignoresSafeArea()
}

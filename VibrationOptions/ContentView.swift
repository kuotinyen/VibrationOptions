//
//  ContentView.swift
//  VibrationOptions
//
//  Created by TING YEN KUO on 2023/7/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VibrationListView()
    }
}

#Preview {
    ContentView()
}

// MARK: - View

struct VibrationListView: View {
    let vibrations = Vibration.allCases

    var body: some View {
        List(vibrations, id: \.self) { vibration in
            Button(action: {
                vibration.vibrate()
            }) {
                Text(vibration.rawValue.capitalized)
            }
        }
    }
}

// MARK: - enum

import UIKit
import AudioToolbox

enum Vibration: String, CaseIterable {
    case error
    case success
    case warning
    case light
    case medium
    case heavy
    case soft
    case rigid
    case selection
    case oldSchool
    
    public func vibrate() {
        switch self {
        case .error:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        case .success:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case .warning:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        case .light:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .medium:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .heavy:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        case .soft:
            if #available(iOS 13.0, *) {
                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
            }
        case .rigid:
            if #available(iOS 13.0, *) {
                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
            }
        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()
        case .oldSchool:
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
}


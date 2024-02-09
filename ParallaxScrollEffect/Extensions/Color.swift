import Foundation
import SwiftUI

extension Color {
    // Erstellt eine zufällige Farbe
    static var random: Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

// Struktur zum Bereitstellen von Mock-Daten
struct MockData {
    // Array von zufälligen Farben
    static let colors = [Color.random
    ]
}

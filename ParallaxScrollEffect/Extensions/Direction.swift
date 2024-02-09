import Foundation
import SwiftUI

// Eine einfache Enumeration "Direction" mit den Richtungen: oben (up), unten (down), links (left) und rechts (right)
enum Direction {
    case up, down, left, right

    // Eine berechnete Eigenschaft (computed property) "imageName", die basierend auf der Richtung den entsprechenden Bildnamen zurückgibt
    var imageName: String {
        switch self {
        case .up: return "arrow.up"
        case .down: return "arrow.down"
        case .left: return "Vectorleft"
        case .right: return "Vectorright"
        }
    }
}

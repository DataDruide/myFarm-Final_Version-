import SwiftUI
import Foundation

// Enum, um die Schritte des Onboarding-Prozesses darzustellen
enum OnboardingStep: Int {
    case step1 = 1
    case step2 = 2
    case step3 = 3
    
    // Gibt den Titel für jeden Schritt zurück
    var title: String {
        switch self {
        case .step1:
            return "Willkommen\nbei MyFarm!"
        case .step2:
            return "Entdecken Sie Ihren Garten"
        case .step3:
            return "Ihre Suche ist vorbei!"
        }
    }
    
    // Gibt den Dateinamen für das Bild jedes Schritts zurück
    var imageName: String {
        switch self {
        case .step1:
            return "bild1"
        case .step2:
            return "bild2"
        case .step3:
            return "bild3"
        }
    }
    
    // Gibt die Beschreibung für jeden Schritt zurück
    var description: String {
        switch self {
        case .step1:
            return "Wir von myFArm, machen ihren Traum\neines Gartens wahr"
        case .step2:
            return "Wir haben alle Werkzeuge, Tipps\nund Pflanzen,\ndie Sie benötigen."
        case .step3:
            return "MyFarm ist Ihr Begleiter für\neine erfolgreiche Gartensaison!"
        }
    }
}

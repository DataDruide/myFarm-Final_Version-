import Foundation
import SwiftUI

// Eine SwiftUI-Ansicht, die einen Onboarding-Schritt darstellt
struct OnboardItem: View {
    
    let step: Int
    
    var body: some View {
        // Überprüfen, ob der Schritt im Enum "OnboardingStep" vorhanden ist
        if let title = OnboardingStep(rawValue: step)?.title,
           let imageName = OnboardingStep(rawValue: step)?.imageName,
           let description = OnboardingStep(rawValue: step)?.description {
            // Wenn vorhanden, erstelle eine Instanz von "OnboardItemView" mit den erhaltenen Informationen
            return AnyView(OnboardItemView(title: title, image: imageName, description: description))
        } else {
            // Falls nicht, zeige eine Fehlermeldung an
            return AnyView(Text("Fehler beim Laden des Onboarding-Schritts.")
                .foregroundColor(.red))
        }
    }
}

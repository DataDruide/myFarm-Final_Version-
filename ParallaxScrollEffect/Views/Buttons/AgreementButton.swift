import Foundation  // Importiere das Foundation-Framework
import SwiftUI  // Importiere das SwiftUI-Framework

// Helferansicht für die Schaltfläche zur Zustimmung
struct AgreementButton: View {  // Definition einer Struktur namens "AgreementButton", die die View implementiert
    let title: String  // Titel für die Schaltfläche
    let isSelected: Bool  // Zustand, ob ausgewählt oder nicht
    let action: () -> Void  // Aktion, die beim Klicken auf die Schaltfläche ausgeführt wird
    
    var body: some View {  // Darstellung der Ansicht
        Button(action: action) {  // Definition einer Schaltfläche mit der angegebenen Aktion
            HStack(spacing: 6) {  // Horizontale Anordnung von Elementen mit einem Abstand von 6
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")  // Anzeige eines Kreises oder eines ausgefüllten grünen Kreises basierend auf dem Zustand
                    .foregroundColor(isSelected ? .green : .primary)  // Farbe des Symbols basierend auf dem Zustand
                    .font(.system(size: 20))  // Schriftgröße des Symbols
                Text(title)  // Anzeige des Titels
                    .foregroundColor(.white)  // Textfarbe
                    .font(.custom("Chalkduster", size: 16))  // Benutzerdefinierte Schriftart und Größe
                    .padding(.vertical, 10)  // Vertikales Padding von 10
                    .padding(.horizontal, 10)  // Horizontales Padding von 10
                    .background(Color(red: 0.15, green: 0.35, blue: 0.43))  // Hintergrundfarbe
                    .cornerRadius(10)  // Abrundung der Ecken mit einem Radius von 10
            }
        }
    }
}

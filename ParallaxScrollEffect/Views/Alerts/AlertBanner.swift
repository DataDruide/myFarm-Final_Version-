import SwiftUI  // Importiere das SwiftUI-Framework

struct AlertBanner: View {  // Definition einer Struktur namens "AlertBanner", die die View implementiert
    @State private var isShowingStartViewSheet = false  // Zustandsvariable für das Anzeigen des StartView-Blatts

    var body: some View {  // Darstellung der Ansicht
        VStack(alignment: .center, spacing: 25) {  // Vertikale Anordnung von Elementen mit zentrierter Ausrichtung und einem Abstand von 25
            Image("iconbanner")  // Anzeige eines Bilds mit dem Namen "iconbanner"
                .frame(width: 120, height: 120)  // Festlegen der Breite und Höhe des Bildrahmens
            
            // Untertitel
            Text("Account Erstellt!")  // Anzeige des Texts "Account Erstellt!"
                .font(
                    Font.custom("Montserrat", size: 17)  // Verwendung einer benutzerdefinierten Schriftart und Größe
                        .weight(.medium)  // Festlegen der Schriftgewichtung
                )
                .multilineTextAlignment(.center)  // Zentrierte Ausrichtung des Texts
                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))  // Festlegen der Textfarbe
            
            HStack(alignment: .center, spacing: 10) {  // Horizontale Anordnung von Elementen mit zentrierter Ausrichtung und einem Abstand von 10
                Button(action: {
                    isShowingStartViewSheet = true  // Festlegen des Zustands zum Anzeigen des StartView-Blatts
                }) {
                    Text("Weiter")  // Anzeige des Texts "Weiter"
                        .font(
                            Font.custom("Nunito Sans", size: 14)  // Verwendung einer benutzerdefinierten Schriftart und Größe
                                .weight(.semibold)  // Festlegen der Schriftgewichtung
                        )
                        .kerning(1.25)  // Festlegen des Buchstabenabstands
                        .multilineTextAlignment(.center)  // Zentrierte Ausrichtung des Texts
                        .foregroundColor(.white)  // Festlegen der Textfarbe
                        
                        .frame(width: 200, height: 50)  // Festlegen der Breite und Höhe des Rahmen
                        .background(Color(red: 0.15, green: 0.35, blue: 0.43))  // Festlegen der Hintergrundfarbe
                        .cornerRadius(10)  // Abrundung der Ecken mit einem Radius von 10
                }
                .sheet(isPresented: $isShowingStartViewSheet) {  // Anzeige des StartView-Blatts
                    StartView()  // StartView-Ansicht
                }
            }
            
        }
        .padding(.horizontal, 0)  // Horizontales Padding von 0
        .padding(.vertical, 40)  // Vertikales Padding von 40
        .frame(width: 296, height: 297, alignment: .top)  // Festlegen der Breite, Höhe und Ausrichtung des Rahmens
        .background(.white)  // Festlegen des Hintergrunds auf Weiß
        .cornerRadius(10)  // Abrundung der Ecken mit einem Radius von 10
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)  // Hinzufügen eines Schattens
    }
}

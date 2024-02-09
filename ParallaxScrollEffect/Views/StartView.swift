import SwiftUI

struct StartView: View {
    @StateObject private var viewModel = AppLoadingViewModel()

    var body: some View {
        // ZStack für die Hintergrundfarbe
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(red: 0.65, green: 0.88, blue: 0.76),
                        Color(red: 0.33, green: 0.58, blue: 0.63)
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea() // Ignoriert sichere Bereiche, um die Farbe über den gesamten Bildschirm zu erstrecken

            // ScrollView für vertikales Scrollen
            ScrollView {
                VStack(spacing: 0) {
                    // HomeHeaderView zur Anzeige von Informationen und Filteroptionen
               
                    HomeHeaderView()

                    // HStack mit InfoTextDivider, um Abschnitte zu trennen
                    HStack {
                        InfoTextDivider()
                            .padding(.leading, -180)
                    }

                    // HomeBodyView für den Hauptinhalt
                    HomeBodyView()

                    // Spacer für Abstand
                    Spacer(minLength: 30)

                    // CustomTabView für die Navigation zwischen Tabs
                    CustomTabView()
                }
            }
        }
        .environmentObject(viewModel) // Übergibt das AppLoadingViewModel an die Umgebung
    }
}

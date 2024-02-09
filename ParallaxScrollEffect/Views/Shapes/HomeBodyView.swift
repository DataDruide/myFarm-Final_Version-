import Foundation
import SwiftUI

// Hauptansicht für den Home-Bereich
struct HomeBodyView: View {
    @EnvironmentObject var viewModel: AppLoadingViewModel // EnvironmentObject für ViewModel-Injektion

    @State private var searchText: String = "" // Zustandsvariable für die Sucheingabe

    var body: some View {
        VStack(spacing: 0) {
            StartHeaderSection() // Anfangsheader-Sektion
                .padding()

            HeaderSubSectionLazyGrid() // Header-Unterabschnitt mit LazyGrid-Ansicht
                .padding()
        }
    }
}

import Foundation
import SwiftUI

// Ansicht für den Header-Bereich der Home-Ansicht
struct HomeHeaderView: View {
    @EnvironmentObject var viewModel: AppLoadingViewModel // EnvironmentObject für ViewModel-Injektion

    var body: some View {
        StartTitleView() // Titelansicht, möglicherweise mit dem Namen des Home-Bereichs
            // (Code für TitleView ist in diesem Codeausschnitt nicht enthalten)

        ProductFilterStateShape() // Produktfilter-Statusform, möglicherweise eine visuelle Darstellung des Produktfilters
            // (Code für ProductFilterStateShape ist in diesem Codeausschnitt nicht enthalten)
    }
}

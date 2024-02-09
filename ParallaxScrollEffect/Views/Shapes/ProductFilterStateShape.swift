
import Foundation
import SwiftUI

struct ProductFilterStateShape: View {
    @EnvironmentObject var viewModel: AppLoadingViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) { // Abstand zwischen den Elementen in der HStack
                FilterShape(title: "Alles", color: Color(red: 0.84, green: 0.9, blue: 0.89))
                FilterText(title: "Gärten")
                FilterText(title: "Zubehör")
                FilterText(title: "Emmas Lädle")
            }
            .padding()
        }
    }
}

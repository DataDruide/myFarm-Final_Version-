
import Foundation
import SwiftUI

struct FilterText: View {
    var title: String

    var body: some View {
        Text(title)
            .font(Font.custom("Chalkduster", size: 12))
            .kerning(0.36)
            .foregroundColor(Color(red: 0.4, green: 0.39, blue: 0.38))
    }
}

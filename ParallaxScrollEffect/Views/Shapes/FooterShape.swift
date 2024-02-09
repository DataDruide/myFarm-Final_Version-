
import Foundation
import SwiftUI

struct FooterShape: View {
    var body: some View {
        VStack(spacing: 10) {
            Divider()
            HStack {
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
                Text("© 2023 MyFArm ALL Rechte Vorbehalten.")
                    .font(.footnote)
                    .font(Font.custom("Helvetica", size: 12))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 35)
        }
        .background(Color.gray.opacity(0.12))
    }
}

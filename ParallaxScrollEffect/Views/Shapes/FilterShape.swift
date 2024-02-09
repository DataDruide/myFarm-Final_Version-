
import Foundation
import SwiftUI


struct FilterShape: View {
    var title: String
    var color: Color

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(color)
                .frame(width: 45, height: 25)
                .cornerRadius(29)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .inset(by: 1.5)
                        .stroke(Color(red: 0.34, green: 0.55, blue: 0.49), lineWidth: 3)
                )
            Text(title)
                .font(Font.custom("Chalkduster", size: 12))
                .kerning(0.36)
                .foregroundColor(Color(red: 0.36, green: 0.49, blue: 0.46))
        }
    }
}

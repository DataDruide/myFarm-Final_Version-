

import SwiftUI


struct TermSection: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .font(.custom("Chalkduster", size: 22))
                .foregroundColor(.black)
            Text(content)
                .font(.body)
                .font(Font.custom("Helvetica", size: 16))
                .foregroundColor(.black)
        }
    }
}


import SwiftUI

struct DetailBox: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.custom("Helvetica", size: 15))
                .foregroundColor(Color(.secondaryLabel))
            
            Text(value)
                .font(.custom("Helvetica", size: 12))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.22, green: 0.4, blue: 0.38))
        }
        .padding(15)
        .background(Color(red: 0.29, green: 0.81, blue: 0.53).opacity(0.1))
        .cornerRadius(17)
    }
}


#Preview {
    DetailBox(title: "Product1", value: "true")
}


import SwiftUI

// Definiert eine SwiftUI-Ansicht für den Header
struct StartHeaderView: View {
    var body: some View {
        VStack(spacing: 50) {
            Spacer().frame(height: 60) // Abstand von oben hinzufügen
            
            // Überschrift mit dem lokalisierten String "MyFarm"
            Text(NSLocalizedString("Text2", comment: ""))
                .font(.custom("Chalkduster", size: 45))
                .foregroundColor(Color(red: 0.54, green: 0.78, blue: 0.65))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

            
            Spacer()
        }

    }
}

struct StartHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StartHeaderView()
    }
}

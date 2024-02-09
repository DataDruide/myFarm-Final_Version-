import SwiftUI

struct GardenPlannerHeaderView: View {
    var body: some View {
        VStack {
            // Hintergrundbild für den Kopfbereich
            Image("holzbrett")
            
            // Text "Garden Planner" mit speziellen Stiloptionen
            Text("Garden Planner")
                .font(.custom("Chalkduster", size: 45))  // Benutzerdefinierte Schriftart und Größe
                .fontWeight(.bold)  // Fettdruck
                .foregroundColor(.white)  // Weiße Textfarbe
                .padding()  // Innenabstand um den Text
        }
        .background(Image("holzbrett"))  // Hintergrundbild für den gesamten View
    }
}

#Preview {
    GardenPlannerHeaderView()
}

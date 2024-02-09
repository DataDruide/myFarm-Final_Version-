
import SwiftUI

struct OnboardItemView: View {
    
    var title: String = ""
    var image: String = ""
    var description: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            // Der Rest des Codes bleibt unverändert
            Spacer()
            Spacer()

                       // Fixed size to keep the text position at the top
            Text(title)
                .font(Font.custom("Chalkduster", size: 26))
                .foregroundColor(Color(red: 0.54, green: 0.78, blue: 0.65))
                .fontWeight(.thin)
                .kerning(0.8)
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
           
            // Platzhalter-Spacer, um den Inhalt vertikal zu zentrieren.
            Spacer()
                      
                      // Das Bild des Onboarding-Elements.
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 320, height: 400)
                    .padding(20)
                    .blur(radius: 0.5)
            // .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    .cornerRadius(30)
                    .padding(.horizontal, 20)
                      
            // Platzhalter-Spacer, um den Inhalt vertikal zu zentrieren.
            Spacer()
      
            // Die Beschreibung des Onboarding-Elements.
            Text(description)
                .font(Font.custom("Poppins", size: 14))
                .foregroundColor(.gray)
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
                .multilineTextAlignment(.center)
                .lineLimit(nil) // Setze lineLimit auf nil, um so viele Zeilen wie nötig anzuzeigen.
                .fixedSize(horizontal: false, vertical: true) // Erlaube dem Text, sich vertikal zu erweitern.


        }
    }
}

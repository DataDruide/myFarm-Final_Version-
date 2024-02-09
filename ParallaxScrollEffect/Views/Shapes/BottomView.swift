import SwiftUI

struct BottomView: View {
    var body: some View {
        VStack {
            // Text mit speziellen Stiloptionen
            Text("Oder Drücken Sie hier")
                .font(.custom("Chalkduster", size: 12))  // Benutzerdefinierte Schriftart und Größe
                .fontWeight(.thin)  // Dünne Schriftstärke
                .foregroundColor(.black)  // Schwarze Textfarbe
                .padding(.bottom)  // Unten Abstand hinzufügen
            
            // HStack für die Social-Media-Buttons
            HStack(spacing: 20) { // Abstand zwischen den Buttons
                // Google-Button mit Image und Deep Link
                Button(action: {
                    // Aktion, die bei Klick auf den Google-Button ausgeführt wird (Deep Link)
                    if let url = URL(string: "https://www.google.com/") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image("google-logo")  // Google-Logo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30) // Größe des Logos anpassen
                }
                .padding(10)  // Innenabstand hinzufügen
                .background(Color("customGray"))  // Hintergrundfarbe
                .cornerRadius(10)  // Abrundung der Ecken
                
                // Facebook-Button mit Image und Deep Link
                Button(action: {
                    // Aktion, die bei Klick auf den Facebook-Button ausgeführt wird (Deep Link)
                    if let url = URL(string: "https://www.facebook.com/") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image("facebook-logo")  // Facebook-Logo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30) // Größe des Logos anpassen
                }
                .padding(10)  // Innenabstand hinzufügen
                .background(Color("customGray"))  // Hintergrundfarbe
                .cornerRadius(10)  // Abrundung der Ecken
                
                // Apple-Button mit Image und Deep Link
                Button(action: {
                    // Aktion, die bei Klick auf den Apple-Button ausgeführt wird (Deep Link)
                    if let url = URL(string: "https://www.apple.com/") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image("apple-logo")  // Apple-Logo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30) // Größe des Logos anpassen
                }
                .padding(10)  // Innenabstand hinzufügen
                .background(Color("customGray"))  // Hintergrundfarbe
                .cornerRadius(10)  // Abrundung der Ecken
            }
            .padding(.bottom)  // Unten Abstand hinzufügen
        }
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView()
    }
}

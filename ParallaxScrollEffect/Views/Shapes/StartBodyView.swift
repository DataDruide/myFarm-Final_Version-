
import SwiftUI

struct StartBodyView: View {
    @State private var isAnimated = false // State for animation
    @State private var scale: CGFloat = 0.5

    var body: some View {
        NavigationStack {
            Image("farmer")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
                .cornerRadius(150)
                .padding(.vertical, 20)
                .grayscale(0.5) // Ändere den Wert für die Intensität des Graustufenfilters
                .scaleEffect(isAnimated ? 1.0 : scale) // Verwende die Skalierung je nach Animationszustand
                .animation(.easeInOut(duration: 2.0)) // Animationsdauer und Kurve festlegen
                .onAppear {
                    // Starte die Animation, wenn die Ansicht erscheint
                    withAnimation {
                        isAnimated.toggle()
                    }
                }
        }
    }
}

#Preview {
    StartBodyView()
}

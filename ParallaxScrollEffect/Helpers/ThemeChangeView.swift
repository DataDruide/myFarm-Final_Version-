import SwiftUI

struct ThemeChangeView: View {
    // Die Umgebungseigenschaft, die den aktuellen Farbmodus (Light oder Dark) der App repräsentiert.
    var scheme: ColorScheme
    
    // Property für die Speicherung des ausgewählten Farbthemas des Benutzers.
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    
    // Für den Sliding-Effekt
    @Namespace private var animation
    
    // View-Eigenschaften für die Animation der Mond- und Sonnengrafik.
    @State private var circleOffset: CGSize
    
    // Initialisierung der View und der Animationseigenschaften.
    init(scheme: ColorScheme) {
        self.scheme = scheme
        let isDark = scheme == .dark
        self._circleOffset = .init(initialValue: CGSize(width: isDark ? 30 : 150, height: isDark ? -25 : -150))
    }
    
    var body: some View {
        // Vertikaler Stapel von Ansichtselementen mit einem Abstand von 15 Punkten.
        VStack(spacing: 15) {
            // Hier könnten weitere Ansichtselemente für die Benutzeroberfläche hinzugefügt werden.
            
            // Grafik eines Kreises, der das aktuelle Farbthema repräsentiert.
            Circle()
                .fill(userTheme.color(scheme).gradient)
                .frame(width: 150, height: 150)
                .mask {
                    // Umgekehrte Maske für den Mond- und Sonnen-Sliding-Effekt.
                    Rectangle()
                        .overlay {
                            Circle()
                                .offset(circleOffset)
                                .blendMode(.destinationOut)
                        }
                }
            
            // Texte zur Anzeige von Anweisungen und Informationen für den Benutzer.
            Text("Wähle deinen Style")
                .font(.custom("Chalkduster", size: 24))
                .padding(.top, 25)
            
            Text("Wähle per Tastendruck welche Theme Farbe du auswählen möchtest")
                .multilineTextAlignment(.center)
                .font(Font.custom("Helvetica", size: 18).weight(.thin))
                .padding()
            
            // Benutzerdefinierter Segment-Picker für die Farbthemen.
            HStack(spacing: 0) {
                ForEach(Theme.allCases, id: \.rawValue) { theme in
                    Text(theme.rawValue)
                        .padding(.vertical, 10)
                        .frame(width: 100)
                        .background {
                            ZStack {
                                if userTheme == theme {
                                    Capsule()
                                        .fill(.secondarygreen)
                                        .matchedGeometryEffect(id: "ActiveTab", in: animation)
                                }
                            }
                            .animation(.snappy, value: userTheme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            userTheme = theme
                        }
                }
            }
            .padding(3)
            .background(.primary.opacity(0.3), in: .capsule)
            .padding(.top, 20)
        } // maxHeight 410
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(maxHeight: 410)
        .background(.themeBG)
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 15)
        .environment(\.colorScheme, scheme)
        .onChange(of: scheme, initial: false) { _, newValue in
            // Animation für den Mond- und Sonnen-Sliding-Effekt bei Änderung des Farbmodus.
            let isDark = newValue == .dark
            withAnimation(.bouncy) {
                circleOffset = CGSize(width: isDark ? 30 : 150, height: isDark ? -25 : -150)
            }
        }
    }
}

// Eine Enumeration, die verschiedene Farbthemen für die App definiert.
enum Theme: String, CaseIterable {
    case systemDefault = "Standard"
    case light = "Hell"
    case dark = "Dunkel"
    
    // Funktion, die die Hauptfarbe basierend auf dem ausgewählten Farbthema und dem aktuellen Farbmodus zurückgibt.
    func color(_ scheme: ColorScheme) -> Color {
        switch self {
        case .systemDefault:
            // Wenn das Farbthema auf Standard eingestellt ist, wird die Farbe basierend auf dem aktuellen Farbmodus ausgewählt.
            return scheme == .dark ? .moon : .sun
        case .light:
            // Wenn das Farbthema auf Hell eingestellt ist, wird die Sonnenfarbe zurückgegeben.
            return .sun
        case .dark:
            // Wenn das Farbthema auf Dunkel eingestellt ist, wird die Mondfarbe zurückgegeben.
            return .moon
        }
    }
    
    // Funktion, die den Farbmodus basierend auf dem ausgewählten Farbthema zurückgibt.
    var colorScheme: ColorScheme? {
        switch self {
        case .systemDefault:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

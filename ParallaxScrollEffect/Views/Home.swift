import SwiftUI

// Hauptansicht für die Home-Seite
struct Home: View {
    // Zustand zur Steuerung der Anzeige des WeatherView-Sheets
    @State private var isPresentingWeatherView = false
    // Zustandsobjekt für die Verwaltung der Wetterdaten
    @StateObject private var viewModel = WeatherViewModel()

    // Instanz eines neuen Tipps
    let newStuffTip = NewStuffTip()

    var body: some View {
        NavigationView {
            // ZStack für die Hauptansicht mit Hintergrundfarbe und ScrollView
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                ScrollView(.vertical) {
                    // LazyVStack für die vertikale Anordnung von Ansichten
                    LazyVStack(spacing: 15) {
                        HStack {
                            // Abschnitt für "Unser Gartenfest" mit DummySection
                            DummySection(title: "Wettervorhersage")
                                .foregroundColor(.black)
                            
                            // Button für die Wettervorhersage mit Cloud-Symbol
                            Button(action: {
                                isPresentingWeatherView.toggle()
                            }) {
                                Image(systemName: "cloud.fill")
                                    .font(.system(size: 16))
                                    .symbolEffect(.variableColor.iterative)
                                    .foregroundColor(.black)
                                    .padding(15)
                                    .background(Color.gray.opacity(0.15))
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    .clipShape(Circle())
                            }
                            // Anzeige des WeatherView-Sheets bei Klick auf den Button
                            .sheet(isPresented: $isPresentingWeatherView) {
                                WeatherView()
                            }
                            Spacer()
                        }
                        
                        // Langer Abschnitt für "Gartenschau" mit DummySection
                        DummySection(title: "Wissenswertes", isLong: true)
                        
                        // ParallaxImageView für das erste Bild mit dynamischem Parallax-Effekt
                        ParallaxImageView(useFullWidth: true) { size in
                            Image("pic2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                        }
                        .frame(height: 200)
                        .clipped()
                        
                        // DummySection für "1 Biolädle in der Region"
                        DummySection(title: "1 Biolädle in der Region", isLong: true)
                        
                        Spacer()
                        
                        // ParallaxImageView für das zweite Bild mit dynamischem Parallax-Effekt
                        ParallaxImageView(useFullWidth: true) { size in
                            Image("pic1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                        }
                        .frame(height: 250)
                        .clipped()
                    }
                    // Padding für den gesamten Inhalt der ScrollView
                    .padding(15)
                }
                // Navigation Bar Title Display Mode und Hintergrundfarbe
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.gray.opacity(0.3))
            }
        }
    }
    
    // Funktion für die Erstellung einer Dummy-Sektion mit Titel und Text
    @ViewBuilder
    func DummySection(title: String, isLong: Bool = false) -> some View {
        VStack(alignment: .leading, spacing: 8, content: {
            // Überschrift des Abschnitts
            Text(title)
                .font(.title.bold())
                .foregroundColor(.black)
            
            // Optional langer Textabschnitt
            Text("Das Wetter, ein ewiges Tanzspiel der Elemente, prägt unsere Tage und Nächte. Die Sonne streichelt die Haut, der Regen singt leise Lieder auf dem Dach, und der Wind trägt Geschichten von fernen Orten. Das Wetter ist die Melodie, zu der das Leben tanzt.\(isLong ? " Landwirtschaft ist die essentielle Verbindung zwischen Mensch und Natur. Sie ist nicht nur ein Beruf, sondern eine Lebensweise, die den Rhythmus der Jahreszeiten und die Mysterien des Bodens respektiert. Der Bauer, mit Pflug und Saat in der Hand, wird zum Geschichtenerzähler, der die Erde für kommende Generationen bestellt. Die endlose Weite der Felder ist nicht nur ein Anblick, sondern ein Versprechen - das Versprechen von Fruchtbarkeit, Nachhaltigkeit und Gemeinschaft." : "") ")
                .multilineTextAlignment(.leading)
                .foregroundColor(.black.opacity(0.7))
                .fontWeight(.regular)
                .kerning(1.7)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // ParallaxImageView-Struktur für dynamischen Parallax-Effekt
    struct ParallaxImageView<Content: View>: View {
        var maximumMovement: CGFloat = 100
        var useFullWidth: Bool = false
        
        @ViewBuilder var content: (CGSize) -> Content
        var body: some View {
            GeometryReader {
                let size = $0.size
                let minY = $0.frame(in: .scrollView(axis: .vertical)).minY
                let scrollViewHeight = $0.bounds(of: .scrollView)?.size.height ?? 0
                let maximumMovement = min(maximumMovement, (size.height * 0.35))
                let stretchedSize : CGSize = .init(width: size.width, height: size.height + maximumMovement)
                
                let progress = minY / scrollViewHeight
                let cappedprogress = max(min(progress, 1.0), 0.0)
                
                // Parallax-Image mit dynamischer Größe
                content(size)
                    .frame(width: stretchedSize.width, height: stretchedSize.height)
                    .frame(width: size.width, height: size.height)
                    .overlay(content: {
                        Text("\(cappedprogress)")
                            .font(.title)
                            .foregroundColor(.black)
                    })
                    .clipped()
            }
            .containerRelativeFrame(useFullWidth ? [.horizontal] : [])
        }
    }
}

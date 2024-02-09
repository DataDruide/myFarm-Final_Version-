import SwiftUI

struct GardenListView: View {
    @StateObject var gardenFetcher = GardenFetchViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            // Liste der Gärten
            List {
                if gardenFetcher.gardens.isEmpty {
                    // Meldung, wenn keine Daten vom Server abgerufen werden können
                    Text(NSLocalizedString("Text12", comment: ""))
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(gardenFetcher.gardens.filter {
                        // Filtert die Gärten basierend auf dem Suchtext
                        searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                    }, id: \.id) { garden in
                        NavigationLink(destination: GardenDetailView(garden: garden)) {
                            // HStack mit Bild und Textinformationen für jeden Garten
                            HStack(spacing: 15) {
                                // AsyncImage für das asynchrone Laden von Bildern
                                AsyncImage(url: URL(string: garden.imageURL)) { phase in
                                    switch phase {
                                    case .success(let image):
                                        // Erfolgreiches Laden des Bildes
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(12)
                                    default:
                                        // Placeholder für den Ladeindikator oder Fehleranzeige
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(.green.opacity(0.35))
                                            .frame(height: 200)
                                            .overlay(
                                                Image(systemName: "photo")
                                                    .foregroundColor(.black)
                                            )
                                    }
                                }

                                // VStack mit Textinformationen zum Garten
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        Text(garden.name)
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                    Text(garden.description)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(8)
                        }
                    }
                }
            }
            .searchable(text: $searchText) // Fügt Suchbarkeit zur Liste hinzu
            .navigationBarItems(trailing: TextField("Suchen", text: $searchText)) // Fügt Suchfeld zur Navigationsleiste hinzu
            .onAppear {
                gardenFetcher.loadGardenData() // Lädt die Daten beim Erscheinen der Ansicht
                HapticEngine.trigger() // Triggert ein haptisches Feedback
            }
        }
    }
}



import SwiftUI

struct GardenDetailView: View {
    let garden: Garden

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // AsyncImage für das asynchrone Laden von Bildern
                AsyncImage(url: URL(string: garden.imageURL)) { phase in
                    switch phase {
                    case .success(let image):
                        // Erfolgreiches Laden des Bildes
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                    default:
                        // Placeholder für den Ladeindikator oder Fehleranzeige
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.green.opacity(0.35))
                            .frame(height: 200)
                            .overlay(
                                Image(systemName: "photo")
                                    .foregroundColor(.black)
                            )
                    }
                }

                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 8) {
                    Text(garden.name)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(garden.description)
                        .font(.body)
                }
                .padding(.horizontal)

                // Hier können weitere Details zum Garten hinzugefügt werden
            }
            .padding(.vertical)
        }
        .navigationTitle(garden.name)
    }
}

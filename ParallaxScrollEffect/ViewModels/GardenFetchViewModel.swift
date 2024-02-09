import Foundation
import SwiftUI
import Combine

// ViewModel-Klasse für das Abrufen von Kulturen
class GardenFetchViewModel: ObservableObject {
    // @Published-Variable für die Liste der Kulturen
    @Published var gardens: [Garden] = []

    init() {
        loadGardenData() // Daten laden
    }

    // Funktion zum Laden von Kulturen
    func loadGardenData() {
        if let url = URL(string: "http://localhost:5500/api/v1/gardens") {   // Verbindung zu Localhost
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    print("Keine Daten in der Antwort: \(error?.localizedDescription ?? "Unbekannter Fehler")")
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode([Garden].self, from: data)
                    DispatchQueue.main.async {
                        self.gardens = decodedData
                    }
                } catch {
                    print("Fehler beim Decodieren der Daten: \(error.localizedDescription)")
                }
            }.resume()
        }
    }

    // Funktion zum Filtern von Kulturen
    func filteredGardens(searchText: String) -> [Garden] {
        if searchText.isEmpty {
            return gardens
        } else {
            let lowercasedSearchText = searchText.lowercased()
            return gardens.filter { garden in
                garden.name.lowercased().contains(lowercasedSearchText) ||
                garden.description.lowercased().contains(lowercasedSearchText)
                // Hier können weitere Eigenschaften hinzugefügt werden !!!!
            }
        }
    }
}

import Foundation
import SwiftUI

// ViewModel-Klasse für das Abrufen von Kulturen
class CropFetchViewModel: ObservableObject {
    // @Published-Variable für die Liste der Kulturen
    @Published var crops: [Crop] = []

    init() {
        loadData() // Daten laden
    }

    // Funktion zum Laden von Kulturen
    func loadData() {
        if let url = URL(string: "http://localhost:5500/api/v1/crops") {   // Verbindung zu Localhost
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    print("Keine Daten in der Antwort: \(error?.localizedDescription ?? "Unbekannter Fehler")")
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode([Crop].self, from: data)
                    DispatchQueue.main.async {
                        self.crops = decodedData
                    }
                } catch {
                    print("Fehler beim Decodieren der Daten: \(error.localizedDescription)")
                }
            }.resume()
        }
    }

    // Funktion zum Filtern von Kulturen
    func filteredCrops(searchText: String) -> [Crop] {
        if searchText.isEmpty {
            return crops
        } else {
            let lowercasedSearchText = searchText.lowercased()
            return crops.filter { crop in
                crop.name.lowercased().contains(lowercasedSearchText) ||
                crop.short_description.lowercased().contains(lowercasedSearchText)
                // Hier können weitere Eigenschaften hinzugefügt werden !!!!
            }
        }
    }
}

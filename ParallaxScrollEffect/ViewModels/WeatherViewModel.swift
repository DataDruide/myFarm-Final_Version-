import Foundation

// ViewModel-Klasse für die Wetteransicht
class WeatherViewModel: ObservableObject {
    
    // Published-Variable für die Suchanfrage
    @Published var searchText: String = ""
    
    // Published-Variable für die Wetterdaten
    @Published var weatherData: WeatherResponse?

    // Optional für apiKey
    var apiKey: String? = "5f8f3d6b5c24dfa05dcfc6312d677784"

    // Funktion zur Formatierung der Zeit
    func formattedTime(time: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: date)
    }

    // Funktion zur Suche nach dem Wetter
    func searchWeather() {
        guard let apiKey = apiKey, !searchText.isEmpty else {
            print("Fehler: Ort oder API-Schlüssel fehlen.")
            return
        }

        let apiUrl = "https://api.openweathermap.org/data/2.5/weather"
        let parameters: [String: String] = [
            "q": searchText,
            "appid": apiKey,
            "units": "metric" // Einheiten für die Temperatur angeben (optional)
        ]

        // Netzwerkanfrage durchführen, zum Beispiel mit URLSession
        if let url = URL(string: apiUrl + "?" + parameters.urlEncoded()) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
                        DispatchQueue.main.async {
                            // ViewModel mit den aktuellen Wetterdaten aktualisieren
                            self.weatherData = decodedResponse
                        }
                        return
                    }
                }
                print("Fehler in der API-Anfrage: \(error?.localizedDescription ?? "Unbekannter Fehler")")
            }.resume()
        }
    }
}

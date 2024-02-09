//import Foundation
//import CoreLocation
//import SwiftUI
//import MapKit
//
//// ViewModel-Klasse für die Kartenansicht
//final class MapViewModel: ObservableObject {
//    
//    // CLLocationManager für die Ortungsdienste
//    let locationManager = CLLocationManager()
//
//    // Published-Variable zur Anzeige des Ladezustands
//    @Published var isLoading = false
//    @Published var annotations: [IdentifiablePointAnnotation] = []
//
//    // Funktion zum Überprüfen der Ortungsberechtigung
//    func checkLocationAuthorization() {
//        switch locationManager.authorizationStatus {
//        case .authorizedWhenInUse, .authorizedAlways:
//            // Berechtigung erteilt, du kannst die Ortungsdienste verwenden
//            break
//        case .denied:
//            // Der Benutzer hat die Berechtigung verweigert
//            break
//        case .notDetermined:
//            // Die Berechtigung wurde noch nicht festgelegt, frage den Benutzer nach Erlaubnis
//            locationManager.requestWhenInUseAuthorization() // oder requestAlwaysAuthorization()
//        case .restricted:
//            // Die Berechtigung ist eingeschränkt, z.B. durch Kindersicherungseinstellungen
//            break
//        @unknown default:
//            break
//        }
//    }
//
//
//    // Funktion zum Aktualisieren der Kartenregion basierend auf der ausgewählten Stadt
//    func updateMapRegion(newCity: String, region: Binding<MKCoordinateRegion>) {
//        isLoading = true
//        defer {
//            isLoading = false
//        }
//
//        switch newCity {
//        case "Stuttgart":
//            region.wrappedValue = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.7758, longitude: 9.1829),
//                                                      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
//        case "Ulm":
//            region.wrappedValue = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.4011, longitude: 9.9876),
//                                                      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
//        default:
//            break
//        }
//    }
//
//    // Funktion zum Hinzufügen von Annotationen auf der Karte
//    func addAnnotations(annotations: inout [IdentifiablePointAnnotation]) {
//        let cities: [(String, Double, Double)] = [
//            ("Geislingen", 48.6249, 9.8282),
//            ("Stuttgart", 48.7758, 9.1829),
//            ("Ulm", 48.4011, 9.9876)
//        ]
//
//        for city in cities {
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = CLLocationCoordinate2D(latitude: city.1, longitude: city.2)
//            annotation.title = city.0
//            annotations.append(IdentifiablePointAnnotation(annotation: annotation))
//        }
//    }
//
//
//    // Funktion zum Handhaben von Taps auf der Karte
//    func handleTapOnMap(coordinate: CLLocationCoordinate2D) {
//        print("Tapped on coordinate: \(coordinate)")
//
//        let geocoder = CLGeocoder()
//        geocoder.reverseGeocodeLocation(CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)) { placemarks, error in
//            guard let placemark = placemarks?.first else {
//                print("Keine passenden Ortsmarken gefunden für Koordinaten: \(coordinate)")
//                return
//            }
//
//            // Zugriff auf verschiedene Eigenschaften des CLPlacemark
//            if let name = placemark.name {
//                print("Name: \(name)")
//            }
//            if let thoroughfare = placemark.thoroughfare {
//                print("Straße: \(thoroughfare)")
//            }
//            if let locality = placemark.locality {
//                print("Ort: \(locality)")
//            }
//            // ... fahre fort, um weitere Informationen abzurufen
//
//            // Beachte, dass du für jede Information, die du benötigst, auf die entsprechende Eigenschaft des CLPlacemark zugreifen solltest.
//        }
//    }
//
//
//    // Funktion zum Suchen nach PLZ und Aktualisieren der Kartenregion
//    func searchByZIP(zipCode: String, region: Binding<MKCoordinateRegion>) {
//        isLoading = true
//        defer {
//            isLoading = false
//        }
//
//        let geocoder = CLGeocoder()
//        let address = "PLZ: \(zipCode)"
//        geocoder.geocodeAddressString(address) { placemarks, error in
//            if let error = error {
//                print("Fehler bei Suche nach PLZ: \(error)")
//                return
//            }
//
//            if let placemarks = placemarks, let placemark = placemarks.first {
//                let coordinate = placemark.location?.coordinate
//                region.wrappedValue = MKCoordinateRegion(center: coordinate!, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
//            } else {
//                print("Keine passenden Ortsmarken gefunden für PLZ: \(zipCode)")
//            }
//        }
//    }
//
//}

import UIKit
import CoreLocation

class MapViewController: UIViewController {

    private let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLocationManager()
    }

    func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        handleLocationFailure(error)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            handleLocationUpdate(location)
        }
    }

    // Handle Location Failure
    private func handleLocationFailure(_ error: Error) {
        print("Location Manager failed with error: \(error.localizedDescription)")
    }

    // Handle Location Update
    private func handleLocationUpdate(_ location: CLLocation) {
        print("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
        // Hier können Sie auf die aktualisierten Standortdaten zugreifen und weitere Aktionen durchführen.
    }
}


import Foundation
import CoreLocation
import SwiftUI
import MapKit

// ViewModel-Klasse für die Kartenansicht
final class MapViewModel: ObservableObject {

  // CLLocationManager für die Ortungsdienste
  let locationManager = CLLocationManager()

  // Published-Variablen
  @Published var isLoading = false
  @Published var annotations: [IdentifiablePointAnnotation] = []
  @Published var selectedAnnotation: IdentifiablePointAnnotation? // **Neu: Variable für die ausgewählte Annotation**
  @Published var mapType: MKMapType = .standard // **Neu: Variable für den Kartentyp**

  // Funktionen
    // **Fehlerbehandlung bei der Geocodierung und Adresssuche:**
    private func handleGeocodingError(_ error: Error, completion: @escaping (Result<Void, Error>) -> Void) {
        let localizedDescription = error.localizedDescription
        print("Fehler bei der Geocodierung: \(localizedDescription)")

        // Du kannst den Fehler an das Aufrufende Modul zurückgeben
        completion(.failure(error))
        
        // **Hinweis:** Hier könntest du auch den Benutzer über den Fehler informieren, z.B. durch Anzeigen einer Fehlermeldung.
        // Verwende localizedDescription, um eine für Benutzer verständliche Fehlermeldung zu erstellen.
    }


    // **Möglichkeit, benutzerdefinierte Annotationen hinzuzufügen:**
        func addCustomAnnotation(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, completion: @escaping (Result<Void, Error>) -> Void) {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = title
            annotation.subtitle = subtitle

            let identifiableAnnotation = IdentifiablePointAnnotation(annotation: annotation)
            annotations.append(identifiableAnnotation)
            completion(.success(()))
        }

        // **Hinweis: Hinzugefügt für eine allgemeine Fehlerbehandlung in Funktionen, die einen Result-Typ verwenden.**
        private func handleResultError<T>(_ result: Result<T, Error>, completion: @escaping (Result<T, Error>) -> Void) {
            switch result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                print("Fehler in Funktion: \(error.localizedDescription)")
                completion(.failure(error))
                // **Hinweis:** Hier könnten Sie auch entsprechend auf den Fehler reagieren, z.B., indem Sie eine Fehlermeldung anzeigen.
            }
        }


  // **Integration von weiteren Kartendiensten (z.B. Google Maps):**
  func switchToGoogleMaps() {
    // Implementiere die Integration mit Google Maps
    // **Hinweis:** Dies ist plattformspezifisch und erfordert zusätzliche Bibliotheken.
  }

  // **Vorhandene Funktionen mit Fehlerbehandlung und Kommentaren:**

  func checkLocationAuthorization() {
    switch locationManager.authorizationStatus {
    case .authorizedWhenInUse, .authorizedAlways:
      // Berechtigung erteilt
      break
    case .denied:
      // Berechtigung verweigert
      // **Hinweis:** Informiere den Benutzer und biete die Möglichkeit, die Einstellungen zu ändern.
      break
    case .notDetermined:
      // Berechtigung noch nicht festgelegt
      locationManager.requestWhenInUseAuthorization() // oder requestAlwaysAuthorization()
      break
    case .restricted:
      // Berechtigung eingeschränkt
      // **Hinweis:** Informiere den Benutzer über die Einschränkungen.
      break
    @unknown default:
      break
    }
  }

  func updateMapRegion(newCity: String, region: Binding<MKCoordinateRegion>) {
    isLoading = true
    defer {
      isLoading = false
    }

    switch newCity {
    case "Stuttgart":
      region.wrappedValue = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.7758, longitude: 9.1829),
                                               span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    case "Ulm":
      region.wrappedValue = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.4011, longitude: 9.9876),
                                               span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    default:
      break
    }
  }

//  func addAnnotations() {
//    let cities: [(String, Double, Double)] = [
//      ("Geislingen", 48.6249, 9.8282),
//      ("Stuttgart", 48.7758, 9.1829),
//      ("Ulm", 48.4011, 9.9876)
//    ]
//
//    for city in cities {
//      let annotation = MKPointAnnotation()
//      annotation.coordinate = CLLocationCoordinate2D(latitude: city.1, longitude: city.2)
//      annotation.title = city.0
//      annotations.append(IdentifiablePointAnnotation(annotation: annotation))
//    }
//  }
    
    func addAnnotations(annotations: [IdentifiablePointAnnotation], completion: @escaping (Result<Void, Error>) -> Void) {
        self.annotations.append(contentsOf: annotations)
        completion(.success(()))
    }

    func handleTapOnMap(coordinate: CLLocationCoordinate2D, completion: @escaping (Result<Void, Error>) -> Void) {
        print("Tapped on coordinate: \(coordinate)")

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)) { placemarks, error in
            if let error = error {
                self.handleGeocodingError(error, completion: completion)
                return
            }

            guard let placemark = placemarks?.first else {
                print("Keine passenden Ortsmarken gefunden für Koordinaten: \(coordinate)")
                let customError = NSError(domain: "Geocoding", code: 404, userInfo: [NSLocalizedDescriptionKey: "Keine passenden Ortsmarken gefunden."])
                completion(.failure(customError))
                return
            }

            // Zugriff auf verschiedene Eigenschaften des CLPlacemark
            if let name = placemark.name {
                print("Name: \(name)")
            }
            if let thoroughfare = placemark.thoroughfare {
                print("Straße: \(thoroughfare)")
            }
            if let locality = placemark.locality {
                print("Ort: \(locality)")
            }
            // ... fahre fort, um weitere Informationen abzurufen

            // Aktualisierung der ausgewählten Annotation
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = placemark.name
            annotation.subtitle = "\(placemark.thoroughfare ?? ""), \(placemark.locality ?? "")"

            let identifiableAnnotation = IdentifiablePointAnnotation(annotation: annotation)
            self.selectedAnnotation = identifiableAnnotation

            completion(.success(()))
        }
    }

    func searchByZIP(zipCode: String, region: Binding<MKCoordinateRegion>, completion: @escaping (Result<Void, Error>) -> Void) {
        isLoading = true
        defer {
            isLoading = false
        }

        let geocoder = CLGeocoder()
        let address = "PLZ: \(zipCode)"
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let error = error {
                self.handleGeocodingError(error, completion: completion)
                return
            }

            if let placemarks = placemarks, let placemark = placemarks.first {
                guard let coordinate = placemark.location?.coordinate else {
                    let customError = NSError(domain: "Geocoding", code: 404, userInfo: [NSLocalizedDescriptionKey: "Keine Koordinaten gefunden."])
                    completion(.failure(customError))
                    return
                }

                region.wrappedValue = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

                // Aktualisierung der ausgewählten Annotation
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = placemark.name
                annotation.subtitle = "\(placemark.thoroughfare ?? ""), \(placemark.locality ?? "")"

                let identifiableAnnotation = IdentifiablePointAnnotation(annotation: annotation)
                self.selectedAnnotation = identifiableAnnotation

                completion(.success(()))
            } else {
                let customError = NSError(domain: "Geocoding", code: 404, userInfo: [NSLocalizedDescriptionKey: "Keine passenden Ortsmarken gefunden für PLZ: \(zipCode)"])
                completion(.failure(customError))
            }
        }
    }

}

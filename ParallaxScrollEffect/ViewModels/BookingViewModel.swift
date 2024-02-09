import Foundation
import Combine

// ViewModel-Klasse für die Buchung
class BookingViewModel: ObservableObject {
    
    // Published-Variable für das ausgewählte Produkt
    @Published var selectedProduct: Product?
    
    // Published-Variable für die Produkte im Warenkorb
    @Published var cartProducts: [Product] = []
    
    // Published-Variable für die Gültigkeit der Details
    @Published var areDetailsValid = false
    
    // RentalContract-Objekt für den Mietvertrag
    var rentalContract: RentalContract? // Definiere rentalContract hier

    // Dummy-Eigenschaften nur zu Demonstrationszwecken
    @Published var agreedToTerms: Bool = false
    @Published var sliderValue: Double = 0.0
    @Published var renterName: String = ""
    @Published var duration: Int = 0

    // Funktion zum Hinzufügen eines Produkts zum Warenkorb
    func addProductToCart(_ product: Product?) {
        if let selectedProduct = product, agreedToTerms && sliderValue >= 0.5 {
            addToCart(selectedProduct)
            rentalContract = RentalContract(renterName: renterName, duration: duration)
            areDetailsValid = true
            createOrderInBackend()
        } else {
            areDetailsValid = false
        }
    }

    // Funktion zum Hinzufügen eines Produkts zum Warenkorb
    func addToCart(_ product: Product) {
        // Produkt zum Warenkorb hinzufügen
        cartProducts.append(product)
        selectedProduct = product // Ausgewähltes Produkt im ViewModel aktualisieren
        print("\(product.name) zum Warenkorb hinzugefügt")
        // Hier können zusätzliche Operationen durchgeführt werden, wie z.B. UI-Aktualisierung oder Auslösung anderer Ereignisse
    }

    // Funktion zum Erstellen einer Bestellung im Backend
    func createOrderInBackend() {
        if let rentalContract = self.rentalContract {
            print("Bestellung für \(rentalContract.renterName) mit Dauer \(rentalContract.duration) wird erstellt.")
            // Hier steht dein Netzwerkcode zum Erstellen einer Bestellung
        } else {
            print("Mietvertrag fehlt. Bestellung kann nicht erstellt werden.")
        }
    }
}

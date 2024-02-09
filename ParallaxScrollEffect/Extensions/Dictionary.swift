import Foundation

// Hilfsfunktion zum Codieren von URL-Parametern
extension Dictionary where Key == String, Value == String {
    /**
    Encodes the dictionary into a URL-encoded string format.
     */
    
    // Die Funktion gibt einen URL-codierten String zurück, der aus dem Dictionary erstellt wird
    func urlEncoded() -> String {
        // Verwendet die map-Funktion, um jedes Key-Value-Paar in einen String zu transformieren
        // und dann mit dem Separator "&" zu verbinden
        return self.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}

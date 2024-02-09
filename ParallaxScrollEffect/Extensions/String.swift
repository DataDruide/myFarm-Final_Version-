import Foundation
import CryptoSwift

// Erweiterung für den String-Typ
internal extension String {
    /**
    Gibt den Zeichensatz für den URL-Codierungsprozess gemäß RFC 3986 zurück.
     Auch als Prozentcodierung bezeichnet.
     */
    func getPercentEncodingCharacterSet() -> String {
        let digits = "0123456789"
        let lowercase = "abcdefghijklmnopqrstuvwxyz"
        let uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let unreserved = "-._~"

        return digits + lowercase + uppercase + unreserved
    }

    /**
    Ersetzt reservierte Zeichen für URL gemäß RFC 3986.
     Diese Zeichen sind für eine URL reserviert, müssen jedoch bei der Erstellung der OAuth-Signatur percent-encoded werden.
     */
    func replaceReservedCharacters() -> String {
        return addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "%:/?#[]@!$&'()*+,;= ").inverted)!
    }

    /**
    Erstellt die Signaturzeichenkette basierend auf dem Consumer Key und der Signatur-Basiszeichenkette.
     Verwendet die HMAC-SHA1-Verschlüsselung.
     */
    func getSignature(key: String, params: String) -> String {
        var array = [UInt8]()
        array += params.utf8

        let sign = try! HMAC(key: key, variant: .sha1).authenticate(array).toBase64()

        return sign
    }

    /**
    Bestimmt, ob ein String einen anderen String enthält.
     Gibt einen booleschen Wert zurück.
     */
    func contains(find: String) -> Bool { return self.range(of: find) != nil }
}

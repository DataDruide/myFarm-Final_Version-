import Foundation

// Erweiterung (Extension) für den CharacterSet-Typ
internal extension CharacterSet {
    /**
    Percent encodes string based on the URL encoding process described in RFC 3986.
    https://tools.ietf.org/html/rfc3986#section-2.4
     */
    
    // Berechnete Eigenschaft, die ein neues CharacterSet basierend auf dem Prozent-Encoding-Prozess zurückgibt
    var percentEncoded: CharacterSet {
        // Verwendet die getPercentEncodingCharacterSet-Funktion der String-Erweiterung
        // Dies erstellt ein neues CharacterSet unter Berücksichtigung des URL-Encoding-Prozesses
        get { return CharacterSet.init(charactersIn: String().getPercentEncodingCharacterSet()) }
    }
}

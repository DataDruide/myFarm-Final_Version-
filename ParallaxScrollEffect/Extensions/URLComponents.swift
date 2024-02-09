import Foundation

// Erweiterung für den URLComponents-Typ
internal extension URLComponents {
    /**
    Erstellt URLQueryItems für URLComponent.
     Verwendet für HTTP-Anfragen.
     */
    mutating func componentsForURL(from array: [(key: String, value: String)]) {
        var queryItems = [URLQueryItem]()

        for tuple in array {
            queryItems.append(URLQueryItem(name: tuple.key, value: tuple.value))
        }

        self.queryItems = queryItems
    }

    /**
    Erstellt URLQueryItems für URLComponent.
     Verwendet für OAuth Signature.
     */
    mutating func componentsForOAuthSignature(from array: [(key: String, value: String)]) {
        var queryItems = [URLQueryItem]()

        for tuple in array {
            let key = tuple.key
            var value = tuple.value

            if key == "search_expression" {
                value = value.replaceReservedCharacters()
            }

            queryItems.append(URLQueryItem(name: key, value: value))
        }

        self.queryItems = queryItems
    }

    /**
    Gibt die URL-Parameter zusammengefügt zurück.
     Parameter werden durch '&' getrennt.
     */
    func getURLParameters() -> String {
        guard let queryItems = self.queryItems else {
            return ""
        }

        var params = ""

        for (index, item) in queryItems.enumerated() {
            if let value = item.value {
                params.append("\(item.name)=\(value)")

                if index != queryItems.index(before: queryItems.endIndex) {
                    params.append("&")
                }
            }
        }

        return params
    }
}

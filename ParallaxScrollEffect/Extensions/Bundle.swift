import Foundation

// Setzt die App-Sprache
extension Bundle {
    func setLocalization(language: String) {
        // Setze die Sprache in den UserDefaults
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()

        // Lade die App neu nach Änderung der Sprache
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else {
            return // Abbruch, wenn der Sprachordner nicht gefunden wird
        }

        guard let bundle = Bundle(path: path) else {
            return // Abbruch, wenn der Sprach-Bundle nicht erstellt werden kann
        }

        // Setze die Klassen der Bundles auf PrivateBundle, um die Übersetzungen zu verwenden
        object_setClass(self, PrivateBundle.self)
        object_setClass(bundle, PrivateBundle.self)
    }
}
// Hilfsklasse zum Neuladen der App nach einer Sprachänderung
class PrivateBundle: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        // Überschreibe die localizedString-Methode, um die neue Sprache zu verwenden
        return Bundle.main.localizedString(forKey: key, value: value, table: tableName)
    }
}

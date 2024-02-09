import UIKit

// Eine Klasse für allgemeine Dienstprogrammfunktionen
final class Utilities {
    // Ein statisches Eigenschaftsmuster, um eine einzige Instanz der Klasse zu erstellen
    static let shared = Utilities()
    private init() {}
    
    // Methode, um den obersten Ansichtscontroller zu ermitteln
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        // Wenn der Controller ein UINavigationController ist, rufe diese Methode rekursiv für den sichtbaren Controller im Stapel auf
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        // Wenn der Controller ein UITabBarController ist, rufe diese Methode rekursiv für den ausgewählten Controller auf
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        // Wenn der Controller einen präsentierten Controller hat, rufe diese Methode rekursiv für den präsentierten Controller auf
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        // Wenn kein präsentierter Controller vorhanden ist, gibt den aktuellen Controller zurück
        return controller
    }
}

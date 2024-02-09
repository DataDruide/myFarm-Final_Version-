import Foundation  // Importiere das Foundation-Framework

import TipKit  // Importiere das TipKit-Framework für Tipps in der App

struct NewStuffTip : Tip {  // Definition einer Struktur namens "NewStuffTip", die das Tip-Protokoll implementiert
    
    var title: Text {  // Eigenschaft für den Titel des Tipps
        Text("Hier findet ihr die neusten Produkte")  // Gibt einen Text mit dem Titel zurück
    }
    
    var message: Text? {  // Optionale Eigenschaft für die Nachricht des Tipps
        Text("Klicke hier um zu den News zu gelangen")  // Gibt einen Text mit der Nachricht zurück
    }
    
    var image: Image? {  // Optionale Eigenschaft für das Bild des Tipps
        Image(systemName: "leaf.circle.fill")  // Gibt ein Bild mit dem Symbol "leaf.circle.fill" zurück
    }
}

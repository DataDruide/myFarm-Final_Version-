#Farm App Documentation

Überblick und Erklärung zum App Projekt

Einführung:

Die Farm App wurde entwickelt, um Gartenfreunden und Landwirten eine intuitive Plattform 
für die Planung, Überwachung und Verbesserung ihrer Garten- und Landwirtschaftsprojekte zu bieten. 
Mit einer Vielzahl von Funktionen richtet sich die App an Menschen, die ihre Gartenarbeit optimieren und sich mit Gleichgesinnten vernetzen möchten.

Ziele und Probleme:

Ziele:

- Verbesserung der Effizienz in der Gartenlandwirtschaftsanlage
- Bessere Planung von Gartenprojekten
- Vereinfachung von Arbeitsabläufen
- Informationssammlung zu einzelnen Pflanzen und Gemüsesorten
- Förderung nachhaltiger Praktiken

Probleme:

- Strukturierung und Sammlung aller Daten im Backend
- Debugging der App und Identifikation von Problemen
- Keine Notification Messages implementierbar (da keinen Apple Developer Account besitze)
- bestimmte Kartendaten für die angegebenen Schlüssel abzurufen

Features:

* Authentifizierung mit Firebase:
- Nutzer können sich in der Gartenanlage einloggen, ihre Gartenplanung fortsetzen und die neuesten Ernteergebnisse anderer Gartenfreunde anzeigen, bewerten und kommentieren.
* Abruf von aktuellen Wetterdaten.
* Gärtner Profil anlegen:
- Erstellung eines Gärtnerprofils und Speicherung mit der neuen persistenten Speicherungsmethode in SwiftUI.
* Gartenverfügbarkeit abrufen:
- Anzeige freier vermietbarer Gartenobjekte mit einer Google Maps-Ansicht. Nutzer können ihren Standort im Menü auswählen, um den aktuellen GPS-Standort zu erhalten.
* Wetterdaten abrufen:
- Abruf von Wetterinformationen über eine Textzeile, um bei der Pflanzung und Pflege des Gartens zu helfen.
* Informationen abrufen:
- Über eine WebView kann jederzeit auf das Online-Angebot zurückgegriffen werden, um weitere Informationen zu Pflanzenarten zu erhalten.
* Haptic Feedback (User Rückmeldung)
- Der User verspürt beim Scrollen einer Liste Vibrationen
* Sprache einstellbar
- Es können verschiedene Sprachen ausgewählt werden
* DarkMode implementiert
- Der user kann zwischen .lightMode . darkMode wählen 
* Animationen mit LottieFiles implementiert
- kleine Animationen an versch. Stellen der App für die App Expirience

* Framework Tip implementiert
- Um neuen Stuff / Producte dem User zu präsentieren wenn er bestimmte Views besucht

Systemanforderungen:

Liste der erforderlichen Systemanforderungen, damit Benutzer und Entwickler wissen, welche Voraussetzungen erfüllt sein müssen, 
um die App nutzen oder weiterentwickeln zu können.

Installation und Verfügbarkeit:

Die App wurde bisher nur für iOS entwickelt und getestet.

Verwendung:

Erkläre, wie Benutzer die App verwenden können. Dies kann Tutorials, Screenshots oder Anleitungen 
zum Einrichten und Nutzen der Funktionen beinhalten.

Entwicklerdokumentation:
Falls deine Dokumentation auch für Entwickler gedacht ist, füge eine Sektion hinzu, die Details zur Code-Struktur, APIs, Datenbanken oder anderen technischen Aspekten der App enthält.

Unterstützung und Kontakt:
Bei Fragen oder benötigten Informationen können Sie sich unter mzmann252@gmail.com melden, und ich werde Ihnen so schnell wie möglich antworten.

Versionshistorie:

App Version 1.0 
Backend Version: 1.0

Strukturierung der App in MVVM.
Programmierung der App in SwiftUI.


Detailierte Beschreibung der einzelnen Views und deren Verhalten bei Benutzung

App Start 🚀

Die AppDelegate-Klasse spielt eine zentrale Rolle beim Lebenszyklus der App. In der Methode application(_:didFinishLaunchingWithOptions:) wird Firebase konfiguriert, um sicherzustellen, dass die App Firebase-Dienste korrekt nutzen kann.
    Ausserdem definiert man hier den asyncronen Code der mit .task ausgeführt wird 

2. App-Start:

Die SplashView ist als Startansicht definiert und wird als erstes aufgerufen. Der AuthService wird als EnvironmentObject für die gesamte App bereitgestellt. Ein animierter Text "myFarm" präsentiert die SplashView und den App Start. Nach einer kurzen Verzögerung bewegt sich die App in 3 mögliche Richtungen:

3. Onboarding Prozess 🌈

Hier führt die App neue Nutzer durch einen ansprechenden Onboarding-Prozess, um sie mit den wichtigsten Funktionen vertraut zu machen.
4. Anmeldung / Registrierung 📝 <---> verbunden mit AuthService wo dann auf den Firebase Server zugreift und die OboardingRegeln welcher Log Zustand vorliegt (Login/Logout)

Falls der Nutzer noch nicht angemeldet ist, gelangt er zu einer klaren Anmeldungs- bzw. Registrierungsansicht. Ein einfacher, nutzerfreundlicher Prozess erleichtert den Einstieg.
Weiterleitung zur HomeView 🏡

Bei angemeldeten Nutzern erfolgt eine nahtlose Weiterleitung zur HomeView, wo sie die volle Bandbreite der App-Funktionen erleben können.
Diese durchdachte Struktur gewährleistet einen angenehmen Start für neue Nutzer und eine reibungslose Navigation für bereits registrierte Benutzer. 🌟

5. HomeView

Von hier aus können Sie verschiedene UserFlows verfolgt / gewählt werden. (Je nach Vorhaben)


#Models:

Dienen als Schnittstelle/Kommunikation zwischen View und ViewModel




#ViewModels:

Jedes einzelne ViewModel hat seine View - spezifischen Funktionen und Aufgaben,
ich habe stets bei der Entwicklung immer eine moderne Architekture an den Tag gelegt.

CropFetchViewModel --> ruft eure Pflanzen und eurer Gemüse aus dem Backend ab.
BookingViewModel --> hier soll der Pachtprozess angezeigt und verfolgt werden können.
AppLoadingViewModel --> hier werden alle Dienste und Apis geladen die für den Start oder deren Performance zuständig sind
WeatherViewModel --> ruft ihnen die Tages aktuellen Wetterdaten ab
MapViewModel --> ruft ihnen in Zusammenarbeit mit GoogleMaps die aktuellen freien Gartenplätze an


# Berechtigungen:

FirebaseAppDelegateProxyEnabled Boolean No
Privacy - Location Always and When In Use Usage Description String (aktueller Ort)

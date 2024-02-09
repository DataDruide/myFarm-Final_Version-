import SwiftUI
import SwiftData

//struct AnimateIcon: View {
//    // Der Zustand, der den Favoritenstatus für das Animieren des Icons speichert
//    @State private var isFavorite = false
//
//    var body: some View {
//        // Button zum Umschalten des Favoritenstatus
//        Button {
//            isFavorite.toggle()
//        } label: {
//            // Label mit Systemsymbol "mail.stack"
//            Label("Activate Inbox Zero", systemImage: "mail.stack")
//        }
//        // Füge dem Symbol den Bounce-Effekt hinzu, der durch den Favoritenstatus gesteuert wird
//        .symbolEffect(.bounce, options: .speed(3).repeat(3), value: isFavorite)
//        .font(.title2)
//    }
//}

struct AppSettingView: View {
    // Der benutzerdefinierte Speicher für das App-Thema
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    // Die Umgebungseinstellung für das Farbschema
    @Environment(\.colorScheme) private var scheme
    // Ein Zustand für die Anzeige des ThemeChangeView-Sheets
    @State private var changeTheme: Bool = false
    // Ein Zustand für die Animation des Email-Icons
   // @State private var animateEmailIcon = false
  
    var body: some View {
        // Die Haupt-NavigationView
        NavigationView {
            ZStack {
                VStack {
                    // Liste mit Abschnitten für verschiedene Einstellungen
                    List {
                        Section(header: Text("Allgemein").font(.headline)) {
                            // NavigationLink zu DateTimeSettingsView
                            NavigationLink(destination: DateTimeSettingsView()) {
                                Label("Datum und Uhrzeit einstellen", systemImage: "gear")
                            }
                            // NavigationLink zu LanguageView
                            NavigationLink(destination: LanguageView()) {
                                Label("Sprache Einstellen", systemImage: "person")
                            }
                            // NavigationLink zu CreateProfileView
                            NavigationLink(destination: CreateProfilView()) {
                                Label("Profil erstellen", systemImage: "person")
                            }
                            // NavigationLink zu MyOrdersView
                            NavigationLink(destination: MyOrdersView()) {
                                Label("Mein Garten", systemImage: "leaf")
                                
                            }
                        }
                        // Anpassung der Schriftart und -größe für diesen Abschnitt
                        .font(.custom("Helvetica", size: 20))
                        
                        Section(header: Text("Benachrichtigungen").font(.headline)) {
                            // Toggle für Push-Benachrichtigungen
                            Toggle(isOn: .constant(true)) {
                                Label("Push-Benachrichtigungen", systemImage: "bell")

                            }
//                            // Toggle für animiertes Email-Icon mit AnimateIcon-Ansicht
//                            Toggle(isOn: $animateEmailIcon) {
//                                AnimateIcon()
//                                    .foregroundColor(animateEmailIcon ? .blue : .primary)
//                            }
                        }
                        // Anpassung der Schriftart und -größe für diesen Abschnitt
                        .font(.custom("Helvetica", size: 18))
                        
                        Section(header: Text("Datenschutz").font(.headline)) {
                            // NavigationLink zu TermsOfServiceView
                            NavigationLink(destination: TermsOfServiceView()) {
                                Label("Datenschutzeinstellungen", systemImage: "lock")
                            }
                        }
                        // Anpassung der Schriftart und -größe für diesen Abschnitt
                        .font(.custom("Helvetica", size: 18))
                        
                        Section(header: Text("Anzeige Einstellungen").font(.headline)) {
                            // Button zum Öffnen des ThemeChangeView-Sheets
                            Button("Theme wählen") {
                                changeTheme.toggle()
                            }
                        }
                        // Anpassung der Schriftart und -größe für diesen Abschnitt
                        .font(.custom("Helvetica", size: 18))
                        .foregroundColor(.black)
                    }
                    // Titel der NavigationView
                    .navigationBarTitle("Einstellungen")
                    // Haptisches Feedback beim Erscheinen der Ansicht
                    .onAppear {
                        HapticEngine.trigger()
                    }
                }
                // Anwendung des vom Benutzer ausgewählten Farbschemas auf die gesamte Ansicht
                .preferredColorScheme(userTheme.colorScheme)
                // Anzeige des ThemeChangeView-Sheets, wenn changeTheme true ist
                .sheet(isPresented: $changeTheme, content: {
                    ThemeChangeView(scheme: scheme)
                        .presentationDetents([.height(410)])
                        .presentationBackground(.clear)
                })
            }
        }
    }
}

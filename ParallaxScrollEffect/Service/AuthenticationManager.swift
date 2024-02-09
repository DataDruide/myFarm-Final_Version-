//import FirebaseAuth
//
//// Modell für Authentifizierungsdaten
//struct AuthDataResultModel {
//    let uid: String
//    let email: String?
//    let photoUrl: String?
//    
//    // Initialisierer für das Modell mit einem FirebaseAuth.User-Objekt
//    init(user: FirebaseAuth.User) {
//        self.uid = user.uid
//        self.email = user.email
//        self.photoUrl = user.photoURL?.absoluteString
//    }
//}
//
//
//enum AuthProviderOption: String {
//    case email = "password"
//    case google = "google.com"
//
//}
//
//
//// Managerklasse für die Authentifizierung
//final class AuthenticationManager {
//    // Statische Instanz des Managers für den Zugriff von überall
//    static let shared = AuthenticationManager()
//    // Privater Initialisierer, um Instanzen dieser Klasse außerhalb nicht zu erlauben
//    private init() {}
//    
//    // Funktion zum Abrufen des authentifizierten Benutzers
//    func getAuthenticatedUser() throws -> AuthDataResultModel {
//        // Überprüfe, ob ein aktueller Benutzer vorhanden ist
//        guard let user = Auth.auth().currentUser else {
//            throw URLError(.badServerResponse)
//        }
//        
//        // Erzeuge ein AuthDataResultModel-Objekt und gib es zurück
//        return AuthDataResultModel(user: user)
//    }
//    
//    // google.com
//    // password
//    
//    func getProvider() throws -> [AuthProviderOption] {
//        guard let providerData = Auth.auth().currentUser?.providerData else {
//            throw URLError(.badServerResponse)
//        }
//        var providers: [AuthProviderOption] = []
//        for provider in providerData {
//            if let option = AuthProviderOption(rawValue: provider.providerID) {
//                providers.append(option)
//            } else {
//                assertionFailure("Provider Option not Found: \(provider.providerID)")
//            }
//        }
//        print(providers)
//        return providers
//    }
//    
//    // Funktion zum Abmelden des Benutzers
//    func signOut() throws {
//        // Versuche, den Benutzer abzumelden
//        try Auth.auth().signOut()
//    }
//    
//    func delete() async throws {
//        guard let user = Auth.auth().currentUser else {
//            throw URLError(.badURL)
//        }
//        
//        try await user.delete()
//    }
//    
//}
//
//// MARK: SIGN IN EMAIL
//
//extension AuthenticationManager {
//    // Funktion zum Erstellen eines Benutzers mit E-Mail und Passwort
//    @discardableResult
//    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
//        // Erstelle den Benutzer asynchron und erhalte das AuthDataResult-Objekt
//        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
//        // Erzeuge ein AuthDataResultModel-Objekt und gib es zurück
//        return AuthDataResultModel(user: authDataResult.user)
//    }
//    
//    // Funktion zum Anmelden eines Benutzers mit E-Mail und Passwort
//    @discardableResult
//    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
//        // Anmelden des Benutzers asynchron und Erhalt des AuthDataResult-Objekts
//        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
//        // Erzeuge ein AuthDataResultModel-Objekt und gib es zurück
//        return AuthDataResultModel(user: authDataResult.user)
//    }
//    
//    // Funktion zum Zurücksetzen des Passworts
//    func resetPassword(email: String) async throws {
//        // Sende ein Passwort-Reset-E-Mail asynchron
//        try await Auth.auth().sendPasswordReset(withEmail: email)
//    }
//    
//    // Funktion zum Aktualisieren des Passworts
//    func updatePassword(password: String) async throws {
//        // Überprüfe, ob der Benutzer angemeldet ist
//        guard let user = Auth.auth().currentUser else {
//            throw URLError(.badServerResponse)
//        }
//        // Aktualisiere das Passwort des Benutzers asynchron
//        try await user.updatePassword(to: password)
//    }
//    
//    // Funktion zum Aktualisieren der E-Mail-Adresse
//    func updateEmail(email: String) async throws {
//        // Überprüfe, ob der Benutzer angemeldet ist
//        guard let user = Auth.auth().currentUser else {
//            throw URLError(.badServerResponse)
//        }
//        // Aktualisiere die E-Mail-Adresse des Benutzers asynchron
//        try await user.sendEmailVerification(beforeUpdatingEmail: email)
//    }
//}
//
//// MARK: SIGN IN SSO
//
//extension AuthenticationManager {
//    @discardableResult
//    // Funktion zum Anmelden mit Google
//    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
//        // Erstelle Firebase-Anmeldeinformationen mit dem Google-Zugriffstoken und dem ID-Token
//        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
//        // Erzeuge ein AuthDataResultModel-Objekt und gib es zurück
//        return try await signIn(credential: credential)
//    }
//    
//    // Generische Funktion zum Anmelden mit AuthCredential
//    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel {
//        let authDataResult = try await Auth.auth().signIn(with: credential)
//        // Erzeuge ein AuthDataResultModel-Objekt und gib es zurück
//        return AuthDataResultModel(user: authDataResult.user)
//    }
//}

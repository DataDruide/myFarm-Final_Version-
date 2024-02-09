//
//import Foundation
//import GoogleSignIn
//import GoogleSignInSwift
//
//
//struct GoogleSignInResultModel {
//    let idToken: String
//    let accessToken: String
//    let name: String?
//    let email: String?
//
//}
//
//final class SignInGoogleHelper {
//    @MainActor
//    func signIn() async throws -> GoogleSignInResultModel {
//        // Ermittle den obersten Ansichtscontroller
//        guard let topVC = Utilities.shared.topViewController() else {
//            throw URLError(.cannotFindHost)
//        }
//        
//        // Führe die Anmeldung mit Google durch
//        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
//        
//        // Erhalte das ID-Token und den Zugriffstoken
//        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
//            throw URLError(.badServerResponse)
//        }
//        
//        let accessToken = gidSignInResult.user.accessToken.tokenString
//        let name = gidSignInResult.user.profile?.name
//        let email = gidSignInResult.user.profile?.email
//
//        // Erzeuge ein Model mit den Tokens
//        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken, name: name,email: email)
//        return tokens
//    }
//}

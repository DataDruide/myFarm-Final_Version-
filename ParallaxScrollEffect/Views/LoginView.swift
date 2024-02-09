import SwiftUI
import UIKit

struct LoginView: View {
    @EnvironmentObject var authService: AuthService
    @State var email: String = ""
    @State var password: String = ""
    @State private var isShowingAlertBanner = false
    @State private var isButtonPressed = false // Neue Zustandsvariable für den Button
    @FocusState private var focusField: FocusField?

    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundLogin")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.28)
                    .contrast(1.9)

                VStack() {
                    Spacer(minLength: 20)

                    // Titel "myFArm"
                    Text(NSLocalizedString("Text9", comment: ""))
                        .font(Font.custom("Chalkduster", size: 55))
                        .kerning(0.25)
                        .foregroundColor(Color(red: 0.05, green: 0.45, blue: 0.43))
                        .multilineTextAlignment(.center)
                        .shadow(color: .white, radius: 0.5, x: 0.25, y: 0.25)

                    Spacer()

                    // Überschrift "Anmelden"
                    Text(NSLocalizedString("Text6", comment: ""))
                        .font(Font.custom("Chalkduster", size: 32))
                        .kerning(0.25)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .blur(radius: 0.5)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                    Spacer()

                    // Eingabefelder für Email und Password
                    VStack(spacing: 10) {
                        TextField("EMAIL", text: $email)
                            .padding(.horizontal, 10)
                            .foregroundColor(.black)
                            .frame(width: 340, height: 45)
                            .background(Color.white.opacity(0.53))
                            .cornerRadius(10)
                            .focused($focusField, equals: .email)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                            .onAppear {
                                UITextField.appearance().tintColor = .black
                            }
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                        SecureField("PASSWORD", text: $password)
                            .padding(.horizontal, 10)
                            .foregroundColor(.black)
                            .frame(width: 340, height: 45)
                            .background(Color.white.opacity(0.53))
                            .cornerRadius(10)
                            .focused($focusField, equals: .password)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                            .onAppear {
                                UITextField.appearance().tintColor = .black
                            }
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    }
                    .padding(.horizontal, 20)

                    Spacer()

                    // Button zum Registrieren
                    Button(action: {
                        isButtonPressed = true
                        authService.signUp(email: email, password: password)
                    }) {
                        Text(NSLocalizedString("Text7", comment: ""))
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color(red: 0.15, green: 0.35, blue: 0.43))
                            .cornerRadius(10)
                    }
                    .disabled(email.isEmpty || password.isEmpty)
                    .sheet(isPresented: $isShowingAlertBanner) {
                        AlertBanner() // Hier kommt deine AlertBanner-View
                    }
                    .onChange(of: isButtonPressed) { _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isButtonPressed = false // Setze den Zustand des Buttons zurück
                        }
                    }



                    // Button zum Anmelden
                    Button(action: {
                        isButtonPressed = true
                        authService.signIn(email: email, password: password)
                    }) {
                        Text(NSLocalizedString("Text6", comment: ""))
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color(red: 0.15, green: 0.35, blue: 0.43))
                            .cornerRadius(10)
                    }
                    .disabled(email.isEmpty || password.isEmpty)
                    .sheet(isPresented: $isShowingAlertBanner) {
                        AlertBanner() // Hier kommt deine AlertBanner-View
                    }
                    .onChange(of: isButtonPressed) { _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isButtonPressed = false
                        }
                    }


                    Spacer(minLength: 150)
                }
                .padding(.bottom, 30)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

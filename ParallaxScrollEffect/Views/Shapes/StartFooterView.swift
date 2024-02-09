import SwiftUI

// Definiert eine SwiftUI-Ansicht für den StartFooter
struct StartFooterView: View {
    
    // Zustandseigenschaften, um die Anzeige des Sheets zu steuern
    @State private var isLoginViewPresented = false
    @State private var isOnboardingPresented = false


    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()
                
                // Button für den Login
                Button(action: {
                    isOnboardingPresented.toggle() // Anzeige des Login-Dialogs steuern
                }) {
                    Text(NSLocalizedString("Text8", comment: ""))
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color(red: 0.15, green: 0.35, blue: 0.43))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 1.5)
                                .stroke(Color(red: 0.34, green: 0.55, blue: 0.49), lineWidth: 3)
                        )
                        .cornerRadius(10)                }
                .sheet(isPresented: $isOnboardingPresented, content: {
                    OnBoardingView() // Zeigt das Login-View an, wenn isLoginViewPresented true ist
                })
                
              //  Text(NSLocalizedString("Text4", comment: ""))

                // Button für den Login
                Button(action: {
                    isLoginViewPresented.toggle() // Anzeige des Login-Dialogs steuern
                }) {
                    Text(NSLocalizedString("Text6", comment: ""))
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color(red: 0.15, green: 0.35, blue: 0.43))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 1.5)
                                .stroke(Color(red: 0.34, green: 0.55, blue: 0.49), lineWidth: 3)
                        )
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isLoginViewPresented, content: {
                    LoginView() // Zeigt das Login-View an, wenn isLoginViewPresented true ist
                })
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
}

// Vorschau für die StartFooterView-Ansicht
#if DEBUG
struct StartFooterView_Previews: PreviewProvider {
    static var previews: some View {
        StartFooterView()
    }
}
#endif

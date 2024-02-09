

import SwiftUI

struct TermsOfServiceView: View {
    @State private var isAccepted: Bool = false
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                Text("Nutzungsbedingungen")
                    .font(.title)
                    .font(.custom("Chalkduster", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                Text("Willkommen bei unserer App. Durch die Nutzung dieser App erklären Sie sich mit den folgenden Nutzungsbedingungen einverstanden:")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Helvetica", size: 18))
                    .foregroundColor(.primary)
                    .padding(.horizontal, 20)
                
                Group {
                    TermSection(title: "Zustimmung zu den Bedingungen der AGB des Unternehmens Die Putzteufel", content: """
                    Bitte lesen Sie diese Nutzungsbedingungen sorgfältig durch und stimmen Sie ihnen zu, bevor Sie unsere App nutzen. Wenn Sie nicht mit diesen Bedingungen einverstanden sind, verwenden Sie die App bitte nicht.
                    """)
                       .padding()

                    TermSection(title: "Änderungen der Nutzungsbedingungen", content: """
                    Wir behalten uns das Recht vor, diese Nutzungsbedingungen jederzeit ohne vorherige Ankündigung zu ändern. Es liegt in Ihrer Verantwortung, regelmäßig auf Aktualisierungen der Bedingungen zu achten. Durch die fortgesetzte Nutzung der App nach der Veröffentlichung von Änderungen erklären Sie sich mit den aktualisierten Bedingungen einverstanden.
                    """)
                       .padding()


                    TermSection(title: "Änderungen zur Bedingungen zur Kündigung", content: """
                    Wir behalten uns das Recht vor, Ihren Zugang zur App nach eigenem Ermessen ohne vorherige Ankündigung oder Haftung zu beenden oder auszusetzen, wenn Sie gegen diese Nutzungsbedingungen verstoßen.
                    """)
                       .padding()


                    TermSection(title: "Aktueller Satz des Anwendbares Recht", content: """
                    Diese Nutzungsbedingungen unterliegen den Gesetzen des Landes, in dem Sie wohnhaft sind, und jegliche rechtliche Streitigkeiten unterliegen der ausschließlichen Zuständigkeit der Gerichte dieses Landes.
                    """)
                       .padding()

                    // Additional terms sections...
                }
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.4))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                )
                .padding(.top, 16)
                
                // Buttons for agreement
                HStack(spacing: 16) {
                    AgreementButton(title: "Ich akzeptiere", isSelected: isAccepted) {
                        isAccepted = true
                        // Close the view here if "Ich akzeptiere" is selected
                    }
                    
                    AgreementButton(title: "Ich akzeptiere nicht", isSelected: !isAccepted) {
                        if isAccepted {
                            showAlert = true
                        } else {
                            isAccepted = false
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Achtung!"), message: Text("Sie haben die Nutzungsbedingungen nicht akzeptiert."), dismissButton: .default(Text("OK")))
                    }
                }
                .padding()
                Spacer(minLength: 100)
            }
            .padding(.horizontal, 20)
            .background(Color.black.opacity(0.6))
//            .background( LinearGradient(
//                gradient: Gradient(
//                    colors: [
//                        Color(red: 0.65, green: 0.88, blue: 0.76),
//                        Color(red: 0.33, green: 0.58, blue: 0.63)
//                    ]
//                ),
//                startPoint: .top,
//                endPoint: .bottom
            
          //  .ignoresSafeArea())
            .cornerRadius(30)
        }
        .onAppear {
            HapticEngine.trigger()
        }
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
            .previewDevice("iPhone 15")
            .preferredColorScheme(.light)
    }
}

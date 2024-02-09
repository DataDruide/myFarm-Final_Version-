import SwiftUI
import AVFAudio
import Lottie

// Die SwiftUI-View für den Splash Screen.
struct SplashView: View {
    
    // Ein State-Property, das den Zustand des Splash Screens verfolgt.
    @State private var isActive = false
    
    var body: some View {
        // Die View entscheidet basierend auf dem Zustand, ob sie den Hauptinhalt (ContentView) oder den Splash Screen anzeigt.
        if isActive {
            // Wenn der Zustand aktiv ist, wird der Hauptinhalt (ContentView) angezeigt.
            ContentView()
        } else {
            // Wenn der Zustand inaktiv ist, wird der Splash Screen angezeigt.
            ZStack {
                ZStack {
                    ZStack {
//                        Image("splashimg")
//                            .aspectRatio(contentMode: .fit)
//                            .ignoresSafeArea(.all)
//                        
                     //   Spacer()
                        Text("myFArm")
                            .font(Font.custom("Chalkduster", size: 50))
                            .kerning(0.25)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.15, green: 0.35, blue: 0.43))
                            .fontWeight(.bold)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(15)
                            .scaleEffect(isActive ? 1.2 : 1.0)
                            .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))


                            .scaleEffect(isActive ? 1.5 : 1.2)
                          .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))
                          .onAppear {
                              // Nach einer Verzögerung von 4 Sekunden wird der Zustand auf aktiv gesetzt, um den Hauptinhalt anzuzeigen.
                              DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                  withAnimation {
                                      self.isActive = true
                                  }
                              }
                          }
                    }
                    .frame(width: 517, height: 496)
//                    .background(
//                      EllipticalGradient(
//                        stops: [
//                          Gradient.Stop(color: Color(red: 0.78, green: 0.26, blue: 0.43), location: 0.00),
//                          Gradient.Stop(color: Color(red: 0.39, green: 0.17, blue: 0.45), location: 0.87),
//                        ],
//                        center: UnitPoint(x: 0.5, y: 0.5)
//                      )
//                    )
                }
                .frame(width: 440, height: 1200)
                .background(Color.gray.opacity(0.05))
                // Hintergrundbild für den Splash Screen.
               
                
               
                }
            }
        }
    // ************************************************************************
    // Dieser Code kann ausgeblendet werden den mit diesem Code rufen wir ab welche Schriften auf dem Device anzeigbar sind
//init() {
//        for familyName in UIFont.familyNames {
//            print(familyName)
//            
//            for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                print("--\(fontName)")
//            }
//        }
//    }
}
// ************************************************************************














// Eine SwiftUI-Ansicht für den Splash-Screen mit Lottie-Animation
struct SplashView2: View {
    
    // Lottie-Animationseigenschaften
    let animationName = "gardenanimation"
    let loopMode: LottieLoopMode = .playOnce
    let animationSpeed: CGFloat = 66
    
    // Status, der das Abspielen der Animation steuert
    @State private var playAnimation = true
    
    var body: some View {
        VStack {
            
            Group {
//                Text(NSLocalizedString("MyFarm", comment: ""))
//                    .font(.custom("Chalkduster", size: 34))
//                    .foregroundColor(.green)
//                    .multilineTextAlignment(.center)
                LottieView(url: Bundle.main.url(forResource: "gardenanimation", withExtension: "json")!)
                    .cornerRadius(30)
            }
        }
        .onAppear {
            // Audioplayer initialisieren und Ton abspielen
            playAudio()
        }
        .onDisappear {
            // Ton stoppen, wenn die Ansicht verschwindet
            stopAudio()
        }
    }
    
    // Funktion zum Initialisieren und Abspielen des Audioplayers
    private func playAudio() {
        guard let soundURL = Bundle.main.url(forResource: "owl_sound", withExtension: "mp3") else {
            return
        }
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    // Funktion zum Stoppen des Audioplayers
    private func stopAudio() {
        // Implementieren Sie hier die Logik zum Stoppen des Audioplayers, wenn nötig
    }
}

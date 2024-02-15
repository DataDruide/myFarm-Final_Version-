import SwiftUI
import AVFoundation
enum AnimationPhase: CaseIterable {
    case start, middle, end
}
// Custom Tab View for the app
struct CustomTabView: View {
    // States to control the display of various sheets and manage the active tab
    @State private var isSheetPresented = false
    @State private var activeTab: Int = 0
    @State private var isPresentingHome = false
    @State private var isPresentingPlanListView = false
    @State private var isPresentingCreateMasterMapView = false
    @State private var isPresentingGardenView = false
    @State private var isPresentingAppSettingView = false
    @State private var animationStep = 0

    // Environment object to access the ViewModel
    @EnvironmentObject var viewModel: AppLoadingViewModel
    @AppStorage("isReadingEnabled") private var isReadingEnabled = true

    // Voice synthesizer for accessibility
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack(spacing: 8) {
            // RoundedRectangle for the navigation bar with rounded corners
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 370, height: 70)
                .foregroundColor(.gray.opacity(0.4))
                .overlay(
                    // HStack for navigation buttons
                    HStack(alignment: .center, spacing: 45) {
                        // Welcome Button
                        Button(action: {
                            isPresentingHome.toggle()
                            animationStep += 1
                            if isReadingEnabled {
                                speakMessage("Knopf zur Ansicht mit Neuigkeiten wurde gedrückt")
                            }
                            // Choose a voice using a language code
                              
                        }) {
                            Image(systemName: "newspaper.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                                .font(.largeTitle)
                                        .phaseAnimator(AnimationPhase.allCases, trigger: animationStep) { content, phase in
                                            content
                                                .blur(radius: phase == .start ? 0 : 10)
                                                .scaleEffect(phase == .middle ? 3 : 1)
                                        }
                        }
                        .tag(0) // Tag for activating the tab
                        
                        .sheet(isPresented: $isPresentingHome) {
                            Home()
                        }

                        // Plan List Button
                        Button(action: {
                            isPresentingPlanListView.toggle()
                            if isReadingEnabled {
                                speakMessage("Knopf zur Pflanzen und Gemüseansicht wurde gedrückt")
                            }
                         
                        }) {
                            Image(systemName: "blinds.vertical.closed")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                                .font(.largeTitle)
                                        .phaseAnimator(AnimationPhase.allCases, trigger: animationStep) { content, phase in
                                            content
                                                .blur(radius: phase == .start ? 0 : 10)
                                                .scaleEffect(phase == .middle ? 3 : 1)
                                        }
                        }
                        .sheet(isPresented: $isPresentingPlanListView) {
                            PlantListView()
                        }

                        // Create Profile Button
                        Button(action: {
                            isPresentingCreateMasterMapView.toggle()
                            if isReadingEnabled {
                                speakMessage("Knopf zur Google Maps Ansicht wurde gedrückt")
                            }
                        }) {
                            Image(systemName: "map")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                                .font(.largeTitle)
                                        .phaseAnimator(AnimationPhase.allCases, trigger: animationStep) { content, phase in
                                            content
                                                .blur(radius: phase == .start ? 0 : 10)
                                                .scaleEffect(phase == .middle ? 3 : 1)
                                        }
                        }
                        .sheet(isPresented: $isPresentingCreateMasterMapView) {
                            MasterMapView()
                        }
                        .tag(2) // Tag for activating the tab

                        // Notification Button
                        Button(action: {
                            isPresentingGardenView.toggle()
                            if isReadingEnabled {
                                speakMessage("Knopf zur Gartenplannungs Ansicht wurde gedrückt")
                            }
                        }) {
                            Image(systemName: "bag.badge.plus")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                                .font(.largeTitle)
                                        .phaseAnimator(AnimationPhase.allCases, trigger: animationStep) { content, phase in
                                            content
                                                .blur(radius: phase == .start ? 0 : 10)
                                                .scaleEffect(phase == .middle ? 3 : 1)
                                        }
                        }
                        .sheet(isPresented: $isPresentingGardenView) {
                            GardenView()
                        }
                        .tag(3) // Tag for activating the tab

                        // Setting Button
                        Button(action: {
                            isPresentingAppSettingView.toggle()
                            if isReadingEnabled {
                                speakMessage("Knopf zur Ansicht mit den Appeinstellungen wurde gedrückt")
                            }
                        }) {
                            Image(systemName: "mail")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                                .font(.largeTitle)
                                        .phaseAnimator(AnimationPhase.allCases, trigger: animationStep) { content, phase in
                                            content
                                                .blur(radius: phase == .start ? 0 : 10)
                                                .scaleEffect(phase == .middle ? 3 : 1)
                                        }
                        }
                        .sheet(isPresented: $isPresentingAppSettingView) {
                            AppSettingView()
                        }
                        .tag(4) // Tag for activating the tab
                    }
                    .padding(0)
                    .frame(width: 370, height: 70)
                    .background(Color.white.opacity(0.5).gradient)
                    .cornerRadius(20) // Round the corners
                    
                    
                )
            
            
        }
    }

    // Function to speak a message using AVSpeechSynthesizer
    func speakMessage(_ message: String) {
        let utterance = AVSpeechUtterance(string: message)
        utterance.prefersAssistiveTechnologySettings = true
        utterance.voice = AVSpeechSynthesisVoice(language: "de")
        synthesizer.speak(utterance)
    }
}

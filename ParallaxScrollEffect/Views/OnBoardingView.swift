import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onBoarding") var onBoarding = true
    @State private var current = 1
    @State private var selectedStep: Int? = nil
    @State private var isShowingAfterOnBoardingView = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .center) {
                    Spacer(minLength: 20)

                    if current == 3 {
                        NavigationLink(
                            destination: AfterOnBoardingView(),
                            tag: 3,
                            selection: $selectedStep
                        ) {
                            Text(NSLocalizedString("Next", comment: ""))
                                .foregroundColor(.white)
                                .bold()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                        .background(
                            Capsule()
                                .fill(Color(.black).opacity(0.9))
                                .frame(width: 110, height: 45)
                        )
                    }

                    OnboardItem(step: current)
                        .transition(AnyTransition.slide.animation(.spring()))
                        .padding()
                        .onAppear {
                            withAnimation {
                                // Hier kannst du den Code hinzufügen, der bei Erscheinen des OnboardItems ausgeführt werden soll
                            }
                        }

                    HStack {
                        HStack(spacing: 12) {
                            Capsule()
                                .frame(width: 22, height: 4)
                                .foregroundColor(current == 1 ? Color("customgreen") : Color("customgreen").opacity(0.3))

                            Capsule()
                                .frame(width: 22, height: 4)
                                .foregroundColor(current == 2 ? Color("customgreen") : Color("customgreen").opacity(0.3))

                            Capsule()
                                .frame(width: 22, height: 4)
                                .foregroundColor(current == 3 ? Color("customgreen") : Color("customgreen").opacity(0.3))
                        }

                        Circle()
                            .frame(width: 33, height: 33)
                            .foregroundColor(Color("customgreen"))
                            .overlay(
                                Image(systemName: current == 3 ? "checkmark" : "arrow.right")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                            )
                            .onTapGesture {
                                if current == 3 {
                                    // Setze den selectedStep auf 3, um die Navigation auszulösen
                                    selectedStep = 3
                                } else {
                                    withAnimation {
                                        current += 1
                                    }
                                }
                            }
                    }
                }
            }
        }
    }
}

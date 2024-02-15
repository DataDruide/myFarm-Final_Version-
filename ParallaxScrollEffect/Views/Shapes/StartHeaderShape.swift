import SwiftUI
struct StartHeaderSection: View {
    
    @State private var isShowingCommunicationCenterView = false

    var body: some View {
        ZStack {
            Button(action: {
                isShowingCommunicationCenterView.toggle()
            }) {
                Image("gartenlounge")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 365, height: 160)
                    .clipped()
                    .overlay(
                        VStack {
                            HStack {
                                Text("Support Center ")
                                    .font(
                                        Font.custom("Chalkduster", size: 18)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(.black)
                                    .frame(width: 200, height: 40, alignment: .topLeading)
                                    .padding(.leading, 8)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 74.55556)
                                        .foregroundColor(Color(red: 1, green: 0.94, blue: 0.85))
                                        .frame(width: 79, height: 22)
                                        .overlay(
                                            Text("Centraal")
                                                .font(Font.custom("Chalkduster", size: 12))
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color(red: 0.82, green: 0.48, blue: 0.29))
                                                .frame(alignment: .leading)
                                        )
                                }
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 74.55556)
                                        .foregroundColor(.black.opacity(0.45))
                                        .frame(width: 56, height: 22)
                                        .overlay(
                                            Text("4.1")
                                                .font(Font.custom("Chalkduster", size: 12))
                                                .kerning(1.2)
                                                .foregroundColor(.white)
                                                .frame(width: 40, height: 15, alignment: .leading)
                                        )
                                }
                            }
                            .padding()
                        }
                        .foregroundColor(.white)
                    )
            }
            .sheet(isPresented: $isShowingCommunicationCenterView) {
                CommunicationCenterView()
            }
            .buttonStyle(PlainButtonStyle())
            
        }
        .frame(width: 368, height: 160)
        .background(.white)
        .cornerRadius(11)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 11)
                .inset(by: 1.5)
                .stroke(Color(red: 0.34, green: 0.55, blue: 0.49), lineWidth: 3)
        )
    }
}

struct SupportView: View {
    var body: some View {
        Text("Posteingang View")
    }
}

struct TricksTippsView: View {
    var body: some View {
        Text("Tricks & Tipps")
    }
}

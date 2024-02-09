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
import SwiftUI

struct CommunicationCenterView: View {
    let itemColor = Color(red: 0.15, green: 0.35, blue: 0.43)

    var body: some View {
        NavigationView {
            VStack {
         //       CommunicationTitleView()
//                Image("Communcationcenter")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(maxWidth: 380, maxHeight: 130)
//
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 20) {
                        NavigationLink(destination: ForumView()) {
                            CommunicationItemView(imageName: "message.fill", title: "Forum")
                                .foregroundColor(itemColor)
                        }
                        
                        NavigationLink(destination: SupportContactView()) {
                            CommunicationItemView(imageName: "envelope.fill", title: "Support kontaktieren")
                                .foregroundColor(itemColor)
                        }
                        
                        NavigationLink(destination: InboxView()) {
                            CommunicationItemView(imageName: "tray.fill", title: "Posteingang")
                                .foregroundColor(itemColor)
                        }
                        
                        NavigationLink(destination: SettingsView()) {
                            CommunicationItemView(imageName: "gearshape.fill", title: "Tipps und Tricks")
                                .foregroundColor(itemColor)
                        }
                    }
                    .padding()
                }
                
            }
            .navigationTitle("Gardencenter")

        }

    }
}

import SwiftUI

struct CommunicationItemView: View {
    let imageName: String
    let title: String
    @State private var isFavorite = false

    var body: some View {
        HStack {
//            Image(systemName: imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 50, height: 50)
//                .foregroundColor(isFavorite ? .red : Color(red: 0.15, green: 0.35, blue: 0.43)) // Ändern Sie die Farbe je nach Zustand
//                .padding()
//                .scaleEffect(isFavorite ? 1.2 : 1.0) // Pulsier-Animation
//                .animation(.spring(response: 0.5, dampingFraction: 0.5)) // Animationsparameter können angepasst werden
//
//            Text(title)
//                .font(.headline)
//                .foregroundColor(.primary)
//                .multilineTextAlignment(.center)
            
            Button {
                        isFavorite.toggle()
                    } label: {
                        Label(title, systemImage: imageName)
                            .font(Font.custom("Chalkduster", size: 18))
                    }
                    .symbolEffect(.bounce.down, value: isFavorite)
                    .font(.largeTitle)
            
            
        }
        .frame(width: 370, height: 125)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .onTapGesture {
                    withAnimation {
                        isFavorite.toggle()
                    }
                }
    }
}



struct ForumView: View {
    var body: some View {
        Text("Forum View")
    }
}

struct SupportContactView: View {
    var body: some View {
        Text("Support Kontaktieren View")
    }
}

struct InboxView: View {
    var body: some View {
        Text("Posteingang View")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Einstellungen View")
    }
}

struct CommunicationCenterView_Previews: PreviewProvider {
    static var previews: some View {
        CommunicationCenterView()
    }
}





import Foundation
import SwiftUI

struct CommunicationTitleView: View {
   
    var body: some View {
        HStack {
            Text("Communicationcenter")
                .font(.custom("Chalkduster", size: 24))
                .foregroundColor(.black)
                .frame(width: 225, height: 91, alignment: .topLeading)
            
            Spacer()
            
            
        }
        .padding()
        
    }
}

import SwiftUI

struct HeaderSubSectionLazyGrid: View {
    
    @State private var isShowingGardenMagazineView = false
    @State private var isShowingGardenShopView = false

    var body: some View {
        HStack {
            Button(action: {
                // Aktion, die beim Klicken auf den Gartenmagazin-Button ausgeführt wird
                isShowingGardenMagazineView.toggle()
            }) {
                ZStack {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 182, height: 181)
                      .background(
                        Image("gallery_garten")
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 182, height: 181)
                          .clipped()
                          .overlay(
                            VStack {
                                HStack {
                                    Text("Magazine")
                                        .font(
                                            Font.custom("Chalkduster", size: 18)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(.white)
                                        .frame(width: 200, height: 40, alignment: .center)
                                }
                                
                            }
                          )
                      )
                }
                .frame(width: 184, height: 181)
                .background(.white)
                .cornerRadius(11)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .inset(by: 1.5)
                        .stroke(Color(red: 0.34, green: 0.55, blue: 0.49), lineWidth: 3)
                )
            }
            
            Button(action: {
                // Aktion, die beim Klicken auf den Garten-Shop-Button ausgeführt wird
                isShowingGardenShopView.toggle()
            }) {
                ZStack {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 181, height: 181)
                      .background(
                        Image("little_garden")
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 216, height: 205)
                          .clipped()
                          .overlay(
                            VStack {
                                HStack {
                                    Text("Shop")
                                        .font(
                                            Font.custom("Chalkduster", size: 18)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(.white)
                                        .frame(width: 200, height: 40, alignment: .center)
                                }
                                
                            }
                          )
                      )
                }
                .frame(width: 184, height: 181)
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
        .sheet(isPresented: $isShowingGardenMagazineView) {
            // View für das Gartenmagazin-Sheet
            GardenMagazineView()
        }
        .sheet(isPresented: $isShowingGardenShopView) {
            // View für das Garten-Shop-Sheet
            GardenShopView()
        }
    }
}


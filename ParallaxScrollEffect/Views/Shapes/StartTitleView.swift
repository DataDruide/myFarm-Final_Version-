

import Foundation
import TipKit
import SwiftUI

struct StartTitleView: View {
    @State private var searchText: String = ""
    @State private var isLogoutSheetPresented: Bool = false
    @State private var buttonColor: Color = Color(red: 0.96, green: 0.94, blue: 0.93)

    let newStuffTip = NewStuffTip()
    @State private var colors: [Color] = []
       @EnvironmentObject var viewModel: SecurityViewModel

    var body: some View {
        HStack {
            Text(NSLocalizedString("Greeting", comment: ""))
                .font(.custom("Chalkduster", size: 32))
                .foregroundColor(.black)
                .frame(width: 225, height: 91, alignment: .topLeading)
            
            Spacer()
            
            HStack(spacing: 16) {
                Button(action: {
                            
                isLogoutSheetPresented.toggle()
                buttonColor = .red // Ändern Sie die Farbe auf Rot
                    }) {
                        Text(NSLocalizedString("Text10", comment: ""))
                        .foregroundColor(.black)
                        .padding(8)
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                }
                Button {
                    colors.insert(.random, at: 0)
                } label: {
                    Image(systemName: "bell")
                }
                .popoverTip(newStuffTip)
                .foregroundColor(.red)
            }
            .padding(.trailing, 16) // Adjust as needed
        }
        .padding()
        .onAppear {
            // Setzen Sie die Farbe zurück, wenn die View erscheint
            buttonColor = Color(red: 0.96, green: 0.94, blue: 0.93)
        }
        // Passendes SearchTextField
        TextField("Suche nach myFarm...", text: $searchText)
            .padding()
            .frame(width: 370, height: 55)
            .background(Color(red: 0.96, green: 0.94, blue: 0.93))
            .cornerRadius(10)
            .onChange(of: searchText) { newValue in
                                viewModel.validateUserInput()
                            }
            .sheet(isPresented: $isLogoutSheetPresented) {
                LogoutShape(username: "")
                // Hier wird die LogOutShape oder eine andere Ansicht für das Sheet platziert
            }
    }
}

#Preview {
    StartTitleView()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)])
        }
    
}

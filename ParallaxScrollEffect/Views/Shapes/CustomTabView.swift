import Foundation
import SwiftUI

// Benutzerdefinierte Tab-Ansicht für die App
struct CustomTabView: View {
    // Zustände zur Steuerung der Anzeige verschiedener Sheets und zur Verwaltung des aktiven Tabs
    @State private var isSheetPresented = false
    @State private var activeTab: Int = 0
    @State private var isPresentingHome = false
    @State private var isPresentingPlanListView = false
    @State private var isPresentingCreateMapView = false
    @State private var isPresentingGardenView = false
    @State private var isPresentingAppSettingView = false

    // Umgebungsobjekt für den Zugriff auf das ViewModel
    @EnvironmentObject var viewModel: AppLoadingViewModel

    var body: some View {
        VStack(spacing: 8) {
            // RoundedRectangle für die Navigationsleiste mit runden Ecken
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 370, height: 70)
                .foregroundColor(.gray.opacity(0.4))
                .overlay(
                    // HStack für die Navigationsbuttons
                    HStack(alignment: .center, spacing: 45) {
                        // Welcome Button
                        Button(action: {
                            isPresentingHome.toggle()
                        }) {
                            Image(systemName: "newspaper.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                        }
                        .tag(0) // Tag für die Aktivierung des Tabs
                        .sheet(isPresented: $isPresentingHome) {
                            Home()
                        }

                        // Plan List Button
                        Button(action: {
                            isPresentingPlanListView.toggle()
                        }) {
                            Image(systemName: "blinds.vertical.closed")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                        }
                        .sheet(isPresented: $isPresentingPlanListView) {
                            PlantListView()
                        }

                        // Create Profile Button
                        Button(action: {
                            isPresentingCreateMapView.toggle()
                        }) {
                            Image(systemName: "map")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                        }
                        .sheet(isPresented: $isPresentingCreateMapView) {
                            MapView()
                        }
                        .tag(2) // Tag für die Aktivierung des Tabs

                        // Notification Button
                        Button(action: {
                            isPresentingGardenView.toggle()
                        }) {
                            Image(systemName: "bag.badge.plus")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                        }
                        .sheet(isPresented: $isPresentingGardenView) {
                            GardenView()
                        }
                        .tag(3) // Tag für die Aktivierung des Tabs

                        // Setting Button
                        Button(action: {
                            isPresentingAppSettingView.toggle()
                        }) {
                            Image(systemName: "mail")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                        }
                        .sheet(isPresented: $isPresentingAppSettingView) {
                            AppSettingView()
                        }
                        .tag(4) // Tag für die Aktivierung des Tabs
                    }
                    .padding(0)
                    .frame(width: 370, height: 70)
                    .background(Color.white.opacity(0.5).gradient)
                    .cornerRadius(20) // Abrundung der Ecken
                )
        }
    }
}


import SwiftUI

// View für die Wetteransicht
struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()

    var body: some View {
        ZStack {
            // Hintergrundverlauf für die gesamte Ansicht
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.white.opacity(0.45), Color.white.opacity(0.55), Color.blue.opacity(0.65)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    CustomShapeView() // Benutzerdefinierte Formansicht für den oberen Bereich
                    Spacer()
                }

                // TeilView zur Anzeige der Temperaturinformationen
                if let weatherData = viewModel.weatherData {
                    WeatherDatasTemp(weatherData: weatherData)
                } else {
                    // Hier können Sie einen Standardwert oder eine Aktion bereitstellen
                    Text("Keine Wetterdaten\nverfügbar")
                        .font(Font.custom("Chalkduster", size: 12))
                        .multilineTextAlignment(.center)
                        .fontWeight(.thin)
                }

                Divider()
                CustomShapeView2() // Benutzerdefinierte Formansicht für Unwetterwarnungen

                // Textfeld für die Eingabe des Orts
                TextField("Ort eingeben", text: $viewModel.searchText, onCommit: {
                    viewModel.searchWeather()
                })
                .frame(width: 340, height: 55)
                .textFieldStyle(RoundedBorderTextFieldStyle())

                if let weatherData = viewModel.weatherData {
                    // Wetterinformationstabelle
                    WeatherInfoTable(weatherData: weatherData)
                }

                CustomShapeView4() // Benutzerdefinierte Formansicht für heutige Temperaturen
            }
        }
    }
}

// View für die Wetterinformationstabelle
struct WeatherInfoTable: View {
    let weatherData: WeatherResponse
    @StateObject private var viewModel = WeatherViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            WeatherRow(title: "Temperatur", value: "\(weatherData.main.temp)°C")
            WeatherRow(title: "Luftfeuchtigkeit", value: "\(weatherData.main.humidity)%")
            WeatherRow(title: "Wind Geschw.", value: "\(weatherData.wind.speed) m/s")

            if let rain = weatherData.rain {
                WeatherRow(title: "Regen (1h)", value: "\(rain.oneHour) mm")
            } else {
                WeatherRow(title: "Regen (1h)", value: "keine Regendaten verfügbar")
            }

            WeatherRow(title: "Wolken Anteil", value: "\(weatherData.clouds.all)%")
            WeatherRow(title: "Sonnen Aufgang", value: viewModel.formattedTime(time: weatherData.sys.sunrise))
            WeatherRow(title: "Sonnen Untergang", value: viewModel.formattedTime(time: weatherData.sys.sunset))

            // Wetterbeschreibung und -symbol
            WeatherRow(title: "Beschreibung", value: weatherData.weather.first?.description ?? "")
        }
        .foregroundColor(.black)
        .padding(.horizontal, 30)
    }
}

// View für eine einzelne Wetterzeile
struct WeatherRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
        .padding(.horizontal, 30)
    }
}

// Benutzerdefinierte Form für eine einzelne Wetterzeile (nicht im Gebrauch)
struct WeatherRowTemp: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
        .padding(.horizontal, 30)
    }
}

// Benutzerdefinierte Form für die obere Leiste mit Ort und Unwetterwarnungen
struct CustomShapeView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "list.dash")
                    .foregroundColor(.black)
                    .frame(width: 24, height: 24)

                Text("Geislingen an der Steige")
                    .foregroundColor(.black)
                    .font(Font.custom("Chalkduster", size: 18))
                    .lineLimit(nil)
            }
            .padding()
            .foregroundColor(.white)
        }
    }
}

// Benutzerdefinierte Form für Unwetterwarnungen
struct CustomShapeView2: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "exclamationmark.square")
                    .foregroundColor(.yellow)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)

                Text("Unwetterwarnungen")
                    .bold()
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)

                Spacer()
            }
            .padding()
            Text("Warnungen vor extremer Kälte von SO 0:00 MEZ bis MO 0:00 , MEZ")
                .font(Font.custom("Helvetica", size: 12))
                .padding()

            CustomShapeView3() // Benutzerdefinierte Form für Unwetterwarnungsdetails
                .padding()
        }
    }
}

// Benutzerdefinierte Form für Unwetterwarnungsdetails
struct CustomShapeView3: View {
    var body: some View {
        VStack {
            Text("Teilweise bedeckt. Höchsttemperaturen 11 bis 30 C und Tiefsttemperaturen 2 bis 4 C.")
                .font(Font.custom("Helvetica", size: 14))
                .bold()
                .multilineTextAlignment(.center)
            Divider()
        }
    }
}

// Benutzerdefinierte Form für heutige Temperaturen
struct CustomShapeView4: View {
    var body: some View {
        VStack {
            Spacer()
            Group {
                Text("Heutige Temperaturen")
                    .bold()
                Text("Etwas wärmer als gestern")
                    .fontWeight(.thin)
            }
        }
    }
}

// Teilansicht zur Anzeige von Stunden und Wetterinformationen (nicht im Gebrauch)
struct TeilView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(9..<15) { hour in
                    Text("\(hour):00")
                        .font(.subheadline)
                }
            }
        }
        .padding()
    }
}

// Vorschau für die Teilansicht (nicht im Gebrauch)
struct TeilView_Previews: PreviewProvider {
    static var previews: some View {
        TeilView()
    }
}

// Benutzerdefinierte Form für aktuelle Wetterinformationen (nicht im Gebrauch)
struct AktualWeatherShape: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(9..<15) { hour in
                    Text("\(hour):00")
                        .font(.subheadline)
                }
            }

            HStack {
                ForEach(9..<15) { hour in
                    Image(systemName: "cloud")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.gray)
                        .frame(width: 25, height: 25)
                        .padding()
                }
            }

            ForEach(9..<15) { hour in
                Text("\(hour)°C")
                    .font(.subheadline)
                    .padding()
            }
        }
    }
}

// View für die Anzeige der aktuellen Temperaturinformationen
struct WeatherDatasTemp: View {
    let weatherData: WeatherResponse

    var body: some View {
        HStack {
            WeatherRowTemp(title: "T", value: "\(weatherData.main.temp)°C")
            Image("wolke")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 55)
                .padding()

            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.15))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2) // Hier können Sie die Farbe und die Breite des Rahmens anpassen
                )
        )
        .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y: 2) // Hier können Sie die Farbe und den Radius des Schlagschattens anpassen
    }
}


// Neue View +++++++++++++++++++++++++


struct NewWeatherView: View {
    @State private var isMenuOpen = false // Zustandsvariable für das Menü
    @StateObject private var viewModel = WeatherViewModel()
    let weatherData: WeatherResponse

    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Button(action: {
                        isMenuOpen.toggle()
                    }) {
                        Image(systemName: "line.horizontal.3") // Symbol für das Menü
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding(8)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                    }
                    .contextMenu {
                        // Hier können Sie die Optionen für das Menü hinzufügen
                        Button("Option 1") {
                            // Aktion für Option 1
                        }
                        Button("Option 2") {
                            // Aktion für Option 2
                        }
                        // Fügen Sie weitere Optionen nach Bedarf hinzu
                    }
                    
                    Text("Menü")
                        .font(Font.custom("Helvetica", size: 16))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("Sonnig")
                        .font(
                            Font.custom("Readex Pro", size: 18)
                                .weight(.thin)
                        )
                        .foregroundColor(.white)
                    
                }
                .padding(15)
                
                HStack {
                    Text("Aktuelles Wetter")
                        .font(
                            Font.custom("Helvetica", size: 18)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)
                }
                .padding(15)
                
                
                HStack {
                    Text("SO 9:10 MEZ - MO 23:59 MEZ ")
                      .font(Font.custom("Helvetica", size: 16))
                      .foregroundColor(.white.opacity(0.8))
                }
                .padding(15)
                
                HStack {
                    VStack {
                       
                        if let weatherData = viewModel.weatherData {
                            // Unwrap the optional safely using if let
                            WeatherInfoTable(weatherData: weatherData)
                        }
////                        WeatherRowTemp(title: "T", value: "\(weatherData.main.temp)°C")
//
//                            .font(Font.custom("DIN Next LT W23", size: 48))
//                            .foregroundColor(.white)
//                        
                        Text("sonnig klar-")
                          .font(
                            Font.custom("DIN Next LT W23", size: 16)
                              .weight(.light)
                          )
                          .foregroundColor(.white)
                        
                    }
                }
                .padding(15)
                
                
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 328, height: 66)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: .white.opacity(0.24), location: 0.00),
                                        Gradient.Stop(color: .white.opacity(0.08), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 1, y: 0),
                                    endPoint: UnitPoint(x: 0, y: 1)
                                )
                            )
                            .cornerRadius(12)
                        HStack {
                            Image("noun-rain-2438520 1")
                                .frame(width: 24, height: 24)
                            
                            Text("1%")
                                .font(
                                    Font.custom("DIN Next LT W23", size: 16)
                                        .weight(.bold)
                                )
                                .foregroundColor(.white)
                            
                            Image("noun-humidity-151847 1")
                            .frame(width: 24, height: 24)
                            
                            Text("90%")
                              .font(
                                Font.custom("DIN Next LT W23", size: 16)
                                  .weight(.bold)
                              )
                              .foregroundColor(.white)
                            
                            Image("noun-wind")
                            .frame(width: 24, height: 24)
                            
                            Text("17 km/h")
                              .font(
                                Font.custom("DIN Next LT W23", size: 16)
                                  .weight(.bold)
                              )
                              .foregroundColor(.white)
                        }
                        
                    }
                }
                
                
                HStack(alignment: .top, spacing: 24) {
                    
                    Spacer()
                    Text("Stündliches")
                      .font(
                        Font.custom("DIN Next LT W23", size: 12)
                          .weight(.light)
                      )
                      .foregroundColor(.white)
                    
                   Text("Wetter")
                      .font(
                        Font.custom("DIN Next LT W23", size: 12)
                          .weight(.bold)
                      )
                      .foregroundColor(.white)
                }
                .padding(15)
                
                
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 57, height: 86)
                            .background(Color(red: 0.2, green: 0.58, blue: 0.84))
                            .cornerRadius(8)
                        
                        VStack {
                            Text("14:00")
                                .font(
                                    Font.custom("DIN Next LT W23", size: 12)
                                        .weight(.light)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Image("116")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(.top, 4) // Optional: Fügen Sie Padding nach Bedarf hinzu
                            
                            Text("25°")
                                .font(Font.custom("DIN Next LT W23", size: 16))
                                .foregroundColor(.white)
                                .frame(width: 25, height: 23.85, alignment: .topLeading)
                                .padding(.top, 4) // Optional: Fügen Sie Padding nach Bedarf hinzu
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 57, height: 86)
                            .background(Color(red: 0.2, green: 0.58, blue: 0.84))
                            .cornerRadius(8)
                        
                        VStack {
                            Text("12:00")
                                .font(
                                    Font.custom("DIN Next LT W23", size: 12)
                                        .weight(.light)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Image("116")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(.top, 4) // Optional: Fügen Sie Padding nach Bedarf hinzu
                            
                            Text("22°")
                                .font(Font.custom("DIN Next LT W23", size: 16))
                                .foregroundColor(.white)
                                .frame(width: 25, height: 23.85, alignment: .topLeading)
                                .padding(.top, 4) // Optional: Fügen Sie Padding nach Bedarf hinzu
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 57, height: 86)
                            .background(Color(red: 0.2, green: 0.58, blue: 0.84))
                            .cornerRadius(8)
                        
                        VStack {
                            Text("10:00")
                                .font(
                                    Font.custom("DIN Next LT W23", size: 12)
                                        .weight(.light)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Image("116")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(.top, 4) // Optional: Fügen Sie Padding nach Bedarf hinzu
                            
                            Text("18°")
                                .font(Font.custom("DIN Next LT W23", size: 16))
                                .foregroundColor(.white)
                                .frame(width: 25, height: 23.85, alignment: .topLeading)
                                .padding(.top, 4) // Optional: Fügen Sie Padding nach Bedarf hinzu
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 57, height: 86)
                            .background(Color(red: 0.2, green: 0.58, blue: 0.84))
                            .cornerRadius(8)
                        
                        VStack {
                            Text("08:00")
                                .font(
                                    Font.custom("DIN Next LT W23", size: 12)
                                        .weight(.light)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Image("116")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(.top, 4) // Optional: Fügen Sie Padding nach Bedarf hinzu
                            
                            Text("13°")
                                .font(Font.custom("DIN Next LT W23", size: 16))
                                .foregroundColor(.white)
                                .frame(width: 25, height: 23.85, alignment: .topLeading)
                                .padding(.top, 4) // Optional: Fügen Sie Padding nach Bedarf hinzu
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 57, height: 86)
                            .background(Color(red: 0.2, green: 0.58, blue: 0.84))
                            .cornerRadius(8)
                        
                        VStack {
                            Text("16:00")
                                .font(
                                    Font.custom("DIN Next LT W23", size: 12)
                                        .weight(.light)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Image("116")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(.top, 4) // Optional: Fügen Sie Padding nach Bedarf hinzu
                            
                            Text("26°")
                                .font(Font.custom("DIN Next LT W23", size: 16))
                                .foregroundColor(.white)
                                .frame(width: 25, height: 23.85, alignment: .topLeading)
                                .padding(.top, 4) // Optional: Fügen Sie Padding nach Bedarf hinzu
                        }
                    }
                    
                    
                } // END HSTACK
                HStack {
                    Spacer()
                    Text("Windströmungen")
                        .font(
                            Font.custom("DIN Next LT W23", size: 12)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)
                        .padding()
                }
                
                HStack {
                    VStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 328, height: 160)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: .black.opacity(0.8), location: 0.00),
                                            Gradient.Stop(color: .black.opacity(0.4), location: 1.00),
                                        ],
                                        startPoint: UnitPoint(x: 1, y: 1),
                                        endPoint: UnitPoint(x: 0, y: 0)
                                    )
                                )
                                .cornerRadius(16)
                            Image("stroemungWind")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 311, height: 80)
                                .padding(.top, 40)
                                .cornerRadius(20)
                            
                        }
                        
                    }
                }
                
                Spacer()

            }
        }
        .frame(width: 380, height: 850)
        .background(Color(red: 0.31, green: 0.64, blue: 0.86))
        .cornerRadius(40)
    }
}

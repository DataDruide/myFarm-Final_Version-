
import Foundation
import SwiftUI

let selectedLanguageKey = "SelectedLanguage"

struct LanguageView: View {
    @State private var selectedLanguage: String
    @Environment(\.presentationMode) var presentationMode
    
    let languageOptions = [
        "Deutsch", "English", "Français", "Español",
        "Italiano", "Русский", "中文", "日本語", "العربية",
        "Português", "हिन्दी", "한국어", "Nederlands"
    ]
    
    init() {
        // Load the selected language from UserDefaults
        let storedLanguage = UserDefaults.standard.string(forKey: selectedLanguageKey) ?? "Deutsch"
        self._selectedLanguage = State(initialValue: storedLanguage)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(NSLocalizedString("Text11", comment: ""))
                    .font(.headline)
                    .padding()
                
                List(languageOptions, id: \.self) { language in
                    Button(action: {
                        selectedLanguage = language
                        UserDefaults.standard.set(selectedLanguage, forKey: selectedLanguageKey)
                    }) {
                        HStack {
                            Text(language)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            if selectedLanguage == language {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                    .padding(.vertical, 5)
                }
                
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text(NSLocalizedString("OK", comment: ""))
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color(red: 0.15, green: 0.35, blue: 0.43))
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .navigationBarTitle("Sprache Einstellen")
        }
    }
}

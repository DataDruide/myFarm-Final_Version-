//
//import SwiftUI
//import SwiftData
//
//struct CreateProfileView: View {
//    @State private var firstName = ""
//    @State private var lastName = ""
//    @State private var age = ""
//    @State private var street = ""
//    @State private var zipCode = ""
//    @State private var city = ""
//    @State private var language = ""
//    @State private var profileImage: Image? = nil
//    @State private var showImagePicker: Bool = false
//
//    
//     @Environment(\.modelContext) private var modelContext
//     @Query private var items: [Item]
//     @State private var input: String = ""
//
//    var body: some View {
//        Form {
//            Section(header: Text("Profil Bild")) {
//                if let profileImage = profileImage {
//                    profileImage
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 100, height: 100)
//                        .clipShape(Circle())
//                        .overlay(
//                            Circle()
//                                .stroke(Color.white, lineWidth: 4)
//                                .shadow(radius: 5)
//                        )
//                        .frame(maxWidth: .infinity)  // Fülle den verbleibenden Raum aus
//                        .padding()
//                        .onTapGesture {
//                            // Hier kannst du eine Animation oder weitere Aktionen hinzufügen, wenn auf das Bild getippt wird
//                        }
//                } else {
//                    Image(systemName: "person.circle.fill")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 100, height: 100)
//                        .clipShape(Circle())
//                        .foregroundColor(.gray)
//                        .overlay(
//                            Circle()
//                                .stroke(Color.white, lineWidth: 4)
//                                .shadow(radius: 5)
//                        )
//                        .frame(maxWidth: .infinity)  // Fülle den verbleibenden Raum aus
//                        .padding()
//                        .onTapGesture {
//                            showImagePicker = true
//                        }
//                    
//                    Text("HIER können Sie nach belieben ihr Profil ausfüllen und bei Fragen kommmen gegegebenfalls auf uns zurück.")
//                        .font(.custom("Montserrat", size: 15))
//
//                    HStack {
//                        Text("Gärtnerlevel:")
//                            .fontWeight(.semibold)
//                        Spacer()
//                        Text("DerNeue")
//                    }
//                }
//
//            }
//
//            Section(header: Text("Persönliche Informationen")) {
//                TextField("Vorname", text: $firstName)
//                TextField("Nachname", text: $lastName)
//                TextField("Alter", text: $age)
//            }
//            
//            Section(header: Text("Adresse")) {
//                TextField("Sraße", text: $street)
//                TextField("Postleitzahl", text: $zipCode)
//                TextField("Stadt", text: $city)
//            }
//            
//            Section(header: Text("Sprache")) {
//                TextField("Sprache", text: $language)
//            }
//            HStack {
//                Spacer()
//                Button("Profil erstellen") {
//                    saveProfile()
//                }
//                .multilineTextAlignment(.center)
//                .frame(width: 150)
//                .padding()
//                .background(Color(red: 0.15, green: 0.35, blue: 0.43))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                .padding()
//                .animation(.easeInOut(duration: 0.3))
//                Spacer()
//            }
//        }
//        .padding()
//        .navigationTitle("Create Profile")
//        .sheet(isPresented: $showImagePicker) {
//            ImagePicker(image: $profileImage)
//        }
//    }
//    
//    func saveProfile() {
//        let profileItem = Item(
//            firstName: firstName,
//            lastName: lastName,
//            age: age,
//            street: street,
//            zipCode: zipCode,
//            city: city,
//            language: language
//        )
//        
//        // Speichere bei Bedarf die Profilbilddaten
//        // Zum Beispiel kannst du das Image in Data konvertieren und in deinem Item speichern
//        
//        modelContext.insert(profileItem)
//        try? modelContext.save()
//        
//        // Optional: Hier kannst du die eingegebenen Profildaten weiterverarbeiten oder eine Erfolgsmeldung anzeigen
//    }
//}
//
//
//
//#Preview {
//    CreateProfileView()
//}

//
//import SwiftUI
//import SwiftData
//
//struct CreateProfilView: View {
//    
//    @Environment(\.modelContext) private var modelContext
//    @Query private var profiles: [Profil]
//    @State private var firstName: String = ""
//    @State private var lastName: String = ""
//    @State private var age: String = ""
//    @State private var street: String = ""
//    @State private var zipCode: String = ""
//    @State private var city: String = ""
//    @State private var language: String = ""
//    @State private var profileImage: Image? = nil
//    @State private var showImagePicker: Bool = false
//
//    var body: some View {
//        
//        NavigationSplitView {
//            Section(header: Text("Profil Bild")) {
//                if let profileImage = profileImage {
//                    profileImage
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 100, height: 100)
//                        .clipShape(Circle())
//                        .overlay(
//                            Circle()
//                                .stroke(Color.white, lineWidth: 4)
//                                .shadow(radius: 5)
//                        )
//                        .frame(maxWidth: .infinity)  // Fülle den verbleibenden Raum aus
//                        .padding()
//                        .onTapGesture {
//                            // Hier kannst du eine Animation oder weitere Aktionen hinzufügen, wenn auf das Bild getippt wird
//                        }
//                } else {
//                    Image(systemName: "person.circle.fill")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 100, height: 100)
//                        .clipShape(Circle())
//                        .foregroundColor(.gray)
//                        .overlay(
//                            Circle()
//                                .stroke(Color.white, lineWidth: 4)
//                                .shadow(radius: 5)
//                        )
//                        .frame(maxWidth: .infinity)  // Fülle den verbleibenden Raum aus
//                        .padding()
//                        .onTapGesture {
//                            showImagePicker = true
//                        }
//                    
//                    Text("HIER können Sie nach belieben ihr Profil ausfüllen und bei Fragen kommmen gegegebenfalls auf uns zurück.")
//                        .font(.custom("Montserrat", size: 15))
//                    
//                    HStack {
//                        Text("Gärtnerlevel:")
//                            .fontWeight(.semibold)
//                        Spacer()
//                        Text("DerNeue")
//                    }
//                }
//            }
//        
//            VStack {
//                HStack {
//                    TextField("First Name", text: $firstName)
//                    TextField("Last Name", text: $lastName)
//                }
//                HStack {
//                    TextField("Age", text: $age)
//                    TextField("Street", text: $street)
//                }
//                HStack {
//                    TextField("Zip Code", text: $zipCode)
//                    TextField("City", text: $city)
//                }
//                HStack {
//                    TextField("Language", text: $language)
//                }
//                HStack {
//                    Button("Add Profile") {
//                        addProfile()
//                    }
//                }
//                
//                HStack {
//                    List {
//                        ForEach(profiles) { profile in
//                            NavigationLink {
//                                Text("\(profile.firstName) \(profile.lastName)")
//                                    .onAppear() {
//                                        // Setzen der Werte für die Bearbeitung
//                                        firstName = profile.firstName
//                                        lastName = profile.lastName
//                                        age = profile.age
//                                        street = profile.street
//                                        zipCode = profile.zipCode
//                                        city = profile.city
//                                        language = profile.language
//                                    }
//                                
//                                HStack {
//                                    TextField("Update First Name", text: $firstName)
//                                    TextField("Update Last Name", text: $lastName)
//                                }
//                                HStack {
//                                    TextField("Update Age", text: $age)
//                                    TextField("Update Street", text: $street)
//                                }
//                                HStack {
//                                    TextField("Update Zip Code", text: $zipCode)
//                                    TextField("Update City", text: $city)
//                                }
//                                HStack {
//                                    TextField("Update Language", text: $language)
//                                }
//                                Button("Update Profile") {
//                                    updateProfile(profile)
//                                }
//                            } label: {
//                                Text("\(profile.firstName) \(profile.lastName)")
//                            }
//                        }.onDelete(perform: { indexSet in
//                            for index in indexSet {
//                                deleteProfile(profiles[index])
//                            }
//                        })
//                    }
//                }
//            }.padding()
//        } detail: {
//            Text("Select a profile")
//        }
//    }
//    
//    // Funktion zum Hinzufügen eines Profils
//    func addProfile() {
//        let profile = Profil(
//            firstName: firstName,
//            lastName: lastName,
//            age: age,
//            street: street,
//            zipCode: zipCode,
//            city: city,
//            language: language
//        )
//        modelContext.insert(profile)
//        clearFields()
//    }
//    
//    // Funktion zum Aktualisieren eines Profils
//    func updateProfile(_ profile: Profil) {
//        profile.firstName = firstName
//        profile.lastName = lastName
//        profile.age = age
//        profile.street = street
//        profile.zipCode = zipCode
//        profile.city = city
//        profile.language = language
//        try? modelContext.save()
//        clearFields()
//    }
//    
//    // Funktion zum Löschen eines Profils
//    func deleteProfile(_ profile: Profil) {
//        modelContext.delete(profile)
//    }
//    
//    // Funktion zum Löschen der Textfelder nach Abschluss einer Aktion
//    func clearFields() {
//        firstName = ""
//        lastName = ""
//        age = ""
//        street = ""
//        zipCode = ""
//        city = ""
//        language = ""
//    }
//}
import SwiftUI
import SwiftData

struct CreateProfilView: View {
  
  @Environment(\.modelContext) private var modelContext
  @Query private var profiles: [Profil]
  
  @State private var input: String = ""
  @State private var firstName: String = ""
  @State private var lastName: String = ""
  @State private var age: String = ""
  @State private var street: String = ""
  @State private var zipCode: String = ""
  @State private var city: String = ""
  @State private var language: String = ""
  @State private var profileImage: Image? = nil
  @State private var showImagePicker: Bool = false
  
  var body: some View {
    NavigationSplitView {
      Form {
        if let profileImage = profileImage {
          profileImage
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(
              Circle()
                .stroke(Color.white, lineWidth: 4)
                .shadow(radius: 5)
            )
            .frame(maxWidth: .infinity)
            .padding()
            .onTapGesture {
              // ... optionale Aktion beim Tippen auf das Bild
            }
        } else {
          Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .foregroundColor(.gray)
            .overlay(
              Circle()
                .stroke(Color.white, lineWidth: 4)
                .shadow(radius: 5)
            )
            .frame(maxWidth: .infinity)
            .padding()
            .onTapGesture {
              showImagePicker = true
            }
        }
        
        Text("HIER können Sie nach belieben ihr Profil ausfüllen und bei Fragen kommmen gegegebenfalls auf uns zurück.")
          .font(.custom("Montserrat", size: 15))
        
        HStack {
          Text("Gärtnerlevel:")
            .fontWeight(.semibold)
          Spacer()
          Text("DerNeue")
        }
        
        Section(header: Text("Persönliche Informationen")) {
          TextField("Vorname", text: $firstName)
          TextField("Nachname", text: $lastName)
          TextField("Alter", text: $age)
        }
        
        Section(header: Text("Adresse")) {
          TextField("Straße", text: $street)
          TextField("Postleitzahl", text: $zipCode)
          TextField("Stadt", text: $city)
        }
        
        Section(header: Text("Sprache")) {
          TextField("Sprache", text: $language)
        }
      }
      .sheet(isPresented: $showImagePicker) {
        ImagePicker(image: $profileImage)
      }
      
      Button("Profil erstellen") {
        addProfile()
      }
      .font(.headline)
      .foregroundColor(.white)
      .padding()
      .frame(width: 200, height: 50)
      .background(Color(red: 0.15, green: 0.35, blue: 0.43))
      .cornerRadius(10)
    } detail: {
      Text("Select a profile")
    }
  }

    // Funktion zum Hinzufügen eines Profils
    func addProfile() {
        let profile = Profil(
            firstName: firstName,
            lastName: lastName,
            age: age,
            street: street,
            zipCode: zipCode,
            city: city,
            language: language
        )

        do {
            try modelContext.save()
            modelContext.insert(profile)  // Hinzufügen des Profils zum Kontext
            print("Profil erfolgreich erstellt")
            clearFields()
        } catch {
            print("Fehler beim Erstellen des Profils: \(error)")
        }
    }



    func updateProfile(_ profile: Profil) {
      profile.firstName = firstName
      profile.lastName = lastName
      profile.age = age
      profile.street = street
      profile.zipCode = zipCode
      profile.city = city
      profile.language = language
      
      try? modelContext.save()
      clearFields()
    }

    func deleteProfile(_ profile: Profil) {
      modelContext.delete(profile)
    }

        
        // Funktion zum Löschen der Textfelder nach Abschluss einer Aktion
        func clearFields() {
            firstName = ""
            lastName = ""
            age = ""
            street = ""
            zipCode = ""
            city = ""
            language = ""
        }
}
import SwiftData
//
//extension ModelContext {
//    func findAll<T: Entity>(_ type: T.Type) throws -> [T] {
//        // Implementation for retrieving all entities of type T
//        // This depends on your specific SwiftData setup
//    }
//}


//// Version 3 .
//import SwiftUI
//import SwiftData
//
//class ProfileViewModel: ObservableObject {
//    @Published var profiles: [Profil] = []
//    var modelContext: ModelContext
//
//    init(modelContext: ModelContext) {
//        self.modelContext = modelContext
//      //  loadProfiles()
//    }
//
//    func addProfile(firstName: String, lastName: String, age: String, street: String, zipCode: String, city: String, language: String) {
//        let profile = Profil(
//            firstName: firstName,
//            lastName: lastName,
//            age: age,
//            street: street,
//            zipCode: zipCode,
//            city: city,
//            language: language
//        )
//
//        do {
//            try modelContext.insert(profile)
//            try modelContext.save()
//          //  loadProfiles()
//            print("Profil erfolgreich erstellt")
//        } catch {
//            print("Fehler beim Erstellen des Profils: \(error)")
//        }
//    }
//
//    func updateProfile(_ profile: Profil) {
//        // Hier implementiere die Logik zum Aktualisieren eines Profils
//        // ...
//       // loadProfiles()
//    }
//
//    func deleteProfile(_ profile: Profil) {
//        modelContext.delete(profile)
//      //  loadProfiles()
//    }
//
////    func loadProfiles() {
////        do {
////            profiles = try modelContext.findAll(Profil.self)
////        } catch {
////            print("Fehler beim Laden der Profile: \(error)")
////        }
////    }
//
//
//}
//
//
//struct CreateProfilView: View {
//    @Environment(\.modelContext) private var modelContext
//    @StateObject private var viewModel: ProfileViewModel
//
//    init(modelContext: ModelContext) {
//        _viewModel = StateObject(wrappedValue: ProfileViewModel(modelContext: modelContext))
//    }
//
//    @State private var firstName: String = ""
//    @State private var lastName: String = ""
//    @State private var age: String = ""
//    @State private var street: String = ""
//    @State private var zipCode: String = ""
//    @State private var city: String = ""
//    @State private var language: String = ""
//    @State private var profileImage: Image? = nil
//    @State private var showImagePicker: Bool = false
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(viewModel.profiles) { profile in
//                    NavigationLink(destination: EditProfileView(profile: profile, viewModel: viewModel)) {
//                        ProfileCardView(profile: profile)
//                    }
//                }
//            }
//            .navigationTitle("Profile List")
//
//            Form {
//                // ... (Rest des Codes bleibt unverändert)
//            }
//            .sheet(isPresented: $showImagePicker) {
//                ImagePicker(image: $profileImage)
//            }
//
//            Button("Profil erstellen") {
//                viewModel.addProfile(firstName: firstName, lastName: lastName, age: age, street: street, zipCode: zipCode, city: city, language: language)
//            }
//            .font(.headline)
//            .foregroundColor(.white)
//            .padding()
//            .frame(width: 200, height: 50)
//            .background(Color(red: 0.15, green: 0.35, blue: 0.43))
//            .cornerRadius(10)
//        } detail: {
//            Text("Select a profile")
//        }
//        .onAppear {
//         //   viewModel.loadProfiles()
//        }
//    }
//}
//
//struct ProfileCardView: View {
//    var profile: Profil
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("\(profile.firstName) \(profile.lastName)")
//                .font(.headline)
//            Text("Age: \(profile.age)")
//                .font(.subheadline)
//            Text("Address: \(profile.street), \(profile.zipCode) \(profile.city)")
//                .font(.subheadline)
//            Text("Language: \(profile.language)")
//                .font(.subheadline)
//        }
//        .padding()
//    }
//}
//
//struct EditProfileView: View {
//    var profile: Profil
//    var viewModel: ProfileViewModel
//
//    @State private var editedFirstName: String = ""
//    @State private var editedLastName: String = ""
//    @State private var editedAge: String = ""
//    @State private var editedStreet: String = ""
//    @State private var editedZipCode: String = ""
//    @State private var editedCity: String = ""
//    @State private var editedLanguage: String = ""
//
//    var body: some View {
//        Form {
//            Section(header: Text("Personal Information")) {
//                TextField("First Name", text: $editedFirstName)
//                TextField("Last Name", text: $editedLastName)
//                TextField("Age", text: $editedAge)
//            }
//
//            Section(header: Text("Address")) {
//                TextField("Street", text: $editedStreet)
//                TextField("Zip Code", text: $editedZipCode)
//                TextField("City", text: $editedCity)
//            }
//
//            Section(header: Text("Language")) {
//                TextField("Language", text: $editedLanguage)
//            }
//        }
//        .onAppear {
//            // Initialisiere die Bearbeitungsfelder mit den aktuellen Profildaten
//            editedFirstName = profile.firstName
//            editedLastName = profile.lastName
//            editedAge = profile.age
//            editedStreet = profile.street
//            editedZipCode = profile.zipCode
//            editedCity = profile.city
//            editedLanguage = profile.language
//        }
//        .navigationBarTitle("Edit Profile")
//        .navigationBarItems(trailing: Button("Save Changes") {
//            saveChanges()
//        })
//    }
//
//    func saveChanges() {
//        profile.firstName = editedFirstName
//        profile.lastName = editedLastName
//        profile.age = editedAge
//        profile.street = editedStreet
//        profile.zipCode = editedZipCode
//        profile.city = editedCity
//        profile.language = editedLanguage
//
//        viewModel.updateProfile(profile)
//    }
//}

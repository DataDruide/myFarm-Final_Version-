//
//import Foundation
//import SwiftData
//
//
//@Model
//class Item: Identifiable {
//    var id = UUID()
//    var firstName: String
//    var lastName: String
//    var age: String
//    var street: String
//    var zipCode: String
//    var city: String
//    var language: String
//    
//    init(firstName: String, lastName: String, age: String, street: String, zipCode: String, city: String, language: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//        self.street = street
//        self.zipCode = zipCode
//        self.city = city
//        self.language = language
//    }
//    
//    
//}
import SwiftData
import Foundation
@Model
class Profil: Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var age: String
    var street: String
    var zipCode: String
    var city: String
    var language: String

    init(
        firstName: String,
        lastName: String,
        age: String,
        street: String,
        zipCode: String,
        city: String,
        language: String
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.street = street
        self.zipCode = zipCode
        self.city = city
        self.language = language
    }
}

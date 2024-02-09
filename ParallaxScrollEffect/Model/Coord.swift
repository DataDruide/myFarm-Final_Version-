
import Foundation

// Coord Model
struct Coord: Codable {
    let lon: Double
    let lat: Double
}

// Weather Model
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// Main Model
struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}

// Wind Model
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

// Rain Model
struct Rain: Codable {
    let oneHour: Double

    private enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}


// Clouds Model
struct Clouds: Codable {
    let all: Int
}

// Sys Model
struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: TimeInterval
    let sunset: TimeInterval
}
struct WeatherResponse: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain?
    let clouds: Clouds
    let dt: TimeInterval
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        coord = try container.decode(Coord.self, forKey: .coord)
        weather = try container.decode([Weather].self, forKey: .weather)
        base = try container.decode(String.self, forKey: .base)
        main = try container.decode(Main.self, forKey: .main)
        visibility = try container.decode(Int.self, forKey: .visibility)
        wind = try container.decode(Wind.self, forKey: .wind)
        rain = try container.decodeIfPresent(Rain.self, forKey: .rain)
        clouds = try container.decode(Clouds.self, forKey: .clouds)
        dt = try container.decode(TimeInterval.self, forKey: .dt)
        sys = try container.decode(Sys.self, forKey: .sys)
        timezone = try container.decode(Int.self, forKey: .timezone)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        cod = try container.decode(Int.self, forKey: .cod)
    }
    
    // Hier können Sie auch CodingKeys für die einzelnen Eigenschaften definieren, wenn die Namen abweichen.
    private enum CodingKeys: String, CodingKey {
        case coord
        case weather
        case base
        case main
        case visibility
        case wind
        case rain
        case clouds
        case dt
        case sys
        case timezone
        case id
        case name
        case cod
    }
}

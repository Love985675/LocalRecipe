import Foundation

struct Recipe: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var ingredients: [String]
    var instructions: String
    var cookingTime: TimeInterval
    var rating: Int
    var cuisine: String
    var imageName: String // Add imageName property for the image
    
    // Other properties and methods
    
    // Example init method with imageName
    init(name: String, ingredients: [String], instructions: String, cookingTime: TimeInterval, rating: Int, cuisine: String, imageName: String) {
        self.name = name
        self.ingredients = ingredients
        self.instructions = instructions
        self.cookingTime = cookingTime
        self.rating = rating
        self.cuisine = cuisine
        self.imageName = imageName
    }
}

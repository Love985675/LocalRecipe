import Foundation
struct DayRecipeSelection: Identifiable {
    var id = UUID()
    var day: String
    var recipe: Recipe?
}

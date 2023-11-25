import Foundation

class RecipeManager: ObservableObject  {
    static let shared = RecipeManager()
    @Published var recipes: [Recipe] = [
        Recipe(name: "Spaghetti Bolognese", ingredients: ["Ground beef", "Tomato sauce", "Onions", "Garlic", "Spaghetti"], instructions: "Cook spaghetti. Brown beef, onions, and garlic. Add tomato sauce. Simmer. Serve sauce over cooked spaghetti.", cookingTime: 30, rating: 5, cuisine: "Italian", imageName: "Spaghetti-Bolognese-square-FS-0204.imageset"),
        Recipe(name: "Chicken Stir Fry", ingredients: ["Chicken breast", "Broccoli", "Carrots", "Soy sauce", "Ginger", "Garlic"], instructions: "Slice chicken. Stir-fry chicken and vegetables in a wok. Add soy sauce, ginger, and garlic. Cook until chicken is done.", cookingTime: 20, rating: 4, cuisine: "Asian", imageName: "Chicken Stir Fry.imageset"),
        Recipe(name: "Margherita Pizza", ingredients: ["Pizza dough", "Tomato sauce", "Fresh mozzarella", "Basil", "Olive oil"], instructions: "Roll out pizza dough. Spread tomato sauce. Add slices of fresh mozzarella. Bake until crust is golden. Top with fresh basil and a drizzle of olive oil.", cookingTime: 25, rating: 4, cuisine: "Italian", imageName: "pizza"),
                Recipe(name: "Grilled Salmon", ingredients: ["Salmon fillet", "Lemon", "Olive oil", "Garlic", "Dill"], instructions: "Marinate salmon in olive oil, lemon juice, minced garlic, and dill. Grill until salmon is cooked through. Serve with lemon wedges.", cookingTime: 15, rating: 4, cuisine: "Seafood", imageName: "Grilled Salmon"),
                Recipe(name: "Vegetable Stir Fry", ingredients: ["Broccoli", "Carrots", "Bell peppers", "Soy sauce", "Sesame oil", "Ginger"], instructions: "Slice vegetables. Stir-fry in sesame oil and soy sauce. Add ginger for flavor. Cook until vegetables are tender. Serve over rice.", cookingTime: 15, rating: 4, cuisine: "Asian", imageName: "Vegetable Stir Fry"),
                Recipe(name: "Chocolate Chip Cookies", ingredients: ["Flour", "Butter", "Sugar", "Eggs", "Chocolate chips", "Vanilla extract"], instructions: "Cream butter and sugar. Add eggs and vanilla. Mix in flour and chocolate chips. Drop spoonfuls onto a baking sheet. Bake until golden brown.", cookingTime: 12, rating: 5, cuisine: "Dessert", imageName: "Chocolate Chip Cookies"),
                Recipe(name: "Caesar Salad", ingredients: ["Romaine lettuce", "Croutons", "Parmesan cheese", "Caesar dressing"], instructions: "Toss chopped lettuce with croutons, Parmesan cheese, and Caesar dressing. Serve immediately.", cookingTime: 10, rating: 4, cuisine: "Salad", imageName: "Caesar Salad"),
                Recipe(name: "Chicken Alfredo Pasta", ingredients: ["Fettuccine pasta", "Chicken breast", "Heavy cream", "Parmesan cheese", "Garlic", "Butter"], instructions: "Cook pasta. Sauté chicken and garlic in butter. Add heavy cream and Parmesan cheese. Mix with cooked pasta.", cookingTime: 30, rating: 5, cuisine: "Italian", imageName: "Chicken Alfredo Pasta"),
                Recipe(name: "Vegetarian Chili", ingredients: ["Black beans", "Kidney beans", "Tomatoes", "Bell peppers", "Onions", "Chili powder"], instructions: "Combine beans, tomatoes, bell peppers, onions, and chili powder. Simmer until vegetables are tender. Serve with toppings like cheese and sour cream.", cookingTime: 25, rating: 4, cuisine: "Mexican", imageName: "Vegetarian Chili"),
                Recipe(name: "Caprese Salad", ingredients: ["Tomatoes", "Fresh mozzarella", "Basil", "Balsamic glaze", "Olive oil"], instructions: "Slice tomatoes and mozzarella. Arrange on a plate with fresh basil leaves. Drizzle with balsamic glaze and olive oil. Season with salt and pepper.", cookingTime: 10, rating: 4, cuisine: "Italian", imageName: "Caprese Salad"),
                
    ]
    
    func addRecipe(_ recipe: Recipe) {
            recipes.append(recipe)
        }
    private init() {
        // Load recipes from storage or a server
    }
}

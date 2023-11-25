// AddRecipeView.swift

import SwiftUI

struct AddRecipeView: View {
    @Binding var isPresented: Bool

    @State private var recipeName = ""
    @State private var ingredients = ""
    @State private var instructions = ""

    var body: some View {
        Form {
            Section(header: Text("Recipe Details")) {
                TextField("Recipe Name", text: $recipeName)
                TextField("Ingredients (comma-separated)", text: $ingredients)
                TextEditor(text: $instructions)
                    .frame(height: 150)
            }

            Section {
                Button("Save Recipe") {
                    saveRecipe()
                }
            }
        }
        .navigationBarTitle("Add Recipe")
        .navigationBarItems(trailing: Button("Done") {
            isPresented.toggle()
        })
    }

    private func saveRecipe() {
        // Implement your logic to save the new recipe
        let newRecipe = Recipe(name: recipeName,
                               ingredients: ingredients.components(separatedBy: ","),
                               instructions: instructions,
                               cookingTime: 0, // You might want to add a cooking time field
                               rating: 0,     // You might want to add a rating field
                               cuisine: "Custom", // You might want to add a cuisine field
                               imageName: "custom_image") // You might want to add an image field

        RecipeManager.shared.addRecipe(newRecipe)
        
        // Close the AddRecipeView
        isPresented.toggle()
    }
}

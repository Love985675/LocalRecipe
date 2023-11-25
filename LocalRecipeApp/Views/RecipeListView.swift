import SwiftUI

struct RecipeListView: View {
 
    var recipes: [Recipe]?

       
    var body: some View {
        List(recipes ?? RecipeManager.shared.recipes) { recipe in
            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(recipe.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        // Star Rating System
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= Int(recipe.rating) ? "star.fill" : "star")
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.horizontal, 8)
                    
                    HStack {
                        Image(systemName: "clock").foregroundColor(.blue)
                        Text("\(Int(recipe.cookingTime)) mins")
                            .foregroundColor(.blue)
                            
                    }
                    .padding(.horizontal, 8)
                    
                    // Additional Information
                    Text("Cuisine: \(recipe.cuisine)")
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                    
                    // You can add more information or styling as needed
                }
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white)) 
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 2)
                )
            }
            .padding(.vertical, 8)
        }
        .navigationTitle("Recipes")
    }

    
    
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
    
}


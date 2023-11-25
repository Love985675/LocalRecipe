import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var isAddingRecipe = false
    
    var body: some View {
        NavigationView {
            
                VStack {
                    

                    Image("cover") // Placeholder for your app cover image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                    
                    Text("Welcome to")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding()
                    
                    Image("logo") // Assuming "AppLogo" is the name you gave to your image set
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .cornerRadius(100)
                    
                    Text("Discover and Cook Delicious Recipes!")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                        .multilineTextAlignment(.center)
                    
                    
                    Spacer()
                    
                    SearchBar2(text: $searchText, isSearching: $isSearching)
                                        .padding(.horizontal)
                                        .onChange(of: searchText) { _ in
                                            isSearching = !searchText.isEmpty
                                        }
                    if isSearching {
                                        // Display search results based on searchText
                                        RecipeListView(recipes: filteredRecipes())
                            .frame(height: 250)
                                    }
                    

                    Spacer()
                    Spacer()
                   
                    NavigationLink(destination: RecipeListView()) {
                        Text("Explore Recipes")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(10)
                            .padding(20)
                    }
                    
                    Spacer()
                    NavigationLink(destination: MealPlannerView()) {
                                        Text("Meal Planner")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color.orange)
                                            .cornerRadius(10)
                                            .padding(20)
                                    }

                                    Spacer()
                    
                    Button(action: {
                                            isAddingRecipe.toggle()
                                        }) {
                                            Image(systemName: "plus.circle.fill")
                                                .font(.title)
                                                .foregroundColor(.red)
                                        }
                                        .padding(.trailing,1)
                                        .sheet(isPresented: $isAddingRecipe) {
                                            // Present the add recipe view
                                            AddRecipeView(isPresented: $isAddingRecipe)
                                        }
                                    
                    
                    VStack {
                        Text("App Developed by")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Sukhamrit")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .padding()
                }
                .navigationBarHidden(true)
            }
        }
    
    private func filteredRecipes() -> [Recipe] {
            // Implement your filtering logic based on searchText
            return RecipeManager.shared.recipes.filter { recipe in
                return recipe.name.lowercased().contains(searchText.lowercased())
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


import SwiftUI

struct RecipeDetailView: View {
    @State private var isBookmarked = false // Track bookmark state
    var recipe: Recipe
    
    @State private var showingShareSheet = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                loadImage()
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(10)
                
                Spacer()
                
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity) // Make the text full-width
                    .background(Color.orange)
                    .cornerRadius(10) // Round the corners
                
                Spacer()
                
                HStack {
                    Image(systemName: "clock")
                    Text("\(Int(recipe.cookingTime)) mins")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                
                HStack {
                                   Spacer() // Pushes the bookmark button to the right
                                   // Bookmark Button
                                   Button(action: {
                                       isBookmarked.toggle()
                                       // Add logic to handle bookmarking (e.g., saving to a user's profile)
                                   }) {
                                       Image(systemName: isBookmarked ? "heart.fill" : "bookmark")
                                           .resizable()
                                           .frame(width: 25, height: 25)
                                           .foregroundColor(isBookmarked ? .red : .black)
                                           .padding(.top, 10)
                                       
                                   }
                               }
                
                Text("Ingredients:")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("• \(ingredient)")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                
                HStack {
                    // Orange line below each recipe entry
                    Rectangle()
                        .fill(Color.orange)
                        .frame(height: 2)
                        .padding(.top, 8)
                        .opacity(0.5) // Adjust the opacity if needed
                }
                
                Text("Instructions:")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                Text(recipe.instructions)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                HStack {
                    // Orange line below each recipe entry
                    Rectangle()
                        .fill(Color.orange)
                        .frame(height: 2)
                        .padding(.top, 8)
                        .opacity(0.5) // Adjust the opacity if needed
                }
                
                // Share Button
                Button(action: {
                    showingShareSheet.toggle()
                }) {
                    Text("Share")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(20)
                }
                .sheet(isPresented: $showingShareSheet) {
                    ShareSheet(activityItems: [recipe.name, recipe.ingredients, recipe.instructions])
                }
                
                
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.orange, lineWidth: 2)
            )
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 18)
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func loadImage() -> Image {
        if let uiImage = UIImage(named: recipe.imageName) {
            return Image(uiImage: uiImage)
        } else {
            return Image(systemName: "photo")
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe(name: "Sample Recipe", ingredients: ["Ingredient 1", "Ingredient 2"], instructions: "Sample instructions", cookingTime: 30, rating: 4, cuisine: "Italian", imageName: "sample_image"))
    }
}

// ShareSheet for handling sharing activity
struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // Nothing to do here
    }
}

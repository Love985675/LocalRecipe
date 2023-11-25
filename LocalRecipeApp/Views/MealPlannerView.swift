import SwiftUI

struct MealPlannerView: View {
    @State private var mealPlan: [MealPlan] = []
    @State private var selectedDay: String = "Day 1"
    @State private var selectedRecipe: String = "Spaghetti Bolognese"
    @State private var showingShareSheet = false

    let recipeNamesForPicker = [
        "Spaghetti Bolognese",
        "Chicken Stir Fry",
        "Margherita Pizza",
        "Grilled Salmon",
        "Vegetable Stir Fry",
        "Chocolate Chip Cookies",
        "Caesar Salad",
        "Chicken Alfredo Pasta",
        "Vegetarian Chili",
        "Caprese Salad"
    ]

    let days = (1...7).map { "Day \($0)" }

    var body: some View {
        VStack {
            Text("Meal Planner")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            HStack {
                Picker("Select Day", selection: $selectedDay) {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                    }
                }
                .pickerStyle(MenuPickerStyle())

                Spacer()

                Picker("Select Recipe", selection: $selectedRecipe) {
                    ForEach(recipeNamesForPicker, id: \.self) { recipeName in
                        Text(recipeName)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }

            

            // Share Button
            Button(action: {
                // Prepare content to share
                let shareContent = mealPlan.map { "\($0.day): \($0.recipe)" }.joined(separator: "\n")

                // Show the ShareSheet
                showingShareSheet.toggle()
            }) {
                Text("Share Meal Plan")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding(20)
            }
            .sheet(isPresented: $showingShareSheet) {
                ShareSheet2(activityItems: [selectedDay,selectedRecipe])
            }
        }
        .padding()
    }
}


struct ShareSheet2: UIViewControllerRepresentable {
    var activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // Nothing to do here
    }
}

struct MealPlannerView_Previews: PreviewProvider {
    static var previews: some View {
        MealPlannerView()
    }
}

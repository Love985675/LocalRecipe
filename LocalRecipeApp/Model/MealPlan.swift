import Foundation
// MealPlan.swift
struct MealPlan: Identifiable, Hashable { // Add Hashable conformance
    var id = UUID()
    var day: String
    var recipe: Recipe
}

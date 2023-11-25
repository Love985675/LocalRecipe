
// SearchBar.swift

import SwiftUI

struct SearchBar2: View {
    @Binding var text: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.leading, 24)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .cornerRadius(10)

            Button(action: {
                text = ""
                isSearching = false
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
            .transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching {
                Button(action: {
                    text = ""
                    isSearching = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                        .foregroundColor(.blue)
                        .padding(.trailing, 8)
                }
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
        .padding(.horizontal)
        .onTapGesture {
            isSearching = true
        }
    }
}

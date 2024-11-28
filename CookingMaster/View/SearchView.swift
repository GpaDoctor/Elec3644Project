import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var filteredRecipes: [Recipe] = []
    @State private var selectedFilters: [String] = []
    @State private var showResults = false

    var allRecipes: [Recipe] = recipesData

    struct FilterGroup: Identifiable {
        let id = UUID()
        let category: String
        let filters: [String]
    }

    let groupedFilters: [FilterGroup] = [
        FilterGroup(category: "Meal Type", filters: ["Breakfast", "Lunch", "Dinner", "Snacks"]),
        FilterGroup(category: "Dietary Preferences", filters: ["Vegetarian", "Vegan", "Gluten-Free", "Keto"]),
        FilterGroup(category: "Cuisine", filters: ["Italian", "Mexican", "Chinese", "Indian"]),
        FilterGroup(category: "Difficulty", filters: ["Easy", "Medium", "Hard"]),
        FilterGroup(category: "Cooking Time", filters: ["< 30 mins", "30-60 mins", "> 60 mins"]),
        FilterGroup(category: "Food", filters:["Pork", "Beef", "Fish", "Chicken"])
    ]

    var suggestions: [String] {
        let allKeywords = Set(allRecipes.flatMap { recipe in
            [recipe.title] + recipe.ingredients
        })
        return allKeywords.filter { keyword in
            keyword.lowercased().contains(searchText.lowercased()) && keyword.lowercased() != searchText.lowercased()
        }.sorted()
    }

    var body: some View {
        VStack(spacing: 0) {
            // Search Bar
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search for recipes", text: $searchText)
                        .foregroundColor(.primary)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onSubmit {
                            // Do nothing here; navigation happens via "Show Results" button
                        }
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.top)

            // Suggestions
            if !suggestions.isEmpty && !searchText.isEmpty {
                List {
                    ForEach(suggestions.prefix(5), id: \.self) { suggestion in
                        Text(suggestion)
                            .onTapGesture {
                                self.searchText = suggestion
                            }
                    }
                }
                .listStyle(PlainListStyle())
                .frame(maxHeight: 200)
            }

            // Filters Section
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(groupedFilters) { group in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(group.category)
                                .font(.headline)
                                .padding(.horizontal)

                            // Filters in each group
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(group.filters, id: \.self) { filter in
                                        FilterButton(filter: filter, isSelected: self.selectedFilters.contains(filter)) {
                                            if self.selectedFilters.contains(filter) {
                                                self.selectedFilters.removeAll(where: { $0 == filter })
                                            } else {
                                                self.selectedFilters.append(filter)
                                            }
                                            // No immediate navigation
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.top)
            }

            // "Show Results" Button
            
            HStack {
                Button(action: {
                    self.applyFilters()
                    self.showResults = true
                }) {
                    Text("Show Results")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .padding()
                        .background((!selectedFilters.isEmpty || !searchText.isEmpty) ? Color.blue : Color.gray)
                        .cornerRadius(10)
                }
                .disabled(selectedFilters.isEmpty && searchText.isEmpty)
                
                Button(action: {
                    self.selectedFilters.removeAll()
                    self.searchText = ""
                }) {
                    Text("Clear All")
                        .font(.subheadline)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .padding()
                        .background(Color.clear)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            

            // NavigationLink to ResultView
            NavigationLink(
                destination: ResultView(filteredRecipes: self.filteredRecipes, searchText: self.searchText, selectedFilters: self.selectedFilters),
                isActive: $showResults,
                label: { EmptyView() }
            )
        }
        .navigationBarTitle("Search", displayMode: .inline)
    }

    func applyFilters() {
        DispatchQueue.global(qos: .userInitiated).async {
            var filtered = self.allRecipes

            // Filter by search text
            if !self.searchText.isEmpty {
                filtered = filtered.filter { recipe in
                    recipe.title.lowercased().contains(self.searchText.lowercased()) ||
                    recipe.headline.lowercased().contains(self.searchText.lowercased()) ||
                    recipe.ingredients.joined(separator: " ").lowercased().contains(self.searchText.lowercased())
                }
            }

            // Filter by selected filters
            if !self.selectedFilters.isEmpty {
                filtered = filtered.filter { recipe in
                    let recipeTags = recipe.tags.map { $0.lowercased() }
                    return !Set(self.selectedFilters.map { $0.lowercased() }).isDisjoint(with: recipeTags)
                }
            }

            DispatchQueue.main.async {
                withAnimation {
                    self.filteredRecipes = filtered
                }
            }
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

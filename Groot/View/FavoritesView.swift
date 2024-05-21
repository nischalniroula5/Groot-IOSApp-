//
//  FavouritesView.swift
//  Groot
//
//  Created by Nischal Niroula on 24/4/2024.
//
import SwiftUI

struct FavoritesView: View {
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    var customRed = Color(red: 255 / 255.0, green: 136 / 255.0, blue: 137 / 255.0)
    
    @ObservedObject var favoritesManager = FavoritesManager.shared
    @State private var selectedCategory: Category = .all
    @State private var selectedFilter: HomeScreenView.FilterType = .nearest
    @State private var searchText = ""

    var filteredFavorites: [Product] {
        let categoryFiltered = selectedCategory == .all ? favoritesManager.favorites : favoritesManager.favorites.filter { $0.category == selectedCategory }
        let searchFiltered = categoryFiltered.filter { product in
            searchText.isEmpty || product.name.localizedCaseInsensitiveContains(searchText)
        }
        return sortProducts(products: searchFiltered)
    }

    var body: some View {
        NavigationView {
            VStack {


                // Category selection
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Category.allCases, id: \.self) { category in
                            Button(action: {
                                self.selectedCategory = category
                            }) {
                                Text(category.rawValue)
                                    .padding()
                                    .foregroundColor(selectedCategory == category ? darkBlue : Color.gray)
                            }
                        }
                    }
                }

                // Filter options
                HStack {
                    Spacer()
                    Picker(selection: $selectedFilter, label: Text("Filter").foregroundColor(.gray)) {
                        ForEach(HomeScreenView.FilterType.allCases, id: \.self) { filter in
                            Text(filter.rawValue)
                                .tag(filter)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                }
                .padding(.leading)

                // Product grid view
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(filteredFavorites, id: \.id) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                ProductCard(product: product)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }
            //.navigationTitle("Favorites")
        }
    }

    private func sortProducts(products: [Product]) -> [Product] {
        switch selectedFilter {
        case .nearest:
            return products.sorted { $0.distance < $1.distance }
        case .mostRated:
            return products.sorted { $0.rating > $1.rating }
        case .openNow:
            return products.filter { $0.hours.contains("Open Now") }
        }
    }
}

struct FavoriteProductRow: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.headline)
            Text(product.price)
                .font(.subheadline)
            Text("\(product.distance, specifier: "%.1f") km away")
                .font(.caption)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

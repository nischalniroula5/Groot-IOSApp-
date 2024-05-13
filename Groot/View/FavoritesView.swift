//
//  FavouritesView.swift
//  Groot
//
//  Created by Nischal Niroula on 24/4/2024.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favoritesManager = FavoritesManager.shared

    var body: some View {
        NavigationView {
            List {
                ForEach(favoritesManager.favorites, id: \.id) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        FavoriteProductRow(product: product)
                    }
                }
                .onDelete(perform: deleteFavorites)
            }
            .navigationTitle("Favorites")
        }
    }
    
    private func deleteFavorites(at offsets: IndexSet) {
        favoritesManager.favorites.remove(atOffsets: offsets)
        // Optionally, persist changes to UserDefaults here, or let the FavoritesManager handle it
        FavoritesManager.shared.saveFavorites()
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

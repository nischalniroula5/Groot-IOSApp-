//
//  FavoriteManager.swift
//  Groot
//
//  Created by Nischal Niroula on 13/5/2024.
//
import Combine
import Foundation

class FavoritesManager: ObservableObject {
    static let shared = FavoritesManager()
    
    @Published var favorites: [Product] = []
    private let favoritesKey = "Favorites"
    
    init() {
        loadFavorites()
    }
    
    func addFavorite(product: Product) {
        if !favorites.contains(where: { $0.id == product.id }) {
            favorites.append(product)
            saveFavorites()
        }
    }
    
    func removeFavorite(product: Product) {
        favorites.removeAll { $0.id == product.id }
        saveFavorites()
    }
    
    func isFavorite(product: Product) -> Bool {
        return favorites.contains(where: { $0.id == product.id })
    }
    
    func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let decodedFavorites = try? JSONDecoder().decode([Product].self, from: data) {
            self.favorites = decodedFavorites
        }
    }
    
    func saveFavorites() {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
}

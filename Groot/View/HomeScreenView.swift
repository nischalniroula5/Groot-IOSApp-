//
//  HomeScreenView.swift
//  Groot
//
//  Created by Nischal Niroula on 23/4/2024.
//
import SwiftUI

struct HomeScreenView: View {
    @Binding var showMenu: Bool
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    
    @State private var selectedCultureID: CultureID? = nil
    @State private var showCountryChooser = false
    @State private var searchText = ""
    @State private var selectedCategory: Category = .all
    @State private var selectedCountryFlag = "globeIcon"
    
    var filteredProducts: [Product] {
        let cultureFilteredProducts = selectedCultureID == nil ? allProducts : allProducts.filter { $0.cultureID == selectedCultureID }
        let categoryFilteredProducts = selectedCategory == .all ? cultureFilteredProducts : cultureFilteredProducts.filter { $0.category == selectedCategory }
        let searchFilteredProducts = categoryFilteredProducts.filter { product in
            searchText.isEmpty || product.name.localizedCaseInsensitiveContains(searchText)
        }
        return sortProducts(products: searchFilteredProducts)
    }

    enum FilterType: String, CaseIterable {
        case nearest = "Nearest"
        case mostRated = "Most Rated"
        case openNow = "Open Now"
    }
    
    @State private var selectedMenu: String = "All"
    @State private var selectedFilter: FilterType = .nearest
    
    var body: some View {
        NavigationView {
            VStack {
                CustomSearchBar(searchText: $searchText)
                    .padding(.horizontal,8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Category.allCases, id: \.self) { category in
                            Button(action: {
                                self.selectedCategory = category
                            }) {
                                Text(category.rawValue)
                                    .padding()
                                    .foregroundColor(selectedCategory == category ? .dynamicText : Color.gray)
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Picker(selection: $selectedFilter, label: Text("Filter").foregroundColor(.gray)) {
                        ForEach(FilterType.allCases, id: \.self) { filter in
                            Text(filter.rawValue)
                                .tag(filter)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                }
                .padding(.leading)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(filteredProducts) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                ProductCard(product: product)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationBarItems(
                leading: HamburgerMenuButton(showMenu: $showMenu),
                trailing: CountryChooserButton(showCountryChooser: $showCountryChooser, flagImage: $selectedCountryFlag)
            )
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.dynamicBackground.edgesIgnoringSafeArea(.all))
        }
        .sheet(isPresented: $showCountryChooser) {
            CountryChooserView(
                selectedFlagImage: $selectedCountryFlag,
                isPresented: $showCountryChooser,
                selectedCultureID: $selectedCultureID
            )
        }
    }
}

struct HamburgerMenuButton: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                showMenu.toggle()
            }
        }) {
            Image("hamburgerIcon")
                .imageScale(.large)
        }
    }
}

struct CountryChooserButton: View {
    @Binding var showCountryChooser: Bool
    @Binding var flagImage: String

    var body: some View {
        Button(action: {
            showCountryChooser.toggle()
        }) {
            Image(flagImage)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 20)
                .cornerRadius(3)
        }
    }
}

struct CustomSearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.dynamicBackground)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("What are you looking for...", text: $searchText)
                    .foregroundColor(.dynamicText)
                    .disableAutocorrection(true)
                
                if (!searchText.isEmpty) {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.leading, 12)
        }
        .frame(height: 40)
        .padding(.horizontal, 10)
    }
}

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(product.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: (UIScreen.main.bounds.width / 2) - 24, height: 130)
                .clipped()
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 1)
                )
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.headline)
                    .lineLimit(1)
                    .foregroundColor(.dynamicText)
                Text("\(String(format: "%.2f", product.distance)) Kms away")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(product.hours)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    ForEach(0..<product.rating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.dynamicText)
                            .font(.caption2)
                    }
                    Spacer()
                    Text(product.price)
                        .foregroundColor(.dynamicText)
                }
            }
            .padding([.leading, .bottom, .trailing], 8)
        }
        .background(Color.dynamicBackground)
        .cornerRadius(12)
        .shadow(radius: 2)
        .frame(width: (UIScreen.main.bounds.width / 2) - 24)
    }
}

extension HomeScreenView {
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

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(showMenu: .constant(false))
            .environmentObject(ColorSchemeManager())
    }
}

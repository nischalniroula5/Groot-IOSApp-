//
//  Product.swift
//  Groot
//
//  Created by Nischal Niroula on 1/5/2024.
//

import Foundation

struct Product: Identifiable, Codable {
    let id = UUID()
    let businessID: Int
    let name: String
    let subtitle: String
    let cultureID: CultureID
    //let cultureID: Int
    //let contactDetails: String
    let phoneNumber: String
    let email: String
    //let locationID: String
    let address: String
    let city: String
    let country: String
    let priceRange: String
    let status: String
    let addOn: Date
    // Assuming imageName, distance, hours, rating, price, category, and description were part of your original model, you can include them if they are still relevant.
    let imageName: String
    let distance: Double
    let hours: String
    let rating: Int
    let price: String
    let category: Category
    let description: String
}

enum CultureID: String, Codable, CaseIterable {
    case nepal = "Nepal"
    case india = "India"
    case vietnam = "Vietnam"
    case pakistan = "Pakistan"
    case china = "China"
    case ghana = "Ghana"
    case indonesia = "Indonesia"
    case mexico = "Mexico"
    case thailand = "Thailand"
    case zimbabwe = "Zimbabwe"
    case srilanka = "Sri Lanka"
}


enum Category: String, CaseIterable, Codable {
    case all = "All"
    case restaurants = "Restaurants"
    case grocery = "Grocery"
    case clothing = "Clothing"
    case travel = "Travel"
}

//Sample Data
let allProducts: [Product] = [
    Product(
        businessID: 106,
        name: "Gurkhas Restaurant",
        subtitle: "Traditional Nepali cuisine with a modern twist.",
        cultureID: .nepal,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$",
        status: "Open",
        addOn: Date(),
        imageName: "gurkhas",
        distance: 3.5,
        hours: "11:00 am to 12:00 am",
        rating: 4,
        price: "$",
        category: .restaurants,
        description: "Traditional Nepali cuisine with a modern twist. Enjoy a delightful dining experience in a cozy atmosphere."
        
    ),
    Product(
        businessID: 106,
        name: "Momo Central",
        subtitle: "Specializing in authentic Nepalese dumplings.",
        cultureID: .india,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "momoCentral",
        distance: 4.7,
        hours: "10:00 am to 11:00 pm",
        rating: 5,
        price: "$$",
        category: .restaurants,
        description: "Specializing in authentic Nepalese dumplings, offering a variety of fillings and flavors."
    ),
    Product(
        businessID: 106,
        name: "Nepalese Grocery",
        subtitle: "Your one-stop shop for fresh, organic produce and Nepalese spices.",
        cultureID: .nepal,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$",
        status: "Open",
        addOn: Date(),
        imageName: "nepaleseGrocery",
        distance: 2.0,
        hours: "9:00 am to 9:00 pm",
        rating: 4,
        price: "$",
        category: .grocery,
        description: "Your one-stop shop for fresh, organic produce and Nepalese spices."
    ),
    Product(
        businessID: 106,
        name: "Green Grocers",
        subtitle: "Local market featuring a vast range of green, sustainable produce directly from local farmers.",
        cultureID: .india,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$",
        status: "Open",
        addOn: Date(),
        imageName: "greenGrocers",
        distance: 1.5,
        hours: "8:00 am to 8:00 pm",
        rating: 5,
        price: "$",
        category: .grocery,
        description: "Local market featuring a vast range of green, sustainable produce directly from local farmers."
    ),
    Product(
        businessID: 106,
        name: "Organic Foods",
        subtitle: "Providing a healthy selection of organic foods.",
        cultureID: .nepal,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "organicFoods",
        distance: 3.8,
        hours: "7:30 am to 9:00 pm",
        rating: 4,
        price: "$$",
        category: .grocery,
        description: "Providing a healthy selection of organic foods that support your wellness and taste buds."
    ),
    Product(
        businessID: 106,
        name: "Daily Needs",
        subtitle: "Essential grocery store with a focus on high quality, everyday necessities at affordable prices.",
        cultureID: .vietnam,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$",
        status: "Open",
        addOn: Date(),
        imageName: "dailyNeeds",
        distance: 4.0,
        hours: "8:00 am to 10:00 pm",
        rating: 3,
        price: "$",
        category: .grocery,
        description: "Essential grocery store with a focus on high quality, everyday necessities at affordable prices."
    ),
    Product(
        businessID: 106,
        name: "Nepa Fashion House",
        subtitle: "Chic and contemporary clothing store.",
        cultureID: .nepal,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "nepaFashion",
        distance: 5.1,
        hours: "10:00 am to 9:00 pm",
        rating: 3,
        price: "$$",
        category: .clothing,
        description: "Chic and contemporary clothing store offering the latest in high fashion and street wear."
    ),
    Product(
        businessID: 106,
        name: "Urban Trends",
        subtitle: "Fashion boutique known for its urban and modern apparel.",
        cultureID: .india,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "urbanTrends",
        distance: 3.3,
        hours: "9:00 am to 8:00 pm",
        rating: 5,
        price: "$$",
        category: .clothing,
        description: "Fashion boutique known for its urban and modern apparel inspired by global trends."
    ),
    Product(
        businessID: 106,
        name: "Vintage Wear",
        subtitle: "Exclusive vintage clothing shop.",
        cultureID: .vietnam,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "vintageWear",
        distance: 6.5,
        hours: "11:00 am to 7:00 pm",
        rating: 4,
        price: "$$$",
        category: .clothing,
        description: "Exclusive vintage clothing shop offering unique, hand-picked garments for every occasion."
    ),
    Product(
        businessID: 106,
        name: "My Dream Travels",
        subtitle: "Luxury Bespoke Travel",
        cultureID: .india,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "myDreams",
        distance: 8.0,
        hours: "8:00 am to 10:00 pm",
        rating: 5,
        price: "$$$",
        category: .travel,
        description: "Bespoke travel experiences that bring your dream vacations to life with luxurious and adventurous packages."
    ),
    Product(
        businessID: 106,
        name: "Adventure Awaits",
        subtitle: "Thrilling adventure tours designed for those who seek excitement and challenge.",
        cultureID: .vietnam,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "adventureAwaits",
        distance: 12.0,
        hours: "6:00 am to 10:00 pm",
        rating: 5,
        price: "$$$",
        category: .travel,
        description: "Thrilling adventure tours designed for those who seek excitement and challenge in exotic locations."
    ),
    Product(
        businessID: 106,
        name: "Global Journeys",
        subtitle: "World-class travel agency offering global tours with a focus on cultural immersion and luxury.",
        cultureID: .vietnam,
        phoneNumber: "+61 451 667 910",
        email: "nischalniroula5@gmail.com",
        address: "100 Collins Street, Melbourne, 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "globalJourneys",
        distance: 15.3,
        hours: "24/7",
        rating: 4,
        price: "$$$",
        category: .travel,
        description: "World-class travel agency offering global tours with a focus on cultural immersion and luxury."
    ),
    Product(
        businessID: 101,
        name: "Flower Drum",
        subtitle: "Elegant Cantonese dining in Melbourne's CBD.",
        cultureID: .china,
        phoneNumber: "+61 3 9662 3655",
        email: "info@flowerdrum.melbourne",
        address: "17 Market Lane, Melbourne, VIC 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$$",
        status: "Open",
        addOn: Date(),
        imageName: "flower_drum",
        distance: 0.5,
        hours: "12:00 pm to 3:00 pm, 6:00 pm to 11:00 pm",
        rating: 4,
        price: "$$$$",
        category: .restaurants,
        description: "A pinnacle of Cantonese cuisine in Melbourne, Flower Drum offers an exquisite dining experience with specialties like Peking duck and a luxurious atmosphere."
    ),

    Product(
        businessID: 102,
        name: "Lee Ho Fook",
        subtitle: "Modern Chinese cuisine with a creative twist.",
        cultureID: .china,
        phoneNumber: "+61 3 9077 6261",
        email: "info@leehofook.com.au",
        address: "11 Duckboard Place, Melbourne, VIC 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "lee_ho_fook",
        distance: 0.8,
        hours: "6:00 pm to 11:00 pm",
        rating: 3,
        price: "$$$",
        category: .restaurants,
        description: "Lee Ho Fook brings an innovative approach to Chinese cuisine with dishes like crispy eggplant and grilled Blackmore Wagyu, set in a stylish urban space."
    ),

    Product(
        businessID: 103,
        name: "HuTong Dumpling Bar",
        subtitle: "Authentic Shanghainese dumplings in the heart of Melbourne.",
        cultureID: .china,
        phoneNumber: "+61 3 9650 8128",
        email: "info@hutong.com.au",
        address: "14-16 Market Lane, Melbourne, VIC 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "hutong_dumpling",
        distance: 0.6,
        hours: "11:30 am to 3:00 pm, 5:30 pm to 10:00 pm",
        rating: 5,
        price: "$$",
        category: .restaurants,
        description: "Experience traditional Shanghainese dumplings like xiao long bao and a variety of other Chinese dishes in a vibrant setting."
    ),
    Product(
        businessID: 201,
        name: "Ziyka Pakistani Restaurant",
        subtitle: "Authentic Pakistani cuisine in a vibrant setting.",
        cultureID: .pakistan,
        phoneNumber: "+61 3 9642 1304",
        email: "info@ziyka.com.au",
        address: "Carlton, Melbourne, VIC",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "ziyka",
        distance: 7.2,
        hours: "12:00 pm to 11:00 pm",
        rating: 4,
        price: "$$$",
        category: .restaurants,
        description: "Ziyka offers a menu full of authentic Pakistani dishes such as Makhani Karahi and various kebabs, celebrated for their traditional flavors."
    ),

    Product(
        businessID: 202,
        name: "Khyber Pass Restaurant",
        subtitle: "Fine dining with traditional Pakistani flavors.",
        cultureID: .pakistan,
        phoneNumber: "+61 3 9887 7663",
        email: "contact@khyberpass.com.au",
        address: "Vermont South, Melbourne, VIC",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$$",
        status: "Open",
        addOn: Date(),
        imageName: "khyberpass",
        distance: 12.5,
        hours: "5:00 pm to 10:00 pm",
        rating: 5,
        price: "$$$",
        category: .restaurants,
        description: "Khyber Pass stands out for its classy ambiance and excellent service, offering a menu that includes specialties like Biryani and Nihari."
    ),
    // Ghana
    Product(
        businessID: 301,
        name: "Amas Delight",
        subtitle: "Authentic West African soul food in Melbourne.",
        cultureID: .ghana,
        phoneNumber: "+61 428 078 768",
        email: "amasdelight@contact.com",
        address: "Specific address not listed, Melbourne, VIC",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "amas_delight",
        distance: 6.5,
        hours: "4:00 pm to 9:00 pm, Wed-Sun",
        rating: 5,
        price: "$$",
        category: .restaurants,
        description: "Offering a genuine taste of West African cuisine, Amas Delight serves everything from jollof rice to rich, spicy stews."
    ),

    // Indonesia
    Product(
        businessID: 302,
        name: "Bunga Raya",
        subtitle: "Traditional Indonesian flavors in the heart of Melbourne.",
        cultureID: .indonesia,
        phoneNumber: "+61 3 9876 2345",
        email: "info@bungaraya.com",
        address: "321 Spencer Street, Melbourne, VIC 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "bunga_raya",
        distance: 3.2,
        hours: "10:00 am to 10:00 pm",
        rating: 4,
        price: "$$",
        category: .restaurants,
        description: "Bunga Raya brings to Melbourne the aromatic spices of Indonesia, offering dishes like Nasi Goreng and Satay."
    ),

    // Thailand
    Product(
        businessID: 303,
        name: "Chiang Mai Thai",
        subtitle: "Authentic Thai cuisine in a vibrant setting.",
        cultureID: .thailand,
        phoneNumber: "+61 3 9445 2882",
        email: "contact@chiangmaithai.com",
        address: "202 Lygon Street, Carlton, VIC 3053",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "chiang_mai_thai",
        distance: 2.5,
        hours: "11:00 am to 11:00 pm",
        rating: 4,
        price: "$$",
        category: .restaurants,
        description: "Chiang Mai Thai serves a wide range of traditional Thai dishes, from Pad Thai to Tom Yum Goong, in a lively atmosphere."
    ),

    // Zimbabwe
    Product(
        businessID: 304,
        name: "Harare Kitchen",
        subtitle: "Experience the taste of Zimbabwe in Melbourne.",
        cultureID: .zimbabwe,
        phoneNumber: "+61 3 9078 3456",
        email: "info@hararekitchen.com",
        address: "150 Queens Street, Melbourne, VIC 3000",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "harare_kitchen",
        distance: 4.3,
        hours: "12:00 pm to 10:00 pm",
        rating: 5,
        price: "$$",
        category: .restaurants,
        description: "Harare Kitchen specializes in Zimbabwean cuisine, offering dishes like Sadza, Beef Stew, and Spinach with Peanut Butter."
    ),

    // Sri Lanka
    Product(
        businessID: 305,
        name: "Colombo Street",
        subtitle: "Sri Lankan street food with a modern twist.",
        cultureID: .srilanka,
        phoneNumber: "+61 3 9988 7766",
        email: "reservations@colombostreet.com",
        address: "78 Chapel Street, Windsor, VIC 3181",
        city: "Melbourne",
        country: "Australia",
        priceRange: "$$",
        status: "Open",
        addOn: Date(),
        imageName: "colombo_street",
        distance: 5.1,
        hours: "10:00 am to 12:00 am",
        rating: 5,
        price: "$$",
        category: .restaurants,
        description: "Colombo Street offers a creative take on Sri Lankan cuisine, featuring dishes like Kottu Roti and Hoppers in a contemporary ambiance."
    )


]



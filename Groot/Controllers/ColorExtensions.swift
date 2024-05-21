//
//  ColorExtensions.swift
//  Groot
//
//  Created by Nischal Niroula on 21/5/2024.
//

import SwiftUI

extension Color {
    
    static let darkViewBg = Color(red: 12 / 255.0, green: 23 / 255.0, blue: 28 / 255.0)
    static let darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    
    static let dynamicBackground = Color(UIColor { traitCollection in
        return traitCollection.userInterfaceStyle == .dark ? UIColor(Color.darkViewBg) : .white
    })
    
    static let dynamicText = Color(UIColor { traitCollection in
        return traitCollection.userInterfaceStyle == .dark ? .white : UIColor(Color.darkBlue)
    })
}

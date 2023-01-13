//
//  Color.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-13.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
    let primaryTextColor  = Color("PrimaryTextColor")
}

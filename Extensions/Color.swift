//
//  Color.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 18.06.2022.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launch = LaunchScreenColor()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}

struct LaunchScreenColor {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}

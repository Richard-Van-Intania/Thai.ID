import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r: UInt64
        let g: UInt64
        let b: UInt64
        switch hex.count {
        case 6:  // RGB (24-bit)
            (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1,
        )
    }
}

let white = Color(.white)
let black = Color(.black)
let green = Color(.green)

let left_gradient = Color(hex: "#094483")
let right_gradient = Color(hex: "#0664C3")

let primary_gradient = LinearGradient(
    gradient: Gradient(colors: [left_gradient, right_gradient]),
    startPoint: .leading,
    endPoint: .trailing,
)

let primary_black = Color(hex: "#23272E")
let primary_darkblue = Color(hex: "#094483")

let neutral01 = Color(hex: "#F6F7F9")
let neutral04 = Color(hex: "#B2BAC7")
let neutral05 = Color(hex: "#8895A8")
let neutral06 = Color(hex: "#69778E")
let neutral07 = Color(hex: "#546075")

let blue02 = Color(hex: "#E5EBF4")
let blue05 = Color(hex: "#8EACD0")

let light_blue09 = Color(hex: "#092548")

let secondary_bluegray = Color(hex: "#B2BAC7")

let primary_red = Color(hex: "#B3001B")
let secondary_gray = Color(hex: "#D6DAE1")

// #8895A8 blue05 #8EACD0 #E5EBF4 #092548 light_blue09

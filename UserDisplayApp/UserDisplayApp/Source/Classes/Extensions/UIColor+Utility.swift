//
//  UIColor+Utility.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 20/07/23.
//

import UIKit

extension UIColor {

    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64() // UInt32()
        Scanner(string: hex).scanHexInt64(&int)
        let aRGB: UInt64 // UInt32
        let rRGB: UInt64
        let gRGB: UInt64
        let bRGB: UInt64

        switch hex.count {
        case 3: // RGB (12-bit)
            (aRGB, rRGB, gRGB, bRGB) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (aRGB, rRGB, gRGB, bRGB) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (aRGB, rRGB, gRGB, bRGB) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (aRGB, rRGB, gRGB, bRGB) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(rRGB) / 255, green: CGFloat(gRGB) / 255, blue: CGFloat(bRGB) / 255, alpha: CGFloat(aRGB) / 255)
    }
}



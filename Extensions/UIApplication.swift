//
//  UIApplication.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 19.06.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

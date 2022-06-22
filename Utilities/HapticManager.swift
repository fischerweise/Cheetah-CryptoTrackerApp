//
//  HapticManager.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 22.06.2022.
//

import Foundation
import UIKit

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}

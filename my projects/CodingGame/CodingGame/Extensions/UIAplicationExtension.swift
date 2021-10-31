//
//  UIAplicationExtension.swift
//  UIAplicationExtension
//
//  Created by vojta on 18.09.2021.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        NotificationCenter.default.post(name: .textViewText, object: nil)
    }
}

//
//  UITableViewCell+identefier.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var identefier: String {
        get {
            return String.init(describing: self)
        }
    }
}


//
//  UITableView+cellManagment.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import Foundation
import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.identefier)
    }
    
    func dequeue<T: UITableViewCell>(_ cellType: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cellType.identefier) as? T
    }
    
    func dequeue<T: UITableViewCell>(_ cellType: T.Type, at indexpath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.identefier, for: indexpath) as? T else {
            fatalError()
        }
        return cell
    }
}

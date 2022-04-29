//
//  Ex+UITableView.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/04/30.
//

import UIKit

extension UITableView {

    func dequeue<T: UITableViewCell>(type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: String(describing: type.self), for: indexPath) as? T
    }

    func dequeue<T: UITableViewCell>(type: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: String(describing: type.self)) as? T
    }

    func dequeue(identifier: String) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: identifier)
    }
}

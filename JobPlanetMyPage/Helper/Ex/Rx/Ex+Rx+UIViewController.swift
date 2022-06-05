//
//  Ex+Rx+UIViewController.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/06/03.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import RxSwift

public extension RxSwift.Reactive where Base: UIViewController {
    var viewWillAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillAppear))
            .map { $0.first as? Bool ?? false }
    }

    var viewDidAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewDidAppear(_:)))
            .map { $0.first as? Bool ?? false }
    }

    var viewWillDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillDisappear(_:)))
            .map { $0.first as? Bool ?? false }
    }
}

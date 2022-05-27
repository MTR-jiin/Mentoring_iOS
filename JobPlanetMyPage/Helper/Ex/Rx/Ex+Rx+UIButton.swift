//
//  Ex+Rx+UIButton.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/05/27.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base: UIButton {
    var throttleTap: Observable<ControlEvent<Void>.Element> {
        return controlEvent(.touchUpInside).throttle(.seconds(1), scheduler: MainScheduler.instance)
    }
}

extension Reactive where Base: UIControl {
    var throttleTap: Observable<ControlEvent<Void>.Element> {
        return controlEvent(.touchUpInside).throttle(.seconds(1), scheduler: MainScheduler.instance)
    }
}

extension Reactive where Base: UIBarButtonItem {
    var throttleTap: Observable<ControlEvent<Void>.Element> {
        return tap.throttle(.seconds(1), scheduler: MainScheduler.instance)
    }
}


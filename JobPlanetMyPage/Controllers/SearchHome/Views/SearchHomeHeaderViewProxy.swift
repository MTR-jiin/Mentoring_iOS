//
//  SearchHomeHeaderViewProxy.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/06/03.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class RxSearchHomeHeaderViewDelegateProxy: DelegateProxy<SearchHomeHeaderView, SearchHomeHeaderViewDelegate> {
    
    let (tapDropDownSubject, tapDropDown): (PublishSubject<Bool>, ControlEvent<Bool>) = {
        let subject = PublishSubject<Bool>()
        return (subject, ControlEvent<Bool>(events: subject.asObserver()))
    }()
    
    init(searchHomeHeaderView: SearchHomeHeaderView) {
        super.init(parentObject: searchHomeHeaderView, delegateProxy: RxSearchHomeHeaderViewDelegateProxy.self)
    }
    
    static func registerKnownImplementations() {
        self.register { RxSearchHomeHeaderViewDelegateProxy(searchHomeHeaderView: $0) }
    }
    
    static func currentDelegate(for object: SearchHomeHeaderView) -> SearchHomeHeaderViewDelegate? {
        return object.delegate
    }
    
    static func setCurrentDelegate(_ delegate: SearchHomeHeaderViewDelegate?, to object: SearchHomeHeaderView) {
        object.delegate = delegate
    }
}

extension RxSearchHomeHeaderViewDelegateProxy: DelegateProxyType { }

extension RxSearchHomeHeaderViewDelegateProxy: SearchHomeHeaderViewDelegate {
    func tapDropDown(state: Bool) {
        tapDropDownSubject.onNext(state)
    }
}

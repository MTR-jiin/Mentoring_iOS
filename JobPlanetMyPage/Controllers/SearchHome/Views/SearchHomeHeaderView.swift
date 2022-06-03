//
//  SearchHomeHeaderView.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/05/27.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol SearchHomeHeaderDatable {
    var ranking: Int { get }
    var companyID: Int { get }
    var fluctuation: Int { get }
    var companyName: String { get }
}

protocol SearchHomeHeaderViewDelegate: AnyObject {
    func tapDropDown(state: Bool)
}

final class SearchHomeHeaderView: DesignView {
    @IBOutlet private weak var searchButton: UIControl!
    @IBOutlet private weak var searchTermsButton: UIControl!
    @IBOutlet public weak var dropDownButton: UIControl!
    @IBOutlet private weak var dropDownImageView: UIImageView!
    @IBOutlet private weak var rankingLabel: UILabel!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var fluctuationLabel: UILabel!
    @IBOutlet private weak var fluctuationImageView: UIImageView!
    @IBOutlet private weak var fluctuationView: UIView!
    @IBOutlet private weak var NEWLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    fileprivate let items: PublishSubject<[SearchHomeHeaderDatable]> = .init()
    public weak var delegate: SearchHomeHeaderViewDelegate?
    
    public var isFold: Bool = true {
        didSet {
            let image = isFold ? "imgChevronDown" : "imgChevronUp"
            dropDownImageView.image = UIImage(named: image)
            searchTermsButton.isHidden = isFold
            fluctuationView.isHidden = isFold
            tableView.isHidden = isFold
        }
    }
    private let disposeBag: DisposeBag = .init()
    
    override func loaded() {
        super.loaded()
        tableView.register(type: SearchHomeHeaderRankCell.self)
        tableView.contentInset = .init(top: 8, left: 0, bottom: 8, right: 0)
        isFold = true
        
        items.bind(to: tableView.rx.items(cellIdentifier: "SearchHomeHeaderRankCell", cellType: SearchHomeHeaderRankCell.self)) { row, item, cell in
            cell.bind(item: item)
        }
        .disposed(by: disposeBag)
    }
}

extension Reactive where Base: SearchHomeHeaderView {
    var items: Binder<[SearchHomeHeaderDatable]> {
        return Binder(self.base) { (_, items) in
            self.base.items.onNext(items)
        }
    }
    
    private var delegate: RxSearchHomeHeaderViewDelegateProxy {
        return RxSearchHomeHeaderViewDelegateProxy.proxy(for: self.base)
    }
    
    var tapDropDown: ControlEvent<Bool> {
        return delegate.tapDropDown
    }
}


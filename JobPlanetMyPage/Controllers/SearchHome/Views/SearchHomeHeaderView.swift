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

final class SearchHomeHeaderView: DesignView {
    @IBOutlet private weak var searchButton: UIControl!
    @IBOutlet private weak var searchTermsButton: UIControl!
    @IBOutlet private weak var dropDownButton: UIControl!
    @IBOutlet private weak var dropDownImageView: UIImageView!
    @IBOutlet private weak var rankingLabel: UILabel!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var fluctuationLabel: UILabel!
    @IBOutlet private weak var fluctuationImageView: UIImageView!
    @IBOutlet private weak var fluctuationView: UIView!
    @IBOutlet private weak var NEWLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    private let disposeBag: DisposeBag = .init()
    
    override func loaded() {
        super.loaded()
        tableView.register(type: SearchHomeHeaderRankCell.self)
        tableView.contentInset = .init(top: 8, left: 0, bottom: 8, right: 0)
        
        Observable.just(Array(0...9))
            .bind(to: tableView.rx.items(cellIdentifier: "SearchHomeHeaderRankCell", cellType: SearchHomeHeaderRankCell.self)) { row, item, cell in
                cell.bind()
            }
            .disposed(by: disposeBag)
    }
}

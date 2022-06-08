//
//  SearchHomeViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/03.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchHomeViewController: UIViewController {
    
    @IBOutlet weak var headerView: SearchHomeHeaderView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    private let viewModel: SearchHomeViewModel = .init()
    private let disposeBag: DisposeBag = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind() //dataSource
        headerView.delegate = self //delegate
    }
    
    private func bind() {
        viewModel.rankModelData
            .bind(to: headerView.tableView.rx.items(cellType: SearchHomeHeaderRankCell.self)){ idx, item, cell in
                cell.bind(to: item)
            }
            .disposed(by: disposeBag)
    }
    
}

extension SearchHomeViewController: SearchHomeHeaderDelegate {
    func tappedCompanyRanking() {
        let fold = !self.headerView.isFold
        let height = !fold ? Self.Layout.headerClose : Self.Layout.headerOpen
        self.headerViewHeight.constant = height
        UIView.animate(withDuration: 0.3, animations: {
            self.headerView.isFold = fold
            self.view.layoutIfNeeded()
        })
    }
}

extension SearchHomeViewController {
    struct Layout {
        static let headerOpen: CGFloat = 343.0
        static let headerClose: CGFloat = 84.0
    }
}

extension Reactive where Base: UITableView {
    public func items<Sequence: Swift.Sequence, Cell: UITableViewCell, Source: ObservableType>
    (cellType: Cell.Type = Cell.self)
    -> (_ source: Source)
    -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
    -> Disposable
    where Source.Element == Sequence {
        return self.items(cellIdentifier: String(describing: Cell.self), cellType: Cell.self)
    }
}

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
import InfiniteLayout

class SearchHomeViewController: UIViewController {
    
    @IBOutlet private weak var headerView: SearchHomeHeaderView!
    @IBOutlet private weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    
    private let rankViewModel: SearchHomeRankViewModel = .init()
    private let viewModel = HeadLineViewModel()
    private let disposeBag: DisposeBag = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.delegate = self //delegate
        rankDataBinding()
        settingTableView()
    }
    private func rankDataBinding() {
        rankViewModel.rankModelData
            .bind(to: headerView.tableView.rx.items(cellType: SearchHomeHeaderRankCell.self)){ idx, item, cell in
                cell.bind(to: item)
            }
            .disposed(by: disposeBag)
    }

    
    private func settingTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "HeadLineViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HeadLineViewCell")
    }
    
}
//MARK: -  Rank
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

//MARK: - HeadLine

extension SearchHomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeue(type: HeadLineViewCell.self, for: indexPath) else {
                return .init()
            }
            //infinity Cell Binding
            viewModel.headModelData
                .bind(to: cell.collectionView.rx.items(infinite: true)) {
                    collectionView, row, element in
                    let indexPath = IndexPath(row: row, section: 0)
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfinityCollectionViewCell", for: indexPath) as? InfinityCollectionViewCell else { return UICollectionViewCell() }
                    cell.configure(element)
                    return cell
                }.disposed(by: disposeBag)
            //HeadLine Binding
            // 🚨 여기서 current 값이 없음 ..
            cell.collectionView.rx.modelSelected(HeadLineModel.self)
                .asDriver()
                 .drive(onNext: { current in
                     print(current)
                     cell.configureHeadData(current)
                 }).disposed(by: disposeBag)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "dsds"
            return cell
        }
    }

}

extension SearchHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        return 40
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

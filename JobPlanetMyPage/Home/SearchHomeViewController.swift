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
import RxDataSources

struct Section {
    var items: [Item]
}

enum Item {
    case headerCell
    case defaultCell
}

extension Section: SectionModelType {
    
    init(original: Section, items: [Item] = []) {
        self = original
        self.items = items
    }
}

class SearchHomeViewController: UIViewController {
    
    @IBOutlet private weak var headerView: SearchHomeHeaderView!
    @IBOutlet private weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    
    private let rankViewModel: SearchHomeRankViewModel = .init()
    private let viewModel: HeadLineViewModel = .init()
    private let disposeBag: DisposeBag = .init()
    //RxTableView
    private let data = BehaviorRelay<[Section]>(value: [])
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<Section> { [weak self] dataSource, tableview, indexPath, item in
            switch item {
            case .headerCell:
                guard let cell = tableview.dequeueReusableCell(withIdentifier: "HeadLineViewCell", for: indexPath) as? HeadLineViewCell else { return UITableViewCell() }
                //🚨저장 프로퍼티에서 저장프로퍼티 접근하는게 이상한데,, 방법을 모르겠네요 ㅜㅜ
                //1
//                viewModel.headModelData
//                        .bind(to: cell.collectionView.rx.items(infinite: true)) {
//                            collectionView, row, element in
//                            let indexPath = IndexPath(row: row, section: 0)
//                            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfinityCollectionViewCell", for: indexPath) as? InfinityCollectionViewCell else { return UICollectionViewCell() }
//                            cell.configure(element)
//                            return cell
//                        }.disposed(by: disposeBag)
                
                //2
//                cell.collectionView.rx.modelSelected(HeadLineModel.self)
//                    .asDriver()
//                     .drive(onNext: { current in
//                         print(current)
//                         cell.configureHeadData(current)
//                     }).disposed(by: disposeBag)
                return cell
            case .defaultCell:
                let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                return cell
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
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
        let nib = UINib(nibName: "HeadLineViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HeadLineViewCell")
        
        let item = Item.headerCell
        let item2 = Item.defaultCell
        let section = Section(items: [item, item2, item2])
        data.bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        data.accept([section])
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

extension SearchHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 250 }
        else { return 40 }
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

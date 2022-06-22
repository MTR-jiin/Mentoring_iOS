//
//  MainHomeTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/16.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxInfiniteLayout

protocol HeadLineCellDatable {
    var titleRow1: String { get }
    var titleRow2: String { get }
    var backgroundColor: String { get }
    var thumbnail: String { get }
}

class HeadLineViewCell: UITableViewCell {

    @IBOutlet private weak var titleRow1: UILabel!
    @IBOutlet private weak var titleRow2: UILabel!
    @IBOutlet private weak var cellView: UIView!
    @IBOutlet weak var collectionView: RxInfiniteCollectionView!
    
    private let viewModel = HeadLineViewModel()
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
        headLineDataBinding()
    }
    
    private func registerNib() {
        let nib = UINib(nibName: "InfinityCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "InfinityCollectionViewCell")
    }
    
    func configureData(to viewModel: HeadLineCellDatable) {
        titleRow1.text = viewModel.titleRow1
        titleRow2.text = viewModel.titleRow2
        cellView.backgroundColor = UIColor(hexString: viewModel.backgroundColor)
    }
    
    private func headLineDataBinding() {
        viewModel.headLineData
            .bind(to: collectionView.rx.items(infinite: true)) {
                collectionView, row, element in
                let indexPath = IndexPath(row: row, section: 0)
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfinityCollectionViewCell", for: indexPath) as? InfinityCollectionViewCell else { return UICollectionViewCell() }
                cell.bind(data: element, row: row + 1)
                return cell
            }.disposed(by: disposeBag)
        
        collectionView.rx.modelCentered(HeadLineCellDatable.self)
            .asDriver()
            .drive(onNext: { current in
                self.configureData(to: current)
            }).disposed(by: disposeBag)
    }
    
}



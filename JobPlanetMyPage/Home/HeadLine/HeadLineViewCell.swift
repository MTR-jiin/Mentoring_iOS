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

class HeadLineViewCell: UITableViewCell {

    @IBOutlet weak var titleRow1: UILabel!
    @IBOutlet weak var titleRow2: UILabel!
    
    @IBOutlet weak var collectionView: RxInfiniteCollectionView!
    
    private let viewModel = HeadLineViewModel()
    private let disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
        headLineDataBinding()
//        collectionView.delegate = self
//        collectionView.dataSource = self
    }
    
    private func registerNib() {
        let nib = UINib(nibName: "InfinityCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "InfinityCollectionViewCell")
    }
    
    private func headLineDataBinding() {
        viewModel.headLineData
            .bind(to: collectionView.rx.items(infinite: true)) { collectionView, row, element in
                let indexPath = IndexPath(row: row, section: 0)
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfinityCollectionViewCell", for: indexPath) as? InfinityCollectionViewCell else { return UICollectionViewCell() }
                cell.bind(to: element)
                return cell
            }.disposed(by: disposeBag)
        
    
    }
    
//cellIdentifier: "InfinityCollectionViewCell", cellType: InfinityCollectionViewCell.self)) { idx, item, cell in
//    cell.bind(to: item)
//
//
}

//extension HeadLineViewCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfinityCollectionViewCell", for: indexPath) as? InfinityCollectionViewCell else { return UICollectionViewCell() }
//        cell.bind(to: viewModel.headLineData as! SearchHomeHeaderHeadLineDatable)
//        return cell
//    }
//
//}
//
//extension HeadLineViewCell: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
//    }
//}
//

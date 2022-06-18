//
//  MainHomeTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/16.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import InfiniteLayout

class HeadLineViewCell: UITableViewCell {

    @IBOutlet weak var titleRow1: UILabel!
    @IBOutlet weak var titleRow2: UILabel!
    @IBOutlet weak var collectionView: InfiniteCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerNib() {
        let nib = UINib(nibName: "InfinityCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "InfinityCollectionViewCell")
    }
   
    
}

extension HeadLineViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfinityCollectionViewCell", for: indexPath) as? InfinityCollectionViewCell else { return UICollectionViewCell() }
//        cell.update(index: self.collectionView!.indexPath(from: indexPath).row)
        cell.backgroundColor = .blue
//        cell.titleLabel.text = "\(indexPath.row)"
//        cell.update(idx: self.collectionView.indexPath(from: indexPath).row)
        return cell
    }
    
}

extension HeadLineViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
}



extension HeadLineViewCell {
    // 콤포지셔널 레이아웃 설정
    fileprivate func createLayout() -> UICollectionViewLayout {
        // 레이아웃 생성 - 섹션 > 아이템 > 그룹 이렇게 포함됨
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex: Int, layoutEnvironMent: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            //아이템 사이즈
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.5), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            //아이템 간 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

            //그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            // 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            //섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
            section.orthogonalScrollingBehavior = .continuous

            return section
        }
        return layout
    }

}

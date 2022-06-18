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
        cell.titleLabel.text = "\(indexPath.row)"
//        cell.update(idx: self.collectionView.indexPath(from: indexPath).row)
        return cell
    }
    
}

extension HeadLineViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
}


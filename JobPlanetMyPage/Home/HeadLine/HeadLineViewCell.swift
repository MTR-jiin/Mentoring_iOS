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

    @IBOutlet private weak var titleRow1: UILabel!
    @IBOutlet private weak var titleRow2: UILabel!
    @IBOutlet private weak var cellView: UIView!
    @IBOutlet weak var collectionView: RxInfiniteCollectionView!
    
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
    }
    
    private func registerNib() {
        let nib = UINib(nibName: "InfinityCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "InfinityCollectionViewCell")
    }
    
    func configureHeadData(_ data: HeadLineModel) {
        titleRow1.text = data.titleRow1
        titleRow2.text = data.titleRow2
        cellView.backgroundColor = data.backgroundColor
    }

}



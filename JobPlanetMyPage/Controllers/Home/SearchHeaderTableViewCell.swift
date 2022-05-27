//
//  SearchHeaderTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/23.
//

import UIKit

class SearchHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var flodingArrowBtn: UIButton!
    
    var foldingState: Bool? {
        didSet {
            guard let isOpen = foldingState else { return }
            flodingArrowBtn.imageView?.image = isOpen ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
        }
    }

}

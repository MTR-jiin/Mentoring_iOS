//
//  SearchCompanyTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/23.
//

import UIKit

class SearchCompanyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var rankStatusLabel: UILabel!
    
    public var data: SearchCompany.Item? {
        didSet {
            guard let data = data else { return }
            rankLabel.text = String(data.ranking)
            companyNameLabel.text = data.company_name
        }
    }

}

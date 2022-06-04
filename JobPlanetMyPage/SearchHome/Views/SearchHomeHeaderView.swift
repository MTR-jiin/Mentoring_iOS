//
//  SearchHomeHeaderView.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/03.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit

class SearchHomeHeaderView: DesignView {

    @IBOutlet weak var searchBar: UIControl!
    @IBOutlet weak var companyListDropDown: UIControl!
    @IBOutlet weak var dropImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    public var isFold: Bool = true {
        didSet {
            let image = isFold ? "chevron.down" : "chevron.up"
            dropImage.image = UIImage(systemName: image)
            tableView.isHidden = true
        }
    }
    
    override func loaded() {
        super.loaded()
        tableView.dataSource = self
    }

}

//extension SearchHomeHeaderView: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        return cell
//    }
//    
//    
//}

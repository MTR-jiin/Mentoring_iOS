//
//  HomeViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/23.
//

import UIKit

struct SearchCompany {
    let header: String
    var items: [Item]
    var isOpen = false

    struct Item {
        let ranking: Int
        let company_id: Int
        let company_name: String
    }
}

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    private var dummy: SearchCompany = SearchCompany(header: "실시간 어쩌고", items: [
                                    SearchCompany.Item(ranking: 1, company_id: 2123, company_name: "카카오"),
                                    SearchCompany.Item(ranking: 2, company_id: 3232, company_name: "네이버"),
                                    SearchCompany.Item(ranking: 3, company_id: 21544523, company_name: "토스")])
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

}

//
//  HomeViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        customSearchBar()
        // Do any additional setup after loading the view.
    }
    
    private func customSearchBar() {
        let searchBar = UISearchBar()
        searchBar.placeholder = "기업, 채용공고 검색"
        searchBar.setImage(UIImage(named: "logo"), for: UISearchBar.Icon.search, state: .normal)
        searchBar.searchTextField.backgroundColor = UIColor.clear
        self.navigationItem.titleView = searchBar
    }

}

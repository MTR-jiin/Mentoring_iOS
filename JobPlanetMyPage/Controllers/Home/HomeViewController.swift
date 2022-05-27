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
    private let repo = SearchHomeMockRepository()
    
    private var dummy: SearchCompany = SearchCompany(header: "실시간 어쩌고", items: [
                                    SearchCompany.Item(ranking: 1, company_id: 2123, company_name: "카카오"),
                                    SearchCompany.Item(ranking: 2, company_id: 3232, company_name: "네이버"),
                                    SearchCompany.Item(ranking: 3, company_id: 21544523, company_name: "토스")])
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSearchBar()
        tableView.dataSource = self
        tableView.delegate = self
        repo.getHeadLine { result in
            switch result {
            case .success(let data):
                print("data", data)
            default: break
            }
        }
        
        repo.getRanking { result in
            switch result {
            case .success(let data):
                print("data", data)
            default: break
            }
        }
    }
    
    private func makeSearchBar() {
        let searchBar = UISearchBar()
        searchBar.placeholder = "기업, 채용공고 검색"
        searchBar.setImage(UIImage(named: "logo"), for: UISearchBar.Icon.search, state: .normal)
        searchBar.searchTextField.backgroundColor = UIColor.clear
        self.navigationItem.titleView = searchBar
    }

    

}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dummy.isOpen { //섹션이 열려 있으면
            return dummy.items.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeue(type: SearchHeaderTableViewCell.self, for: indexPath) else {
                return .init()
            }
            cell.foldingState = dummy.isOpen
            return cell
        } else {
            guard let cell = tableView.dequeue(type: SearchCompanyTableViewCell.self, for: indexPath) else {
                return .init()
            }
            cell.data = dummy.items[indexPath.row-1]
            return cell
        }
    }
}



extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dummy.isOpen = !dummy.isOpen
        print(dummy.isOpen)
        tableView.reloadSections([indexPath.section], with: UITableView.RowAnimation.automatic)
        
    }
}

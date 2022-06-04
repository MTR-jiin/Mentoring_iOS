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
    
    private let repository = SearchHomeRepostiory()
    private var viewModel = [SearchHome.Ranking.Item]()
    
    public var isFold: Bool = true {
        didSet {
            let image = isFold ? "chevron.down" : "chevron.up"
            dropImage.image = UIImage(systemName: image)
            tableView.isHidden = true
        }
    }
    
    private func fetchData() {
        repository.getRanking { result in
            switch result {
            case .success(let data):
                self.viewModel = data.data.items
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "SearchHomeHeaderRankCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "SearchHomeHeaderRankCell")
    }
    
    override func loaded() {
        super.loaded()
        fetchData()
        registerXib()
        tableView.dataSource = self
    }
}

extension SearchHomeHeaderView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(type: SearchHomeHeaderRankCell.self, for: indexPath) else { return UITableViewCell() }
        cell.data = viewModel[indexPath.row]
        return cell
    }

}

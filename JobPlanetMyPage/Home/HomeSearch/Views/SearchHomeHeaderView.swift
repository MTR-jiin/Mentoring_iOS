//
//  SearchHomeHeaderView.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/03.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit

protocol SearchHomeHeaderDelegate: AnyObject {
    func tappedCompanyRanking(_ sender: UIControl)
}

class SearchHomeHeaderView: DesignView {

    @IBOutlet private weak var searchBar: UIControl!
    @IBOutlet private weak var companyListDropDown: UIControl!
    @IBOutlet private weak var dropImage: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var underLineView: UIView!
    
    private let repository = SearchHomeRepostiory()
//    private var viewModel = [SearchHome.Ranking.Item]()
    private var delegate: SearchHomeHeaderDelegate?

    
    public var isFold: Bool = false {
        didSet {
            let image = isFold ? "chevron.down" : "chevron.up"
            dropImage.image = UIImage(systemName: image)
            tableView.isHidden = !isFold
            underLineView.isHidden = !isFold
        }
    }
    
//    private func fetchData() {
//        repository.getRanking { result in
//            switch result {
//            case .success(let data):
//                self.viewModel = data.data.items
//            case .failure(let error):
//                debugPrint(error)
//            }
//        }
//    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "SearchHomeHeaderRankCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "SearchHomeHeaderRankCell")
    }
    
    
    override func loaded() {
        super.loaded()
        registerXib()
        tableView.dataSource = self
        delegate?.tappedCompanyRanking(companyListDropDown)
    }
}

extension SearchHomeHeaderView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(type: SearchHomeHeaderRankCell.self, for: indexPath) else { return UITableViewCell() }
        cell.bind(to: <#T##headerRank#>)
        return cell
    }

}

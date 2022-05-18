//
//  JobGroupViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/14.
//

import UIKit

class JobGroupViewController: UIViewController {
    
    struct cellData {
        let title: String
        let rating: Float
        init(title: String, rating: Float) {
            self.title = title
            self.rating = rating
        }
    }
    
    private var dataList: [cellData] = [
        .init(title: "연구 개발", rating: 4.8),
        .init(title: "생산/제조", rating: 3.9),
        .init(title: "영업/제휴", rating: 3.5),
        .init(title: "엔지니어링", rating: 1.9),
        .init(title: "서비스/고객지원", rating: 1.0),
        .init(title: "전문직", rating: 1.0),
        .init(title: "경영/기획/컨설팅", rating: 4.2),
        .init(title: "어쩌고", rating: 1.0)
    ]

    @IBOutlet private weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        sortedtableList()
    }
    
    private func sortedtableList() {
        dataList.sort { return $0.rating > $1.rating } //비율로 정렬
    }
}

extension JobGroupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JobGroupTableViewCell", for: indexPath) as? JobGroupTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = dataList[indexPath.row].title
        cell.percentLabel.text = "\(dataList[indexPath.row].rating)"
        return cell
    }
}

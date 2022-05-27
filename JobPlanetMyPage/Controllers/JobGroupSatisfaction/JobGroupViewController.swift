//
//  JobGroupViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/14.
//

import UIKit

/**
 앱 개발
 수락 -> API -> 서버 -> db update -> back -> API -> [수락 리스트]
 Rx -> behavior -> 방출 하도록. 값을 변경한다.
 1. black -> 몇번째 수정했다.
 2. delegate -> func -> 수정한 값을 전달하는 거죠.
 3. notification -> post -> 수정된 값을 전달하면서 ,
 */

struct CellData {
    let title: String
    let rating: Float
    init(title: String, rating: Float) {
        self.title = title
        self.rating = rating
    }
}

final class JobGroupViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var dataList: [CellData] = [
        .init(title: "연구 개발", rating: 4.8),
        .init(title: "생산/제조", rating: 3.9),
        .init(title: "영업/제휴", rating: 3.5),
        .init(title: "엔지니어링", rating: 1.9),
        .init(title: "서비스/고객지원", rating: 1.0),
        .init(title: "전문직", rating: 1.0),
        .init(title: "경영/기획/컨설팅", rating: 4.2),
        .init(title: "어쩌고", rating: 1.0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        sortedtableList()
    }
    
    private func sortedtableList() {
        dataList.sort { return $0.rating > $1.rating } //비율로 정렬
    }
    
    @IBAction private func tappedBackBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension JobGroupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(type: JobGroupTableViewCell.self) else { return .init() }
        cell.data = dataList[indexPath.row]
        return cell
    }
}

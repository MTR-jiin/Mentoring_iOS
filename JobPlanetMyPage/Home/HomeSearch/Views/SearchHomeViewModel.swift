//
//  SearchHomeRankViewModel.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/05.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation
import RxRelay

class SearchHomeViewModel {
    let repository = SearchHomeRepostiory()
    var rankModelData = BehaviorRelay(value: [SearchHomeHeaderDatable]())
    
    init() {
        loadData()
    }
    
    func loadData() {
        repository.getRanking { result in
            switch result {
            case .success(let data):
                self.rankModelData.accept(data.data.items)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}

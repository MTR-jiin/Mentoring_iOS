//
//  HeadLineViewModel.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/18.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import RxRelay
 
class HeadLineViewModel {
    let repository = SearchHomeRepostiory()

    var headLineData = BehaviorRelay(value: [SearchHomeHeaderHeadLineDatable]())
    
    init() {
        loadData()
    }
    
    func loadData() {
        repository.getHeadLine { result in
            switch result {
            case .success(let data):
                self.headLineData.accept(data.data.items)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}

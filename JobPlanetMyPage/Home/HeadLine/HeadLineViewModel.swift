//
//  HeadLineViewModel.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/18.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import RxRelay
 
class HeadLineViewModel {
    
    let service = HeadLineService(SearchHomeRepostiory() as SearchHomeRepositable)
    let headModelData = BehaviorRelay(value: [HeadLineModel]())
    
    init() {
        loadData()
    }
        
    func loadData() {
        service.fetchHeadLine { result in
//            guard let self = self else { return }
            self.headModelData.accept(result)
        }
    }
}

//
//  SearchHomeUseCase.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/05/30.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation
import RxSwift

struct SearchHomeUseCase {
    private let searchHomeRepository: SearchHomeRepositoriable
    
    init(searchHomeRepository: SearchHomeRepositoriable) {
        self.searchHomeRepository = searchHomeRepository
    }
}

extension SearchHomeUseCase {
    func getRanking() -> Observable<Result<SearchHome.Ranking, Error>> {
        searchHomeRepository.getRanking()
    }
    
    func getHeadLine() -> Observable<Result<SearchHome.HeadLine, Error>> {
        searchHomeRepository.getHeadLine()
    }
}

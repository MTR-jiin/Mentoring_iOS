//
//  SearchHomeMockRepository.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/05/27.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchHomeRepositoriable {
    func getRanking() -> Observable<Result<SearchHome.Ranking, Error>>
    func getHeadLine() -> Observable<Result<SearchHome.HeadLine, Error>>
}

struct SearchHomeMockRepository: SearchHomeRepositoriable {
    func getRanking() -> Observable<Result<SearchHome.Ranking, Error>> {
        .just(MentoringMockData.SearchHome.getRankingResponse)
    }
    
    func getHeadLine() -> Observable<Result<SearchHome.HeadLine, Error>> {
        .just(MentoringMockData.SearchHome.getHeadLineResponse)
    }
}

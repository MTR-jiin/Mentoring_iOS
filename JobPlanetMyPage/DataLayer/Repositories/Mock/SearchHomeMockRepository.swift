//
//  SearchHomeMockRepository.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/05/27.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation

protocol SearchHomeMockRepositoriable {
    func getRanking(_ completion: (Result<SearchHome.Ranking, Error>)->())
    func getHeadLine(_ completion: (Result<SearchHome.HeadLine, Error>)->())
}

struct SearchHomeMockRepository: SearchHomeMockRepositoriable {
    func getRanking(_ completion: (Result<SearchHome.Ranking, Error>) -> ()) {
        completion(MentoringMockData.SearchHome.getRankingResponse)
    }
    
    func getHeadLine(_ completion: (Result<SearchHome.HeadLine, Error>)->()) {
        completion(MentoringMockData.SearchHome.getHeadLineResponse)
    }
}

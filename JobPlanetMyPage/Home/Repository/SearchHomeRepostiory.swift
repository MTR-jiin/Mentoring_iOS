//
//  SearchHomeRepostiory.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/04.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation

protocol SearchHomeRepositable {
    func getRanking(_ comletionHandler: @escaping(Result<SearchHome.Ranking, Error>) -> ())
    func getHeadLine(_ comletionHandler: @escaping(Result<SearchHome.HeadLine, Error>) -> ())
}

class SearchHomeRepostiory: SearchHomeRepositable{
    func getRanking(_ comletionHandler: @escaping (Result<SearchHome.Ranking, Error>) -> ()) {
        comletionHandler(SearchHomeData.getRankingResponse)
    }
    
    func getHeadLine(_ comletionHandler: @escaping (Result<SearchHome.HeadLine, Error>) -> ()) {
        comletionHandler(SearchHomeData.getHeadLineResponse)
    }
}

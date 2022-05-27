//
//  MentoringMockData.SearchHome.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/05/27.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation

extension MentoringMockData {
    struct SearchHome { }
}

extension MentoringMockData.SearchHome {
    static var getRankingResponse: Result<SearchHome.Ranking, Error> {
        return APIKit.shared
            .request(url: "MentoringMockData.SearchHome.Ranking",
                     type: SearchHome.Ranking.self)
    }
    
    static var getHeadLineResponse: Result<SearchHome.HeadLine, Error> {
        return APIKit.shared
            .request(url: "MentoringMockData.SearchHome.HeadLine",
                     type: SearchHome.HeadLine.self)
    }
}

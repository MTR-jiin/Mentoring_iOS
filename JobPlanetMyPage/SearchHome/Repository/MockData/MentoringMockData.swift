//
//  MetoringMockData.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/04.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation

struct MentoringMockData {
    struct SearchHomeData {
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
}

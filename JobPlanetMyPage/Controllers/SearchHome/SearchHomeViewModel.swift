//
//  SearchHomeViewModel.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/06/02.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation
import RxSwift

final class SearchHomeViewModel {
    struct Input {
        let requestRank: Observable<Void>
    }
    
    struct Output {
        let rankData: Observable<[SearchHomeHeaderDatable]>
    }
    
    private let searchHomeUseCase: SearchHomeUseCase
    
    init(searchHomeUseCase: SearchHomeUseCase = .init(searchHomeRepository: SearchHomeMockRepository())) {
        self.searchHomeUseCase = searchHomeUseCase
    }
}

extension SearchHomeViewModel {
    func transform(input: Input) -> Output {
        let rankData: Observable<[SearchHomeHeaderDatable]> = input.requestRank
            .flatMap { self.searchHomeUseCase.getRanking() }
            .map {
                switch $0 {
                case .success(let rank):
                    return rank.data.items
                case .failure(let error):
                    throw error
                }
            }
        
        return .init(rankData: rankData)
    }
}

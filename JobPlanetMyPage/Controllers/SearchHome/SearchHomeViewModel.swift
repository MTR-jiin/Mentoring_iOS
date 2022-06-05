//
//  SearchHomeViewModel.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/06/02.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import RxSwift
import RxHeadPageKit

struct HeadPageModel {
    let index: Int = 0
    let headerHeight: CGFloat?
    let menuTitles: [String]
    let menuHeight: CGFloat
    let menuPinHeight: CGFloat
    let contentInset: UIEdgeInsets = .zero
    let viewControllers: [HeadPageViewControllerType]
}

final class SearchHomeViewModel {
    struct Input {
        let loadPage: Observable<Void>
        let requestRank: Observable<Void>
    }
    
    struct Output {
        let rankData: Observable<[SearchHomeHeaderDatable]>
        let configuration: Observable<HeadPageModel>
    }
    
    private let searchHomeUseCase: SearchHomeUseCase
    
    init(searchHomeUseCase: SearchHomeUseCase = .init(searchHomeRepository: SearchHomeMockRepository())) {
        self.searchHomeUseCase = searchHomeUseCase
    }
}

extension SearchHomeViewModel {
    func transform(input: Input) -> Output {
        let configuration: Observable<HeadPageModel> = input.loadPage
            .map { HeadPageModel(headerHeight: 0,
                                 menuTitles: ["하나", "둘", "셋"],
                                 menuHeight: 56,
                                 menuPinHeight: 0,
                                 viewControllers: [ChildViewController.createInstance(bg: .green)])
            }
        
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
        
        return .init(rankData: rankData, configuration: configuration)
    }
}

//
//  HeadLineService.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/24.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation
import UIKit

class HeadLineService {
    
//    typealias lineModel = HeadLineModel.HeadLineViewModel
//    typealias cellModel = HeadLineModel.InfinityCellModel

    let repository: SearchHomeRepositable
    var headLineModel = [HeadLineModel]()
    var infinityModel = [InfinityCellModel]()
    
    init(_ repository: SearchHomeRepositable) {
        self.repository = repository
    }
    
    private func entityToModel(_ from: SearchHome.HeadLine){
        let entity = from.data.items
        entity.enumerated().forEach { idx, element in
            //Inject Model
            headLineModel.append(HeadLineModel(titleRow1: element.titleRow1,
                                           titleRow2: element.titleRow2,
                                           backgroundColor: UIColor(hexString: element.backgroundColor)))
            infinityModel.append(InfinityCellModel(imageURL: URL(fileURLWithPath: element.thumbnail),
                                               nowIndex: String(idx)))
        }
    }
    
    //Entity -> Model
    func fetch(_ comletionHandler: @escaping ([HeadLineModel], [InfinityCellModel]) -> Void) {
        repository.getHeadLine { result in
            switch result {
            case .success(let data):
                self.entityToModel(data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
//    func infinityCellDataFetch(_ comletionHandler: @escaping ([InfinityCellModel]) -> Void) {
//        repository.getHeadLine { result in
//            switch result {
//            case .success(let data):
//                self.entityToModel(data)
//            case .failure(let error):
//                debugPrint(error)
//            }
//        }
//    }

}

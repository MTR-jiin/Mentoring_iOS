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

    let repository: SearchHomeRepositable
    var headLineModel = [HeadLineModel]()
    
    init(_ repository: SearchHomeRepositable) {
        self.repository = repository
    }
    
    private func entityToModel(_ from: SearchHome.HeadLine){
        let entity = from.data.items
        entity.enumerated().forEach { idx, element in
            //Inject Model
            headLineModel.append(HeadLineModel(titleRow1: element.titleRow1,
                                           titleRow2: element.titleRow2,
                                           backgroundColor: UIColor(hexString: element.backgroundColor),
                                           imageURL: URL(string: element.thumbnail)!,
                                          nowIndex: String(idx + 1),
                                          endIndex: String(entity.count)))
        }
    }
    
    //Entity -> Model
    func fetchHeadLine(_ completionHandler: @escaping ([HeadLineModel]) -> Void) {
        repository.getHeadLine { result in
            switch result {
            case .success(let data):
                self.entityToModel(data)
                completionHandler(self.headLineModel)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
}

//
//  HeadLineCellModel.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/24.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation
import UIKit

struct HeadLineModel: HeadDatable {
    var titleRow1: String
    var titleRow2: String
    var backgroundColor: UIColor
    var imageURL: URL
    var nowIndex: String
    var endIndex: String
}

protocol HeadDatable {
    var titleRow1: String { get }
    var titleRow2: String { get }
    var backgroundColor: UIColor { get }
}

//struct HeadLineModel: HeadLineDatable {
//    var titleRow1: String
//    var titleRow2: String
//    var backgroundColor: UIColor
//}
//
//struct InfinityCellModel {
//
//}

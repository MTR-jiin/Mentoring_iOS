//
//  SearchHome.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/05/27.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import Foundation

struct SearchHome { }

extension SearchHome {
    struct Ranking: Codable {
        let data: DataClass
        
        struct DataClass: Codable {
            let header: String
            let items: [Item]
        }

        struct Item: Codable {
            let ranking, companyID, fluctuation: Int
            let companyName: String

            enum CodingKeys: String, CodingKey {
                case ranking, fluctuation
                case companyID = "company_id"
                case companyName = "company_name"
            }
        }
    }

    struct HeadLine: Codable {
        let data: DataClass
        
        struct DataClass: Codable {
            let header: String
            let items: [Item]
        }

        struct Item: Codable {
            let id, contentsType, contentsID: Int
            let titleRow1, titleRow2, subtitle, originalSubtitle: String
            let author, backgroundColor, thumbnail: String
            let premium: Bool
            let webLinkURL, deepLinkURL: String

            enum CodingKeys: String, CodingKey {
                case id, subtitle, author, thumbnail, premium
                case contentsType = "contents_type"
                case contentsID = "contents_id"
                case titleRow1 = "title_row1"
                case titleRow2 = "title_row2"
                case originalSubtitle = "original_subtitle"
                case backgroundColor = "background_color"
                case webLinkURL = "web_link_url"
                case deepLinkURL = "deep_link_url"
            }
        }
    }
}


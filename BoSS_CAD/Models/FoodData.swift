//
//  FoodData.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/11/04.
//

import Foundation

struct FoodData: Codable {
    var i2790: I2790

    enum CodingKeys: String, CodingKey {
        case i2790 = "I2790"
    }
}

// MARK: - I2790
struct I2790: Codable {
    let totalCount: String
    var row: [Row]
    let result: Result
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case row
        case result = "RESULT"
    }
}

// MARK: - Result
struct Result: Codable {
    let msg, code: String

    enum CodingKeys: String, CodingKey {
        case msg = "MSG"
        case code = "CODE"
    }
}


// MARK: - Row
struct Row: Codable {
    let nutrCont1, nutrCont2, nutrCont3, nutrCont4: String  // 열량, 탄, 단, 지
    let servingSize: String // 총내용량
    let descKor: String

    enum CodingKeys: String, CodingKey {
        case nutrCont4 = "NUTR_CONT4" // 지방
        case nutrCont1 = "NUTR_CONT1" // 열량
        case nutrCont2 = "NUTR_CONT2" // 탄수화물
        case nutrCont3 = "NUTR_CONT3" // 단백질
        case servingSize = "SERVING_SIZE" // 총내용량
        case descKor = "DESC_KOR"  // 음식명
    }
}

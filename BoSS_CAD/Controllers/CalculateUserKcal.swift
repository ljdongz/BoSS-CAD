//  Created by JunHee on 2022/11/11.

import Foundation

// 기초대사량 계산 함수
func calBMR (gender : String, age : Int, height : Int, weight : Int ) -> Int {
    
    var hbBmr : Double = 0.0 // 해리스-베네딕트 BMR
    var mjBmr : Double = 0.0 // 미플란-지어 BMR
    var avgBmr : Double = 0.0 // 평균 BMR
    
    if (gender == "남성") {
        hbBmr = 88.4 + (13.4 * weight) + (4.8 * height) - (5.68 * age)
        mjBmr = (10 * weight) + (6.25 * height) - (5 * age) + 5
    }
    else if (gender == "여성") {
        hbBmr = 447.6 + (9.25 * weight) + (3.1 * height) - (4.33 * age)
        mjBmr = (10 * weight) + (6.25 * height) - (5 * age) - 161
    }
    
    avgBmr = (hbBmr + mjBmr) / 2 // 평균값 계산

    return Int(avgBmr)
}

// 일일대사량 계산 함수
func calDMR (bmr : Int, choice : Int) -> Int {
    
    var dmr : Double = 0.0
    var useBmr : Double = Double(bmr)
    
    switch choice {
    case 1 : dmr = useBmr * 1.2 // 거의 운동하지 않음: 기초대사량 × 1.2
    case 2 : dmr = useBmr * 1.375 // 가벼운 운동(주 1~3일): 기초대사량 × 1.375
    case 3 : dmr = useBmr * 1.55 // 보통 수준: 기초대사량 × 1.55
    case 4 : dmr = useBmr * 1.725 // 적극적으로 운동(주 6~7일): 기초대사량 × 1.725
    case 5 : dmr = useBmr * 1.9 // 매우 적극적으로 운동(주 6~7일): 기초대사량 × 1.9
    default : dmr = useBmr * 1
    }
    return Int(dmr)
}

// 권장 섭취 열량 계산 함수
func calRMR (dmr : Int, goalDay : Int, goalDecreaseFat : Double) -> Int {
    var rmr : Int = dmr - Int((goalDecreaseFat * 7800) / Double(goalDay))
    return rmr
}

//  탄수화물, 단백질, 지방 5:3:2 비율 계산 및 양(g) 계산
func calRatio (dmr : Int) -> (carbs : Int, protein : Int, fat : Int) {

    var carbs : Int = ((dmr / 10) * 5 ) / 4
    var protein = ((dmr / 10) * 3 ) / 4
    var fat = ((dmr / 10) * 2 ) / 9
    
    return (carbs, protein, fat)
}

var testBMR = calBMR(gender: "남성", age: 22, height: 178, weight: 78)
var testDMR = calDMR(bmr: testBMR, choice: 3)
var testRMR = calRMR(dmr: testDMR, goalDay: 30, goalDecreaseFat: 3)
var testRATIO = calRatio(dmr: testRMR)


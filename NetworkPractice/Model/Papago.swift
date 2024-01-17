//
//  Papago.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/17/24.
//

import Foundation
struct Papago: Codable {
    let message: PapagoResult
}

struct PapagoResult:Codable {
    let result: PapagoFinal
}

struct PapagoFinal: Codable {
    let srcLangType: String
    let tarLangType: String
    let translatedText: String
}

struct PapagoValue {
    enum code: String, CaseIterable {
        case 한국어 = "ko"
        case 영어 = "en"
        case 일본어 = "ja"
        case 중국어간체 = "zh-CN"
        case 중국어번체 = "zh-TW"
        case 베트남어 = "vi"
        case 인도네시아어 = "id"
        case 태국어 = "th"
        case 독일어 = "de"
        case 러시아어 = "ru"
        case 스페인어 = "es"
        case 이탈리아어 = "it"
        case 프랑스어 = "fr"
    }
    
    static var lagnuageDictionry: [String:String] {
            var newDic: [String:String] = [:]
            for codeData in code.allCases {
                newDic[codeData.rawValue] = String(describing: codeData)
            }
            return newDic
    }
}

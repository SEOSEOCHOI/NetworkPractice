//
//  LottoAPIManager.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/16/24.
//

import Foundation
import Alamofire

struct LottoAPIManager {
    func callRequest(number: String, complitionHandler: @escaping (Lottery) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"

        
        AF.request(url).responseDecodable(of: Lottery.self) { response in
            switch response.result {
            case .success(let success):
                //print(success)
                complitionHandler(success.self)
            case .failure(let failure):
                print(failure)
            }
        }

    }
}

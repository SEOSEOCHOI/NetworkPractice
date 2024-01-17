//
//  PapagoAPIManager.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/17/24.
//

import Foundation
import Alamofire

struct PapagoAPIManager {
    func callRequest(text: String, source: String, target:String, complitionHandler: @escaping (Papago) -> Void) {
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id":APIKey.clintID,
            "X-Naver-Client-Secret":APIKey.clientSecret
        ]
        let parameters: Parameters = [
            "text":text,
            "source":source,
            "target":target
        ]
        
        AF.request(url, method: .post, parameters: parameters, headers: headers).responseDecodable(of: Papago.self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                
                complitionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }

}


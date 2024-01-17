//
//  BookAPIManager.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/17/24.
//

import Foundation
import Alamofire

struct BookAPIManager {
    func callRuest(text: String, complitionHandler: @escaping (Book) -> Void) {

        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = "https://dapi.kakao.com/v3/search/book?query=\(query!)"
        let headers: HTTPHeaders = [
            "Authorization":APIKey.kakao
        ]

        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: Book.self) { response in
            switch response.result {
            case .success(let success):
                
                complitionHandler(success.self)
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
}



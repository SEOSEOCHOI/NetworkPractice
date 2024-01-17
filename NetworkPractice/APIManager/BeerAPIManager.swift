//
//  BeerAPIManager.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/16/24.
//

import Foundation
import Alamofire

struct BeerAPIManager {
    func callRequest(complitionHandler: @escaping (Beer) -> Void) {
        let url = "https://api.punkapi.com/v2/beers/random"
        
        AF.request(url).responseDecodable(of: Beer.self) { response in
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

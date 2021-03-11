//
//  ViewModel.swift
//  HomeWorkReview
//
//  Created by Apple on 3/10/21.
//

import Foundation
import Alamofire

class ViewModel {
    var arrItem = [Item]()
    func getRequest(completion: @escaping ([Item]) -> Void) {
        AF.request(URLData, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (reponse) in
            guard let data = reponse.data else {return}
            do {
            let item = try JSONDecoder().decode(DataItem.self, from: data)
                self.arrItem = item.data!.content
                completion(self.arrItem)
            }catch{
                print(error)
            }
        }
    }
}

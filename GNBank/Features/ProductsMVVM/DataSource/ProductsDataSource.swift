//
//  ProductsDataSource.swift
//  GNBank
//
//  Created by Anna on 12/03/2021.
//

import Foundation
import Alamofire

class ProductsDataSource: NSObject {
  
  func getResponse(success succeed: (@escaping ([ProductModel]) -> ()),
                   failure fail: (@escaping () -> ())) {
    
    let url = "http://quiet-stone-2094.herokuapp.com/transactions"
    let parameters: [String:Any] = [:]
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "Accept": "application/json"
    ]
    
    AF.request(url,
               method: .get,
               parameters: parameters,
               encoding: URLEncoding.queryString,
               headers: headers)
      .validate(statusCode: 200..<300)
      .responseJSON(completionHandler: { (resData) -> Void in
        switch resData.result {
        case .success(let value):
          var result = [ProductModel]()
          if let dict = value as? [[String: Any]] {
            dict.forEach { (product) in
              if let model = ProductModel(JSON: product) {
                result.append(model)
              }
            }
            succeed(result)
          } else {
            fail()
          }
        case .failure(_):
          fail()
        }
      })
  }
  
}

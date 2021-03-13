//
//  ConversionsDataSource.swift
//  GNBank
//
//  Created by Anna on 13/03/2021.
//

import Foundation
import Alamofire

class ConversionsDataSource: NSObject {
  
  func getResponse(success succeed: (@escaping ([ConversionModel]) -> ()),
                   failure fail: (@escaping () -> ())) {
    
    let url = "http://quiet-stone-2094.herokuapp.com/rates"
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
          var result = [ConversionModel]()
          if let dict = value as? [[String: Any]] {
            dict.forEach { (conversion) in
              if let model = ConversionModel(JSON: conversion) {
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

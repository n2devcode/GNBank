//
//  ProductsModel.swift
//  GNBank
//
//  Created by Anna on 12/03/2021.
//

import Foundation
import ObjectMapper

struct ProductModel: Mappable {
  var sku: String?
  var amount: String?
  var currency: String?
  
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    sku <- map["sku"]
    amount <- map["amount"]
    currency <- map["currency"]
  }
}

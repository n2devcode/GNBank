//
//  ConversionModel.swift
//  GNBank
//
//  Created by Anna on 13/03/2021.
//

import Foundation
import ObjectMapper

struct ConversionModel: Mappable {
  var from: String?
  var to: String?
  var rate: String?
  
  public init?(map: Map) { }
  
  public mutating func mapping(map: Map) {
    from <- map["from"]
    to <- map["to"]
    rate <- map["rate"]
  }
}

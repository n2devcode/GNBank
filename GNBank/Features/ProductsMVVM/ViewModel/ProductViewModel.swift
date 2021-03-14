//
//  ProductViewModel.swift
//  GNBank
//
//  Created by Anna on 13/03/2021.
//

import Foundation

class ProductViewModel {
  private var productModel: ProductModel?
  
  var sku: String {
    return productModel?.sku ?? Constants.noData
  }
  
  var amount: Double {
    //TODO
    var result = Constants.noAmount
    if let string = productModel?.amount {
      result = Double(string) ?? Constants.noAmount
    }
    return result
  }
  
  var currency: CurrencyEnum {
    let s = productModel?.currency ?? Constants.noData
    return CurrencyUtils.stringToEnum(s)
  }
  
  init() { }
  
  private init(model: ProductModel) {
    productModel = model
  }
  
  func getProduct(_ product: ProductModel) -> ProductViewModel {
    return ProductViewModel(model: product)
  }
}

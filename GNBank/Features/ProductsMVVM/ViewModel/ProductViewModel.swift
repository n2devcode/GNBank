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
    var result = Constants.noAmount
    if let string = productModel?.amount {
      result = Double(string) ?? Constants.noAmount
    }
    return result
  }
  
  var amountEUR: Double {
    //TODO Bankers Rounding
    var result = amount
    if currency != .eur {
      let conversion = CurrencyUtils.conversionListToEUR.filter({$0.currency == currency})
      if !conversion.isEmpty {
        result *= conversion[0].rateEUR
      }
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

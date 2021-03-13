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
  
  var amount: String {
    return productModel?.amount ?? Constants.noData
  }
  
  var currency: String {
    return productModel?.currency ?? Constants.noData
  }
  
  init() { }
  
  private init(model: ProductModel) {
    productModel = model
  }
  
  func getProduct(_ product: ProductModel) -> ProductViewModel {
    return ProductViewModel(model: product)
  }
}

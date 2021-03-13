//
//  ProductsViewModel.swift
//  GNBank
//
//  Created by Anna on 13/03/2021.
//

import Foundation

class ProductListViewModel {
  private var productListModel: [ProductModel]?
  
  private var allProductList = [ProductViewModel]()
  private var conversionsList = [ProductViewModel]()
  
  var productList = [ProductViewModel]()
  
  private func appendList() {
    let productVM = ProductViewModel()
    for productModel in (productListModel ?? []) {
      let product = productVM.getProduct(productModel)
      allProductList.append(product)
    }
  }
  
  private func setProductsModel(_ model: [ProductModel]) {
    productListModel = model
    appendList()
    conversionAmountProducts()
  }
  
  private func conversionAmountProducts() {
    //TODO
    productList = allProductList
  }
  
}

//MARK: getData
extension ProductListViewModel {
  
  func getData(success succeed: (@escaping () -> ()),
               loadError fail: (@escaping () -> ())) {
    let dataSource = ProductsDataSource()
    dataSource.getResponse { (result) in
      self.setProductsModel(result)
      succeed()
    } failure: {
      fail()
    }
  }
  
}

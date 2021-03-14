//
//  ProductsViewModel.swift
//  GNBank
//
//  Created by Anna on 13/03/2021.
//

import Foundation

class ProductListViewModel {
  private let productVM = ProductViewModel()
  private let conversionsVM = ConversionListViewModel()
  
  private var productListModel: [ProductModel]?
  private var allProductList = [ProductViewModel]()
  
  var productList = [ProductsStruct]()
  
  private func appendList() {
    for productModel in (productListModel ?? []) {
      let product = productVM.getProduct(productModel)
      allProductList.append(product)
    }
  }
  
  private func setProductsModel(_ model: [ProductModel]) {
    productListModel = model
    appendList()
    let _ = conversionAmountProducts()
  }
  
  private func conversionAmountProducts() -> String {
    let groups = Dictionary(grouping: allProductList, by: { $0.sku })
    let _ = Dictionary(grouping: allProductList) { (product) -> String in
      let nameGroup = product.sku
      let transactionsGroup = groups[nameGroup] ?? [ProductViewModel]()
      let product = ProductsStruct(name: nameGroup, transactions: transactionsGroup)
      productList.append(product)
      return Constants.noData
    }
    return Constants.noData
  }
  
}

//MARK: getData
extension ProductListViewModel {
  
  func getData(success succeed: (@escaping () -> ()),
               loadError fail: (@escaping () -> ())) {
    
    conversionsVM.getData {
      
      let dataSource = ProductsDataSource()
      dataSource.getResponse { (result) in
        self.setProductsModel(result)
        succeed()
      } failure: {
        fail()
      }
      
    } loadError: {
      fail()
    }
  }
}

struct ProductsStruct {
  let name: String
  var transactions: [ProductViewModel]
}

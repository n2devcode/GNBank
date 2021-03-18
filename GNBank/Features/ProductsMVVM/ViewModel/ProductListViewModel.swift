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
    let _ = groupedProductList()
  }
  
  private func groupedProductList() -> String {
    let groups = Dictionary(grouping: allProductList, by: { $0.sku })
    let _ = Dictionary(grouping: allProductList) { (product) -> String in
      let nameGroup = product.sku
      if productList.filter({$0.name == nameGroup}).isEmpty {
        let transactionsGroup = groups[nameGroup] ?? [ProductViewModel]()
        let sum = getTotalSum(transactions: transactionsGroup)
        let sumString = "\(Utils.roundHalfToEven(sum)) €"
        let productStruct = ProductsStruct(name: nameGroup, transactions: transactionsGroup, totalSum: sumString)
        productList.append(productStruct)
      }
      return Constants.noData
    }
    return Constants.noData
  }
  
  private func getTotalSum(transactions: [ProductViewModel]) -> Double {
    var sum = 0.0
    transactions.forEach { (trans) in
      sum += trans.amountEUR
    }
    return sum
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
  let transactions: [ProductViewModel]
  let totalSum: String
}

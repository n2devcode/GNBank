//
//  ConversionListViewModel.swift
//  GNBank
//
//  Created by Anna on 13/03/2021.
//

import Foundation

class ConversionListViewModel {
  private var conversionListModel: [ConversionModel]?
  private var conversionList = [ConversionViewModel]()
  
  private func appendList() {
    let conversionVM = ConversionViewModel()
    for conversionModel in (conversionListModel ?? []) {
      let conversion = conversionVM.getConversion(conversionModel)
      conversionList.append(conversion)
    }
  }
  
  private func setConversionsModel(_ model: [ConversionModel]) {
    conversionListModel = model
    appendList()
    CurrencyUtils.convertAllConversionsToEUR(conversionList)
  }
}

//MARK: getData
extension ConversionListViewModel {
  
  func getData(success succeed: (@escaping () -> ()),
               loadError fail: (@escaping () -> ())) {
    let dataSource = ConversionsDataSource()
    dataSource.getResponse { (result) in
      self.setConversionsModel(result)
      succeed()
    } failure: {
      fail()
    }
  }
  
}

//
//  ConversionViewModel.swift
//  GNBank
//
//  Created by Anna on 13/03/2021.
//

import Foundation

class ConversionViewModel {
  private var conversionModel: ConversionModel?
  
  var from: CurrencyEnum {
    let s = conversionModel?.from ?? Constants.noData
    return CurrencyUtils.stringToEnum(s)
  }
  
  var to: CurrencyEnum {
    let s = conversionModel?.to ?? Constants.noData
    return CurrencyUtils.stringToEnum(s)
  }
  
  var rate: Double {
    var result = 0.0
    if let string = conversionModel?.rate {
      result = Double(string) ?? Constants.noAmount
    }
    return result
  }
  
  init() { }
  
  private init(model: ConversionModel) {
    conversionModel = model
  }
  
  func getConversion(_ conversion: ConversionModel) -> ConversionViewModel {
    return ConversionViewModel(model: conversion)
  }
  
}

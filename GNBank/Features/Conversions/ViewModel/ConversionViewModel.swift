//
//  ConversionViewModel.swift
//  GNBank
//
//  Created by Anna on 13/03/2021.
//

import Foundation

class ConversionViewModel {
  private var conversionModel: ConversionModel?
  
  var from: String {
    return conversionModel?.from ?? Constants.noData
  }
  
  var to: String {
    return conversionModel?.to ?? Constants.noData
  }
  
  var rate: String {
    return conversionModel?.rate ?? Constants.noData
  }
  
  init() { }
  
  private init(model: ConversionModel) {
    conversionModel = model
  }
  
  func getConversion(_ conversion: ConversionModel) -> ConversionViewModel {
    return ConversionViewModel(model: conversion)
  }
}

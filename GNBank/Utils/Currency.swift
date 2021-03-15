//
//  Currency.swift
//  GNBank
//
//  Created by Anna on 14/03/2021.
//

import Foundation
import UIKit

struct ConversionStruct {
  let currency: CurrencyEnum
  let rateEUR: Double
}

enum CurrencyEnum: String {
  case eur = "EUR"
  case usd = "USD"
  case cad = "CAD"
  case aud = "AUD"
  case none = "-"
  
  public func symbol() -> String {
    switch self {
    case .eur:
      return "€"
    case .usd:
      return "$"
    case .cad:
      return "C$"
    case .aud:
      return "A$"
    case .none:
      return ""
    }
  }
}

class CurrencyUtils {
  
  public static var conversionListToEUR = [ConversionStruct]()
  
  public static func stringToEnum(_ string: String) -> CurrencyEnum {
    switch string {
    case CurrencyEnum.eur.rawValue:
      return .eur
    case CurrencyEnum.usd.rawValue:
      return .usd
    case CurrencyEnum.cad.rawValue:
      return .cad
    case CurrencyEnum.aud.rawValue:
      return .aud
    default:
      return .none
    }
  }
  
  public static func convertAllConversionsToEUR(_ list: [ConversionViewModel]) {
    conversionListToEUR = [ConversionStruct]()
    var conversionList = list
    var index = 0
    for conversion in list {
      if conversion.to == .eur {
        conversionListToEUR.append(ConversionStruct(currency: conversion.from, rateEUR: conversion.rate))
        conversionList.remove(at: index)
        index -= 1
      }
      if conversion.from == .eur {
        conversionList.remove(at: index)
        index -= 1
      }
      index += 1
    }
    while !conversionList.isEmpty {
      for currency in conversionListToEUR {
        index = 0
        for conversion in conversionList {
          let haveCurrency = conversionListToEUR.filter({$0.currency == conversion.from})
          if haveCurrency.isEmpty && currency.currency == conversion.to {
            conversionListToEUR.append(ConversionStruct(currency: conversion.from, rateEUR: conversion.rate*currency.rateEUR))
            conversionList.remove(at: index)
            index -= 1
          }
          if !haveCurrency.isEmpty {
            conversionList.remove(at: index)
            index -= 1
          }
          index += 1
        }
      }
    }
  }
}

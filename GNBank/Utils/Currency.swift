//
//  Currency.swift
//  GNBank
//
//  Created by Anna on 14/03/2021.
//

import Foundation
import UIKit

struct Currency {
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
  
  public static func convertAllConversionsToEUR(_ list: [ConversionViewModel]) -> [Currency] {
    var currencyList = [Currency]()
    for conversion in list {
      if conversion.from != .eur && conversion.from != .none {
        //TODO
      }
    }
    return currencyList
  }
}

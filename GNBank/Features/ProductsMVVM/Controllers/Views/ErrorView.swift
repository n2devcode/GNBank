//
//  ErrorView.swift
//  GNBank
//
//  Created by Anna on 13/03/2021.
//

import UIKit

class ErrorView: UIView {
  @IBOutlet weak var imgeView: UIImageView!
  
  var productsVC = ProductsViewController()
  
  @IBAction func clickRetry(_ sender: Any) {
    productsVC.loadData()
  }
}

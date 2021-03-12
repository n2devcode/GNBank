//
//  ViewController.swift
//  GNBank
//
//  Created by Anna on 12/03/2021.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func clickShowProducts(_ sender: Any) {
    let productsVC = ProductsViewController()
    self.present(productsVC, animated: true)
  }
  
}


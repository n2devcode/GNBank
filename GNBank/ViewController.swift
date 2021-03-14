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
    if Utils.isConnectedToNetwork() {
      let productsVC = ProductsViewController()
      productsVC.modalPresentationStyle = .fullScreen
      self.present(productsVC, animated: true)
    } else {
      Utils.showAlert(vc: self, description: "No tienes conexión a internet")
    }
  }
  
}


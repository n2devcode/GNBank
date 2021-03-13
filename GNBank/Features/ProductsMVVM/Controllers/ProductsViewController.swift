//
//  ProductsViewController.swift
//  GNBank
//
//  Created by Anna on 12/03/2021.
//

import UIKit

class ProductsViewController: UIViewController, LoadViewProtocol, AddSubviewConstraintsProtocol {
  @IBOutlet weak var productsView: UIView!
  
  let productsVM = ProductListViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
  }
  
  @IBAction func clickBack(_ sender: Any) {
    self.dismiss(animated: true)
  }
  
  private func loadData() {
    showLoadView()
    //TODO
    productsVM.getData {
      let products = self.productsVM.productList
    } loadError: {
      print("Error")
    }

  }
  
  private func showLoadView() {
    if let subview = self.loadView("LoadView") as? LoadView {
      self.addSubview(view: productsView, subview: subview)
    }

  }
  
}

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
  
  func loadData() {
    showLoadView()
    productsVM.getData {
      self.showProductsTableView()
    } loadError: {
      self.showErrorView()
    }
  }
  
  private func showLoadView() {
    if let subview = self.loadView("LoadView") as? LoadView {
      self.addSubview(view: productsView, subview: subview)
    }
  }
  
  private func showErrorView() {
    if let subview = self.loadView("ErrorView") as? ErrorView {
      subview.productsVC = self
      self.addSubview(view: productsView, subview: subview)
    }
  }
  
  private func showProductsTableView() {
    if let subview = self.loadView("ProductsTableView") as? ProductsTableView {
      subview.productsVC = self
      subview.productList = self.productsVM.productList
      self.addSubview(view: productsView, subview: subview)
    }
  }
}

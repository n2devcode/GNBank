//
//  ProductsViewController.swift
//  GNBank
//
//  Created by Anna on 12/03/2021.
//

import UIKit

class ProductsViewController: UIViewController, LoadViewProtocol, AddSubviewConstraintsProtocol {
  @IBOutlet weak var productsView: UIView!
  
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
  }
  
  private func showLoadView() {
    if let subview = self.loadView("LoadView") as? LoadView {
      self.addSubview(view: productsView, subview: subview)
    }
  }
  
}

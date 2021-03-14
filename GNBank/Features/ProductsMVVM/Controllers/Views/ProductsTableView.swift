//
//  ProductsTableView.swift
//  GNBank
//
//  Created by Anna on 13/03/2021.
//

import UIKit

class ProductsTableView: UIView {
  @IBOutlet weak var productsTableView: UITableView!
  
  private let nibNameCell = "ProductTableViewCell"
  
  var productsVC = ProductsViewController()
  var productList = [ProductsStruct]()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    registerNib()
    setDelegates()
  }
  
  private func registerNib() {
    let nib = UINib(nibName: nibNameCell, bundle: Bundle.main)
    productsTableView.register(nib, forCellReuseIdentifier: nibNameCell)
  }
  
  private func setDelegates() {
    productsTableView.dataSource = self
    productsTableView.delegate = self
  }
}

//MARK: UITableViewDataSource, UITableViewDelegate
extension ProductsTableView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: nibNameCell, for: indexPath) as? ProductTableViewCell {
      cell.productLbl.text = productList[indexPath.row].name
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailProductVC = DetailProductViewController()
    detailProductVC.product = productList[indexPath.row]
    productsVC.present(detailProductVC, animated: true)
  }
}

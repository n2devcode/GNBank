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
  
  var productList = [ProductViewModel]()
  
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
      let index = indexPath.row
      cell.productLbl.text = productList[index].sku
      cell.amountLbl.text = productList[index].amount
      return cell
    }
    return UITableViewCell()
  }
}

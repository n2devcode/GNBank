//
//  DetailProductViewController.swift
//  GNBank
//
//  Created by Anna on 14/03/2021.
//

import UIKit

class DetailProductViewController: UIViewController {
  @IBOutlet weak var productLbl: UILabel!
  @IBOutlet weak var transactionsTableView: UITableView!
  @IBOutlet weak var totalAmountLbl: UILabel!
  
  private let nibNameCell = "AmountTableViewCell"
  
  var transactionList = [ProductViewModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNib()
  }
  
  @IBAction func clickBack(_ sender: Any) {
    self.dismiss(animated: true)
  }
  
  private func registerNib() {
    let nib = UINib(nibName: nibNameCell, bundle: Bundle.main)
    transactionsTableView.register(nib, forCellReuseIdentifier: nibNameCell)
  }

}

//MARK: UITableViewDataSource, UITableViewDelegate
extension DetailProductViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return transactionList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: nibNameCell, for: indexPath) as? AmountTableViewCell {
      let index = indexPath.row
      let amount = "\(transactionList[index].amount)"
      let currency = "\(transactionList[index].currency.symbol())"
      cell.amountLbl.text = "\(amount) \(currency)"
      return cell
    }
    return UITableViewCell()
  }
}

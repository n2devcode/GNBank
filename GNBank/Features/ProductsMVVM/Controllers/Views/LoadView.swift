//
//  LoadView.swift
//  GNBank
//
//  Created by Anna on 12/03/2021.
//

import UIKit

class LoadView: UIView {
  @IBOutlet weak var loadImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    loadGif()
  }
  
  private func loadGif() {
    loadImageView.loadGif(name: "load")
  }
}

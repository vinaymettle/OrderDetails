//
//  OrderCollectionViewCell.swift
//  OderDetails
//
//  Created by Vinay Ponna on 4/6/20.
//  Copyright © 2020 Vinay Ponna. All rights reserved.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var orderTypeLabel: UILabel!
    @IBOutlet private var orderTotalLabel: UILabel!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
    }

    func configure(with order: Order) {
        guard let orderId = order.orderID else {
            orderTypeLabel.text = String(format:"Receipt # \(order.storeNumber ?? "") - \(order.transactionNumber ?? "") - \(order.registerNumber ?? "") ")
             return orderTotalLabel.text = String(format:"\(order.total ?? 0)")

        }
        orderTypeLabel.text = String(format:"Order # \(orderId)")
        orderTotalLabel.text = String(format:"\(order.orderTotal ?? 0)")
    }

}

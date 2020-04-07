//
//  ViewController.swift
//  OderDetails
//
//  Created by Vinay Ponna on 4/6/20.
//  Copyright © 2020 Vinay Ponna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var headerLabel: UILabel!
    @IBOutlet private var collectioView: UICollectionView!
    
    var orders: [Order] = []
    var numberOfRows: Int { return orders.count }
    private let cellIdentifier = "OrderCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = "Order Details"
        collectioView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectioView.dataSource = self
        ReadJsonFile().loadJson(fileName: "OrderDetail") { [weak self] (Orders) in
            guard let self = self, let orders = [Orders].first?.orders else {
                return
            }
            self.orders = orders
            DispatchQueue.main.async{
                self.collectioView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? OrderCollectionViewCell else {
            fatalError("Issue dequeuing \(cellIdentifier)")
        }
        cell.configure(with: orders[indexPath.row])
        return cell
    }
}

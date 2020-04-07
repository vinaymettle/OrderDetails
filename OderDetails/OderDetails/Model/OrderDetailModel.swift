//
//  OrderDetailModel.swift
//  OderDetails
//
//  Created by Vinay Ponna on 4/6/20.
//  Copyright © 2020 Vinay Ponna. All rights reserved.
//

import Foundation

// MARK: - OderDetails
struct Orders: Codable {
    let orders: [Order]
}

// MARK: - Order
struct Order: Codable {
    let orderID: String?
    let orderDate: String?
    let status: String?
    let orderTotal: Double?
    let orderStatus: String?
    var type, storeNumber, registerNumber, transactionNumber: String?
    let date: String?
    let total: Double?

    enum CodingKeys: String, CodingKey {
        case orderID = "orderId"
        case orderDate,
        status,
        orderTotal,
        orderStatus,
        type,
        storeNumber,
        registerNumber,
        transactionNumber,
        date,
        total
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        orderID = try values.decodeIfPresent(String.self, forKey: .orderID)
        orderDate = try values.decodeIfPresent(String.self, forKey: .orderDate)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        orderTotal = try values.decodeIfPresent(Double.self, forKey: .orderTotal)
        orderStatus = try values.decodeIfPresent(String.self, forKey: .orderStatus)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        storeNumber = try values.decodeIfPresent(String.self, forKey: .storeNumber)
        registerNumber = try values.decodeIfPresent(String.self, forKey: .registerNumber)
        transactionNumber = try values.decodeIfPresent(String.self, forKey: .transactionNumber)
        storeNumber = try values.decodeIfPresent(String.self, forKey: .storeNumber)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        total = try values.decodeIfPresent(Double.self, forKey: .total)
    }

    enum OrderStatus: String, Codable {
        case placed = "PLACED"
        case transmitted = "TRANSMITTED"
    }

    enum Status: String, Codable {
        case complete = "Complete"
        case transmitted = "TRANSMITTED"
    }
}






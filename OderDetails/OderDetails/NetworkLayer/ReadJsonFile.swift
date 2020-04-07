//
//  ReadJsonFile.swift
//  OderDetails
//
//  Created by Vinay Ponna on 4/6/20.
//  Copyright © 2020 Vinay Ponna. All rights reserved.
//

import Foundation

class ReadJsonFile: NSObject {
    
    func loadJson(fileName: String, completionHandler: @escaping (Orders) -> Void) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                guard let jsonData = try? JSONDecoder().decode(Orders.self, from: data) else {
                    fatalError("Error Parsing data")
                }
                completionHandler(jsonData)
            } catch {
                print("error:\(error)")
            }
        }
    }
}



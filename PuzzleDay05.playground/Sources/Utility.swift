//
//  Utility.swift
//  NLP001
//
//  Created by ankit bharti on 29/07/18.
//  Copyright © 2018 Ankit Bharti. All rights reserved.
//

import Foundation

public func loadTextFromFile(isSampleFile: Bool = false) -> [Int] {
    guard let fileURL = Bundle.main.url(forResource: isSampleFile ? "SampleInput" : "Input", withExtension: "txt"),
        let data = try? Data(contentsOf: fileURL),
        let textString = String(data: data, encoding: .utf8) else { return [] }
    return textString.components(separatedBy: "\n").filter { return $0.count != 0 }.compactMap { Int($0) }
}


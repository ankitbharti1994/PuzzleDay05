//
//  Utility.swift
//  NLP001
//
//  Created by ankit bharti on 29/07/18.
//  Copyright © 2018 Ankit Bharti. All rights reserved.
//

import Foundation

fileprivate func loadTextFromFile(isSampleFile: Bool = false) -> [Int] {
    guard let fileURL = Bundle.main.url(forResource: isSampleFile ? "SampleInput" : "Input", withExtension: "txt"),
        let data = try? Data(contentsOf: fileURL),
        let textString = String(data: data, encoding: .utf8) else { return [] }
    return textString.components(separatedBy: "\n").filter { return $0.count != 0 }.compactMap { Int($0) }
}

/// Goal: The goal is to follow the jumps until one leads outside the list.
public func findSteps(queue: DispatchQueue = DispatchQueue.global(), isSecondPart: Bool = false, completion: @escaping ([Int],Int) -> ()) {
    
    let semaphore = DispatchSemaphore(value: 1)
    queue.async {
        var values = loadTextFromFile(isSampleFile: false)
        var position = 0
        var steps = 0
        semaphore.wait()
        while position < values.count {
            let value = values[position]
            values[position] = isSecondPart ? (value >= 3 ? (value - 1) : (value + 1)) : (value + 1)
            position += value
            steps++
        }
        semaphore.signal()
        completion(values,steps)
    }
}

extension Int {
    postfix static func ++(value: inout Int) {
        value = value + 1
    }
}

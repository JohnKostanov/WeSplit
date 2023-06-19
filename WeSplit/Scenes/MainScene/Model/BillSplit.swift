//
//  BillSplit.swift
//  WeSplit
//
//  Created by Джон Костанов on 19/6/23.
//

import Foundation

protocol BillSplitable {
    var checkAmount: String { get }
    var numberOfPeople: Int { get }
    var currentPercentage: Int { get }
    var tipPercentages: [Int] { get }
}

struct BillSplit: BillSplitable {
    var checkAmount: String
    var numberOfPeople: Int
    var currentPercentage: Int
    let tipPercentages: [Int]
}

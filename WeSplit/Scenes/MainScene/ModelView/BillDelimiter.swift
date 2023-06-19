//
//  BillDelimiter.swift
//  WeSplit
//
//  Created by Джон Костанов on 19/6/23.
//

import Foundation

protocol Delimiter: AnyObject, ObservableObject {
    associatedtype Item: BillSplitable
    
    var billData: Item { get }
    
    func getTotalPerPerson() -> Double
}

class BillDelimiter: Delimiter {
    typealias Item = BillSplit
    
    @Published var billData: Item
    
    init() {
        self.billData = Item(checkAmount: "",
                             numberOfPeople: 2,
                             currentPercentage: 20,
                             tipPercentages: [10, 15, 20, 25, 0])
    }
    
    func getTotalPerPerson() -> Double {
        let peopleCount = Double(billData.numberOfPeople + 2)
        let tipSelection = Double(billData.currentPercentage)
        let orderAmount = Double(billData.checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
}

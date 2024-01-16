//
//  BillSplitView.swift
//  WeSplit
//
//  Created by Джон Костанов on 19/6/23.
//

import SwiftUI

struct BillSplitView: View {
    
    @StateObject var billDelimiter = BillDelimiter()
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", text: $billDelimiter.billData.checkAmount)
                        .focused($amountIsFocused)
                        .keyboardType(.decimalPad)

                    Picker("Number of people", selection: $billDelimiter.billData.numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $billDelimiter.billData.currentPercentage) {
                        ForEach(billDelimiter.billData.tipPercentages, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(billDelimiter.getTotalPerPerson(), specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct BillSplitView_Previews: PreviewProvider {
    static var previews: some View {
        BillSplitView()
    }
}

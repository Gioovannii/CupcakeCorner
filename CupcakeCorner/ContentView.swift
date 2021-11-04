//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Giovanni Gaffé on 2021/11/3.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: 3...20, step: 1) {
                        HStack {
                            Text("How many cupcakes ?")
                            Spacer()
                            Text("\(order.quantity)")
                        }
                    }
                }
                
                Section {
                    Button("Order") {
                        // Code to order
                    }
                    .disabled(order.order)
                }
            }
            .navigationBarTitle("Order form ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

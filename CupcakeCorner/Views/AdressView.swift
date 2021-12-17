//
//  AdressView.swift
//  CupcakeCorner
//
//  Created by Giovanni Gaffé on 2021/11/4.
//

import SwiftUI

// TODO: - Challenge

// 1. Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.
struct AdressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Adress", text: $order.streetAdress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                        .foregroundColor(Color.accentColor)
                }
            }
            .disabled(order.hasValidAdress == false)
            
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AdressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AdressView(order: Order())
                .preferredColorScheme(.dark)
        }
    }
}

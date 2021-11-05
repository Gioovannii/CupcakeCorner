//
//  AdressView.swift
//  CupcakeCorner
//
//  Created by Giovanni Gaffé on 2021/11/4.
//

import SwiftUI

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
            
            
    }
}

struct AdressView_Previews: PreviewProvider {
    static var previews: some View {
        AdressView(order: Order())
    }
}

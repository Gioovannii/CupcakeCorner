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
        Text("Hello, World!")
    }
}

struct AdressView_Previews: PreviewProvider {
    static var previews: some View {
        AdressView(order: Order())
    }
}

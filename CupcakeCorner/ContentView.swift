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
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

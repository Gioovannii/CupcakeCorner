//
//  Response.swift
//  CupcakeCorner
//
//  Created by Giovanni Gaffé on 2021/11/3.
//

import SwiftUI

struct ResponseRepresentable: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}



struct Response: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct Response_Previews: PreviewProvider {
    static var previews: some View {
        Response()
    }
}

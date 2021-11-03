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
    @State var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text("\(item.trackName)")
                    .font(.headline)
                
                Text(item.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
        }.resume()
    }
}

struct Response_Previews: PreviewProvider {
    static var previews: some View {
        Response()
    }
}

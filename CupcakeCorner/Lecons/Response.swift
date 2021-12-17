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
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=son") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(ResponseRepresentable.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Fetch failed \(error.localizedDescription)")
        }
    }
}

struct Response_Previews: PreviewProvider {
    static var previews: some View {
        Response()
            .preferredColorScheme(.dark)
    }
}

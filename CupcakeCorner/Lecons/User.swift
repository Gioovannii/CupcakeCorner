//
//  User.swift
//  CupcakeCorner
//
//  Created by Giovanni Gaffé on 2021/11/3.
//

import SwiftUI

class User: Codable, ObservableObject {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Giovanni Gaffé"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct UserView: View {
    var body: some View {
        Text("Hello world")
            .padding()
    }
}

struct User_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}

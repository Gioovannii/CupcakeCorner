//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Giovanni Gaffé on 2021/11/4.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var alertMessage = ""
    @State private var showingConfirmation = false
    @State private var showingAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .accessibilityHidden(true)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is  : \(order.cost, specifier: "%.2f") $")
                    .font(.title)
                
                Button("Place order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert("Thank you", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Oups", isPresented: $showingAlert) {
            Button("OK") {}
        } message: {
            Text(alertMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            showingAlert = true
            alertMessage = "Failed to encode"
            print("Failed to encode order")
            return
        }
        
        guard let url = URL(string: "https://reqres.in/api/cupcakes") else {
            showingAlert = true
            alertMessage = "Bad url"
            print("Bad URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            self.showingConfirmation = true
        } catch {
            print("Checkout Failed: \(error.localizedDescription)")
            showingAlert = true
            alertMessage = "An error occurs please try again later"
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(order: Order())
        }
        .preferredColorScheme(.dark)
    }
}

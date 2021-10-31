//
//  CheckOut.swift
//  downloading data from internet (iOS)
//
//  Created by vojta on 15.02.2021.
//
import Alamofire
import SwiftUI

struct CheckOut: View {
    @EnvironmentObject var order: Order
    
    @State var message = ""
    @State var showingOrderAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {

        GeometryReader { geo in
            
                VStack{
                    Image(Order.types[order.type])
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .frame(width: geo.size.width - 10)
                        .padding(5)
                        
                
                    Text("Your order costs \(order.price)Kč")
                        .padding()
                        
                        
                    Button(action: {
                        self.checkedOut()
                    }, label: {
                        Text("Check out")
                })
                    .padding()
                    
                    Spacer()
            }
                
                .alert(isPresented: $showingOrderAlert, content: {
                    Alert(title: Text("We are coming to you!!"), message: Text(message), dismissButton: .default(Text("OK"), action: {
                        
                    }))
            })
        
        }
    
    }
    
    func checkedOut() {
        guard let encoded = try? JSONEncoder().encode(order) else{
            print("canot encode order")
            return
        }
        let urlString = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: urlString)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = encoded
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request){data, response, error in
            
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                    return
            }
            if let decoded = try? JSONDecoder().decode(Order.self, from: data) {
                self.message = "Your \(Order.types[decoded.type]) will be at your place in \(decoded.quantity * 5 + 10) minutes"
                self.showingOrderAlert = true
            }else{
                print("invalid response from server")
            }
            
        }.resume()
        
    }
}

struct CheckOut_Previews: PreviewProvider {
    static var previews: some View {
        CheckOut()
            .environmentObject(Order())
            
    }
}

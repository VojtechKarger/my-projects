//
//  Adress.swift
//  downloading data from internet (iOS)
//
//  Created by vojta on 15.02.2021.
//

import SwiftUI

struct Adress: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        Form{
            Section(header: Text("your adress")) {
                TextField("name", text: $order.name)
                TextField("street", text: $order.street)
                TextField("city", text: $order.city)
                TextField("zip", text: $order.zip)
                    .keyboardType(.numberPad)
            }
            Section {
                NavigationLink(
                    destination: CheckOut(),
                    label: {
                        Text("Navigate")
                })
            }.disabled(order.isValid)
            .navigationBarTitle("Adress", displayMode: .inline)
        }.onAppear(perform: {
            print(order.desertsNumber)
        })
    }
}

struct Adress_Previews: PreviewProvider {
    static var previews: some View {
        Adress()
            .environmentObject(Order())
    }
}

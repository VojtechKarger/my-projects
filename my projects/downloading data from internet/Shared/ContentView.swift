//
//  ContentView.swift
//  Shared
//
//  Created by vojta on 15.02.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        
        Form{
            Section(header: Text("jídlo")) {
                Picker(selection: $order.type, label: Text("Picker"), content: {
                    ForEach(0..<Order.types.count){
                        Text("\(Order.types[$0])")
                    }
                }).labelsHidden()
                .pickerStyle(WheelPickerStyle())
                Stepper("\(Order.types[order.type]): \(order.quantity)",value: $order.quantity, in: 1...20)
            }
            Section(header: Text("Deserty")){
                Toggle(isOn: $order.desert.animation(), label: {
                    Text("Desert")
                })
                if order.desert {
                    Picker(selection: $order.desertsNumber, label: Text(" \(Order.deserts[order.desertsNumber])"), content: {
                                ForEach(0..<Order.deserts.count){
                                    Text("\(Order.deserts[$0])")
                                }
                    })
                        
                    }
            }
            
            NavigationLink(
                destination: Adress(),
                label: {
                    Text("Adress")
                })
        
            
            
        }.navigationTitle("Your order")
    }
    


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Order())
    }
}

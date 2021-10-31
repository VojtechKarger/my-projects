//
//  downloading_data_from_internetApp.swift
//  Shared
//
//  Created by vojta on 15.02.2021.
//

import SwiftUI

@main
struct downloading_data_from_internetApp: App {
    
    var order = Order()
    var arrayOfOrder = [Order]()
    
    var body: some Scene {
        WindowGroup {
            TabView{
                MainScreen()
                    .tabItem {
                        Text("Main")
                        Image(systemName: "house")
                    }
                QRCode()
                    .tabItem {
                        Text("QRCode")
                        Image(systemName: "qrcode")
                    }
            }.environmentObject(order)
           
            
        }
    }
}

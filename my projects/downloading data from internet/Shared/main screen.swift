//
//  main screen.swift
//  downloading data from internet (iOS)
//
//  Created by vojta on 16.02.2021.
//

import SwiftUI

struct MainScreen: View {
    
    
    var body: some View {
        NavigationView {
            List{
                NavigationLink(
                    destination: ContentView(),
                    label: {
                        Text("Order your meal")
                    })
                
            }
            
            .navigationTitle("Main")
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            
    }
}

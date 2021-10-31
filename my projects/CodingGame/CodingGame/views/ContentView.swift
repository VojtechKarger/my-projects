//
//  ContentView.swift
//  CodingGame
//
//  Created by vojta on 16.09.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        ZStack{
            Color.antiprimary.ignoresSafeArea()
            VStack{
                HStack{
                    Text("Code!")
                        .font(.title)
                        .padding([.top,.leading])
                    Spacer()
                    Button(action: run, label: { Text("run") })
                        .padding(.trailing)
                        .padding(.top,7)
                }
                DisclosureGroup("output: ", isExpanded: $viewModel.expanded) {
                    if viewModel.loading {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(maxWidth: .infinity, minHeight: 100)
                    }else{
                    Text(viewModel.output ?? viewModel.error ?? "run your code to see the output")
                        .foregroundColor(viewModel.error == nil ? .teal : .orange)
                        .frame(maxWidth: .infinity, minHeight: 100)
                    }
                }
                .padding()
                ScrollView{
                    MultilineTextField("Type your code here", text: $viewModel.text) {
                        print("commit")
                    }
                    .accentColor(.primary.opacity(0.7))
                }
            }
            .accentColor(.primary)
        }
    }
    func run() {
        viewModel.loading.toggle()
        viewModel.error = nil
        viewModel.output = nil
        UIApplication.shared.endEditing()
        viewModel.runCompileing()
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

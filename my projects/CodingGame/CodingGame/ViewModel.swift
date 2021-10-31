//
//  ViewModel.swift
//  ViewModel
//
//  Created by vojta on 18.09.2021.
//

import Combine
import Foundation


class ViewModel: ObservableObject {
    @Published var text = "import Foundation \n\nprint(\"hello world\")"
    @Published var output: String? = nil
    @Published var error: String? = nil
    @Published var loading = false
    @Published var expanded = false
    func runCompileing() {
        expanded = true
        Task{
            do{
                try await compile()
                
            }catch {
                self.error = error.localizedDescription
            }
            DispatchQueue.main.async {
                self.loading.toggle()
            }
        }
    }
    
    func compile() async throws {
        
        var urlRequest = URLRequest(url: URL(string: "https://swiftfiddle.com/runner/5.4.3/run")!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try JSONEncoder().encode(Request(code: text.replaceBadQuotes()))
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        print("running...")
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoded = try JSONDecoder().decode(Response.self, from: data)
        
        print(decoded, "succesfull request")
        if decoded.errors != "" {
            DispatchQueue.main.async {
                self.error = decoded.errors
            }
        }
        
        if decoded.output != "" {
            DispatchQueue.main.async {
                self.output = decoded.output
            }
        }
    }
}

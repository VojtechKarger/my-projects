//
//  Orders.swift
//  downloading data from internet (iOS)
//
//  Created by vojta on 26.02.2021.
//

import Foundation

class Orders: ObservableObject{
    enum CodingKeys: CodingKey {
        case orders
    }
    
    @Published var orders: [Order]
    
    init() {
        self.orders = [Order]()
    }
 
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        orders = try container.decode([Order].self, forKey: .orders)
//    }
//    func encode(to encoder: Encoder) throws {
//        var container =  encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(orders, forKey: .orders)
//    }


}

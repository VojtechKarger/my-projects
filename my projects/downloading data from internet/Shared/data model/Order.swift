//
//  Order.swift
//  downloading data from internet (iOS)
//
//  Created by vojta on 15.02.2021.
//

import Foundation

class Order: ObservableObject, Codable {
    
    enum CodingKeys: CodingKey {
        case type, quantity, desertsNumber, streer, city, zip, desert
    }
    
    static let types = ["Fries", "Pizza", "Hamburger" ]
    @Published var type = 0
    @Published var quantity = 1
    
    
    // - MARK: @Published var delivered = false  -
    
    
    @Published var desert = false{
        didSet{
            if desert == false {
                desertsNumber = 0
            }
        }
    }
    static let deserts = ["","Icecream", "Cupcake", "Cake"]
    @Published var desertsNumber: Int = 0
    
    @Published var name = ""
    @Published var street = ""
    @Published var city = ""
    @Published var zip = ""
    var isValid: Bool{
        if name.isEmpty  ||  street.isEmpty ||  city.isEmpty ||  zip.isEmpty {
            return true
        }
        return false
    }
    var price: Int {
        if desert == false{
            return quantity * 120
        }else{
            return quantity * 120 + 75
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        desert = try container.decode(Bool.self, forKey: .desert)
        desertsNumber = try container.decode(Int.self, forKey: .desertsNumber)
        street = try container.decode(String.self, forKey: .streer)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    init() { }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(desertsNumber, forKey: .desertsNumber)
        try container.encode(street, forKey: .streer)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
        try container.encode(desert, forKey: .desert)
        
    }
    
}

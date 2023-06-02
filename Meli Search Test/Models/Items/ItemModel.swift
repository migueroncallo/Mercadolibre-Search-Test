//
//  ItemModel.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import Foundation

struct ResultItem: Codable, Equatable, Identifiable {
    static func == (lhs: ResultItem, rhs: ResultItem) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.price == rhs.price &&
        lhs.soldQuantity == rhs.soldQuantity &&
        lhs.availableQuantity == rhs.availableQuantity
    }
    
    
    let id, title: String
    let condition: Condition
    let categoryID: String
    let thumbnail: String
    let price: Double
    let soldQuantity, availableQuantity: Int
    let acceptsMercadopago: Bool
    let shipping: Shipping
    let seller: Seller
    let attributes: [Attribute]
    
    enum CodingKeys: String, CodingKey {
        case id, title, condition
        case categoryID = "category_id"
        case thumbnail
        case price
        case soldQuantity = "sold_quantity"
        case availableQuantity = "available_quantity"
        case acceptsMercadopago = "accepts_mercadopago"
        case shipping
        case seller
        case attributes
    }
}

enum Condition: String, Codable {
    case new = "new"
    case used = "used"
}

struct Shipping: Codable {
    let storePickUp, freeShipping: Bool
    
    enum CodingKeys: String, CodingKey {
        case storePickUp = "store_pick_up"
        case freeShipping = "free_shipping"
    }
}

struct Seller: Codable {
    let id: Int
    let nickname: String
    
    
    enum CodingKeys: String, CodingKey {
        case id, nickname
    }
}

struct Attribute: Codable, Identifiable, Equatable {
    var id: Int = Int.random(in: 1..<100)
    let name: String
    let valueName: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case valueName = "value_name"
    }
    
    static func == (lhs: Attribute, rhs: Attribute) -> Bool {
        return lhs.name == rhs.name &&
        lhs.valueName == rhs.valueName
    }
    
}


//MARK: Mock Data

extension ResultItem {
    static let mock = Self(
        id: "1",
        title: "title",
        condition: Condition(rawValue: "new")!,
        categoryID: "categoryId",
        thumbnail: "thumbnail",
        price: 10.0,
        soldQuantity: 1,
        availableQuantity: 1,
        acceptsMercadopago: true,
        shipping: Shipping(storePickUp: true,
                           freeShipping: true),
        seller: Seller(id: 1,
                       nickname: "nickname"),
        attributes: [Attribute(name: "name1",
                               valueName: "value1"),
                     Attribute(name: "name2",
                               valueName: "value2"),
                     Attribute(name: "name3",
                               valueName: "value3"),
                     Attribute(name: "name4",
                               valueName: "value4")])
}

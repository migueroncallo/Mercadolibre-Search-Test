//
//  SearchResultModel.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import Foundation

struct SearchResultModel: Codable, Equatable {
    static func == (lhs: SearchResultModel, rhs: SearchResultModel) -> Bool {
        return lhs.results == rhs.results
    }
    
    let results: [ResultItem]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

extension SearchResultModel {
    static let mock = Self(results: [ResultItem(id: "1",
                                                title: "title1",
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
                                                attributes: []),
                                     ResultItem(id: "2",
                                                title: "title2",
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
                                                attributes: []),
                                     ResultItem(id: "3",
                                                title: "title3",
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
                                                attributes: [])
                                     
    ])
}

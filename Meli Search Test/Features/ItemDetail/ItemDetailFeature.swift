//
//  ItemDetailFeature.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import Foundation
import ComposableArchitecture

struct ItemDetailFeature: ReducerProtocol {
    struct ItemDetailFeatureState: Equatable {
        var item: ResultItem = ResultItem(id: "",
                                          title: "",
                                          condition: .new,
                                          categoryID: "",
                                          thumbnail: "",
                                          price: 0,
                                          soldQuantity: 0,
                                          availableQuantity: 0,
                                          acceptsMercadopago: false,
                                          shipping: Shipping(storePickUp: false,
                                                             freeShipping: false),
                                          seller: Seller(id: 0,
                                                         nickname: ""),
                                          attributes: [])
    }
    
    enum ItemDetailFeatureAction: Equatable {
    }
    
    func reduce(into state: inout ItemDetailFeatureState, action: ItemDetailFeatureAction) -> EffectTask<ItemDetailFeatureAction> {
        
    }
}

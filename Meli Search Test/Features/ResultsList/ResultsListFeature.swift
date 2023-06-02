//
//  ResultsListFeature.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import Foundation
import ComposableArchitecture
import Combine

struct ResultsListFeature: ReducerProtocol {
    struct ResultsListState: Equatable {
        static func == (lhs: ResultsListFeature.ResultsListState, rhs: ResultsListFeature.ResultsListState) -> Bool {
            return lhs.query == rhs.query &&
            lhs.resultItems == rhs.resultItems
        }
        
        var query: String = ""
        var resultItems: [ResultItem] = []
    }
    
    enum ResultsListAction: Equatable {
        case itemSelected(ResultItem)
    }
    
    func reduce(into state: inout ResultsListState, action: ResultsListAction) -> EffectTask<ResultsListAction> {
        .none
    }
}

//
//  Path.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import Foundation
import ComposableArchitecture

//Paths

struct Path: ReducerProtocol {
    enum PathState: Equatable {
        case resultsListScreen(ResultsListFeature.ResultsListState = .init())
        case resultItemDetailScreen(ItemDetailFeature.ItemDetailFeatureState = .init())
    }
    
    enum PathAction: Equatable {
        case resultsListScreen(ResultsListFeature.ResultsListAction)
        case resultItemDetailScreen(ItemDetailFeature.ItemDetailFeatureAction)
    }
    
    var body: some ReducerProtocol<PathState, PathAction> {
        Scope(state: /PathState.resultsListScreen,
              action: /PathAction.resultsListScreen) {
            ResultsListFeature()
        }
        
        Scope(state: /PathState.resultItemDetailScreen,
              action: /PathAction.resultItemDetailScreen) {
            ItemDetailFeature()
        }
    }
}

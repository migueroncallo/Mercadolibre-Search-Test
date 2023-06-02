//
//  SearchItemsFeature.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 30/05/23.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct SearchItemsFeature: ReducerProtocol {
    struct SearchItemsSate: Equatable {
        @BindingState var query: String = ""
        var alert: AlertState<Action>?
        var path = StackState<Path.PathState>()
        @BindingState var isLoading: Bool = false
    }
    
    enum SearchItemsAction: BindableAction, Equatable {
        case binding(BindingAction<SearchItemsSate>)
        case searchButtonTapped
        case path(StackAction<Path.PathState, Path.PathAction>)
        case goBackToScreen(id: StackElementID)
        case alertDismissed
        case dataLoaded(TaskResult<SearchResultModel>)
    }
    
    @Dependency(\.searchClient) var searchClient
    
    var body: some ReducerProtocol<SearchItemsSate, SearchItemsAction> {
        BindingReducer()
        
        Reduce{ state, action in
            switch action {
            case .binding:
                state.path.removeAll()
                return .none
                
            case .searchButtonTapped:
                if state.query.isEmpty {
                    state.alert = AlertState {
                      TextState("¡Alerta!")
                    } actions: {
                      ButtonState(role: .cancel) {
                        TextState("Ok")
                      }
                    } message: {
                      TextState("Para realizar la búsqueda debes agregar un término")
                    }
                } else {
                    state.isLoading = true
                    return .task { [query = state.query] in
                        await .dataLoaded(.init { try await self.searchClient.search(query) })
                    }
                }
                
                return .none
                
            case let .goBackToScreen(id):
                state.path.pop(to: id)
                return .none
                
            case .alertDismissed:
              state.alert = nil
              return .none
                
            case .dataLoaded(let result):
                state.isLoading = false
                switch result {
                case .success(let result):
                    state.path.append(.resultsListScreen(.init(query: state.query, resultItems: result.results)))
                case .failure:
                    break
                }
                return .none
                
            case let .path(action):
                switch action {
                case .element(id: _, action: .resultsListScreen(.itemSelected(let item))):
                    
                    state.path.append(.resultItemDetailScreen(.init(item: item)))
                    return .none
                    
                default:
                    return .none
                }
            }
        }.forEach(\.path, action: /Action.path) {
            Path()
          }
    }
}

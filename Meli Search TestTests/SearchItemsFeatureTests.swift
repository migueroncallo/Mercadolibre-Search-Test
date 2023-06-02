//
//  SearchItemsFeatureTests.swift
//  Meli Search TestTests
//
//  Created by Wow Wedding Photography on 1/06/23.
//

import XCTest
import ComposableArchitecture

@testable import Meli_Search_Test

@MainActor
final class SearchItemsFeatureTests: XCTestCase {
    func testBinding() async {
        let store = TestStore(initialState: SearchItemsFeature.SearchItemsSate()) {
            SearchItemsFeature()
        }
        await store.send(.set(\.$query, "test")) {
            $0.query = "test"
        }
    }
    
    func testSearchButtonTappedAlert() async {
        let store = TestStore(initialState: SearchItemsFeature.SearchItemsSate()) {
            SearchItemsFeature()
        }
        
        await store.send(.searchButtonTapped) {
            $0.alert = AlertState {
                TextState("¡Alerta!")
            } actions: {
                ButtonState(role: .cancel) {
                    TextState("Ok")
                }
            } message: {
                TextState("Para realizar la búsqueda debes agregar un término")
            }
        }
        
        await store.send(.alertDismissed) {
            $0.alert = nil
        }
    }
    
    func testSearchbuttonTappedQuery() async {
        let store = TestStore(initialState: SearchItemsFeature.SearchItemsSate()) {
            SearchItemsFeature()
        } withDependencies: {
            $0.searchClient.search = {
                _ in SearchResultModel(results: [])
            }
        }
        
        await store.send(.set(\.$query, "test")) {
            $0.query = "test"
        }
        
        await store.send(.searchButtonTapped) {
            $0.isLoading = true
        }
        
        await store.receive(.dataLoaded(.success(SearchResultModel(results: [])))) {
            var stackState = StackState<Path.PathState>()
            stackState[id: 0] = Path.PathState.resultsListScreen(
                ResultsListFeature.ResultsListState(
                  query: "test",
                  resultItems: [])
              )
            
            $0.path = stackState
            $0.isLoading = false
        }
    }
    
    func testDataLoadedEvent() async {
        let store = TestStore(initialState: SearchItemsFeature.SearchItemsSate()) {
            SearchItemsFeature()
        } withDependencies: {
            $0.searchClient.search = {
                _ in .mock
            }
        }
        
        await store.send(.dataLoaded(.success(.mock))) {
            
            var stackState = StackState<Path.PathState>()
            stackState[id: 0] = Path.PathState.resultsListScreen(
                ResultsListFeature.ResultsListState(
                  query: "",
                  resultItems: SearchResultModel.mock.results)
              )
            $0.path = stackState
        }
    }
}

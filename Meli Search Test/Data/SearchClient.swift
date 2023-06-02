//
//  SearchClient.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import Foundation
import ComposableArchitecture
import XCTestDynamicOverlay

struct SearchClient {
    var search: @Sendable (String) async throws -> SearchResultModel
}

extension DependencyValues {
    var searchClient: SearchClient {
        get { self[SearchClient.self] }
        set { self[SearchClient.self] = newValue }
    }
}

extension SearchClient: DependencyKey {
    static let liveValue = Self(
        search: { query in
            guard let curatedQuery =  query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url =  URL(string: "https://api.mercadolibre.com/sites/MLA/search?q=\(String(describing: curatedQuery))") else {
                fatalError("invalid url")
            }
            let (data, _) = try await URLSession.shared
                .data(from: url)
            let result = try JSONDecoder().decode(SearchResultModel.self, from: data)
            return result
        }
    )
}

extension SearchClient: TestDependencyKey {
    static let previewValue = Self(
        search: { _ in .mock }
    )
    
    static let testValue = Self(
        search: unimplemented("\(Self.self).search")
    )
}


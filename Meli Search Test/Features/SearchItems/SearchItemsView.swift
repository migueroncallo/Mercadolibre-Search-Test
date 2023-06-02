//
//  SearchItemsView.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 30/05/23.
//

import SwiftUI
import ComposableArchitecture

struct SearchItemsView: View {
    let store: StoreOf<SearchItemsFeature>
    
    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: SearchItemsFeature.SearchItemsAction.path)) {
            WithViewStore(self.store, observe: \.isLoading) { viewStore in
                if viewStore.state {
                    LoadingView()
                } else {
                    HStack {
                        Spacer()
                        VStack {
                            
                            Spacer()
                            
                            Text("¡Encuentra lo que buscas!")
                                .font(.title)
                                .multilineTextAlignment(.leading)
                            
                            TextField("Buscar", text: ViewStore(self.store).binding(\.$query))
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal, 20)
                            
                            Spacer()
                                .frame(height: 20)
                            
                            HStack {
                                Spacer()
                                    .frame(width: 50)
                                Text("Buscar")
                                    .foregroundColor(.white)
                                Spacer()
                                    .frame(width: 50)
                            }
                            .padding(10)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .onTapGesture {
                                ViewStore(self.store.stateless).send(.searchButtonTapped)
                            }
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                    }
                    .background(Color.yellow)
                    .alert(
                        self.store.scope(state: \.alert, action: { $0 }),
                        dismiss: .alertDismissed
                    )
                }
            }
            
        } destination: {
            switch $0 {
            case .resultsListScreen:
                CaseLet(state: /Path.PathState.resultsListScreen,
                        action: Path.PathAction.resultsListScreen,
                        then: ResultsListView.init(store:))
            case .resultItemDetailScreen:
                CaseLet(state: /Path.PathState.resultItemDetailScreen,
                        action: Path.PathAction.resultItemDetailScreen,
                        then: ItemDetailView.init(store:)
                )
            }
        }
    }
}

struct SearchItemsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemsView(store: Store(initialState: SearchItemsFeature.State(),
                                     reducer: SearchItemsFeature()))
    }
}

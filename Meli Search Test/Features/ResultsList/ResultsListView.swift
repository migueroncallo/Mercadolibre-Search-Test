//
//  ResultsListView.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import SwiftUI
import ComposableArchitecture

struct ResultsListView: View {
    let store: StoreOf<ResultsListFeature>
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            
            GeometryReader { _ in
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Text("Resultados para")
                            .padding(.trailing, 5)
                            .padding(.leading, 10)
                        Text(viewStore.query)
                            .fontWeight(.bold)
                        Text(":")
                            .padding(.leading, 0)
                        Spacer()
                    }
                    
                    if viewStore.resultItems.count > 0 {
                        ScrollView (.vertical){
                            
                            Spacer()
                            
                            
                            
                            Spacer()
                                .frame(height: 10)
                            
                            ForEach(viewStore.resultItems) { item in
                                ResultItemView(item: item)
                                    .onTapGesture {
                                        viewStore.send(.itemSelected(item))
                                    }
                                Divider()
                            }
                        }
                    } else {
                        VStack {
                            Spacer()
                            
                            Image("no-results")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            
                            Text("La búsqueda no arrojó resultados, intenta buscar otra cosa")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                    }
                }
                
            }
        }.navigationTitle("Ítems")
    }
}


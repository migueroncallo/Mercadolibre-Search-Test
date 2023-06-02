//
//  ItemDetailView.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import SwiftUI
import ComposableArchitecture

struct ItemDetailView: View {
    let store: StoreOf<ItemDetailFeature>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView(.vertical) {
                HStack(spacing: 0) {
                    Spacer()
                    VStack {
                        Spacer()
                            .frame(height: 80)
                        OnlineImage(urlString: viewStore.item.thumbnail, size: 200)
                            .frame(height: 200)
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(viewStore.item.title)
                                    .font(.title2)
                                Text(viewStore.item.price.toCurrency())
                                
                                if viewStore.item.shipping.freeShipping {
                                    Text("Envío gratis")
                                        .font(.system(size: 12))
                                        .fontWeight(.medium)
                                        .foregroundColor(.green)
                                }
                            }.padding(.leading, 10)
                        
                            Spacer()
                                .frame(width: 8)
                        }
                        
                        Spacer()
                            .frame(height: 10)
                    }
                    Spacer()
                }.background(Color.white)
                    .padding(.horizontal, 0)
                
                List {
                    Section(header: Text("Información del Prodcuto")) {
                        ForEach(viewStore.item.attributes) {
                            attribute in
                            
                            HStack {
                                Text(attribute.name)
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                                Spacer()
                                
                                Text(attribute.valueName ?? "")
                                    .font(.system(size: 12))
                                Spacer()
                                    .frame(width: 1)
                            }
                        }
                    }
                }
                .frame(height: CGFloat(viewStore.item.attributes.count) * 55)
                .scrollDisabled(true)
            }.background(Color(red: 242/255, green: 242/255, blue: 247/255))
                .padding(.top, -100)
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(store:
                        Store(initialState: ItemDetailFeature
                            .ItemDetailFeatureState(item: ResultItem(id: "1", title: "Cámara De Video Gopro Hero11 Black Negro", condition: .new, categoryID: "1", thumbnail: "https://http2.mlstatic.com/D_NQ_NP_2X_962003-MLU54978359278_042023-F.webp", price: 1727.0, soldQuantity: 1, availableQuantity: 1, acceptsMercadopago: true, shipping: Shipping(storePickUp: true, freeShipping: true), seller: Seller(id: 100, nickname: "Seller"), attributes: [Attribute(name: "Nombre", valueName: "Valor"), Attribute(name: "Nombre", valueName: "Valor"), Attribute(name: "Nombre", valueName: "Valor"), Attribute(name: "Nombre", valueName: "Valor")])), reducer: {
                                ItemDetailFeature()
                            }))
    }
}

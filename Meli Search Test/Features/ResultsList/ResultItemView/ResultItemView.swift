//
//  ResultItemView.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import SwiftUI

struct ResultItemView: View {
    let item: ResultItem
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 8)
            OnlineImage(urlString: item.thumbnail, size: 80)
            
            Divider()
                .padding(.horizontal, 8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.subheadline)
                
                Text(item.price.toCurrency())
                    .fontWeight(.medium)
                
                if item.shipping.freeShipping {
                    Spacer()
                        .frame(height: 5)
                    
                    Text("Envío gratis")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(.green)
                }
            }
            
            Spacer()
        }.padding(.horizontal, 10)
    }
}

struct ResultItemView_Previews: PreviewProvider {
    static var previews: some View {
        ResultItemView(item:
                        ResultItem(id: "1", title: "Nonisec Apósito Refuerza Pañal Maxi Descartable X 20u", condition: .new, categoryID: "1", thumbnail: "http://http2.mlstatic.com/D_782551-MLA47073869857_082021-I.jpg", price: 1727.0, soldQuantity: 1, availableQuantity: 1, acceptsMercadopago: true, shipping: Shipping(storePickUp: true, freeShipping: true), seller: Seller(id: 100, nickname: "Seller"), attributes: []))
        .previewLayout(.fixed(width: 400, height: 150))
    }
}

//
//  OnlineImage.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import SwiftUI
import Kingfisher

struct OnlineImage: View {
    
    let urlString: String
    let size: CGFloat
    
    private var scale: CGFloat {
        UIScreen.main.scale
    }
    
    var body: some View {
        KFImage(URL(string: urlString))
            .placeholder {
                Image(systemName: "shippingbox")
                    .font(.largeTitle)
                    .opacity(0.3)
            }
            .resizable()
            .setProcessor(ResizingImageProcessor(referenceSize: CGSize(width: size * scale, height: size * scale), mode: .aspectFit))
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
    }
}

struct OnlineImage_Previews: PreviewProvider {
    static var previews: some View {
        OnlineImage(urlString: "http://http2.mlstatic.com/D_861644-MLA51774219309_092022-I.jpg", size: 80)
            .previewLayout(.fixed(width: 80, height: 80))
    }
}

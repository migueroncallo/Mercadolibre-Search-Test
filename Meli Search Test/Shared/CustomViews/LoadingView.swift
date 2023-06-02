//
//  LoadingView.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 31/05/23.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                if isLoading {
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(2.0, anchor: .center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white.opacity(0.8))
                    .edgesIgnoringSafeArea(.all)
                }
                
                Text("Loading...")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .onAppear {
            self.isLoading = true
        }
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

//
//  CoinDetailView.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 22.06.2022.
//

import SwiftUI

struct CoinDetailLoadingView: View {
    @Binding var coin: CoinModel?
    var body: some View {
        ZStack {
            if let coin = coin {
                CoinDetailView(coin: coin)
            }
        }
    }
}

struct CoinDetailView: View {
    @StateObject var viewModel: CoinDetailViewModel
    let coin: CoinModel
    init(coin: CoinModel) {
        self.coin = coin
        _viewModel = StateObject(wrappedValue: CoinDetailViewModel(coin: coin))
        print("Initializing Detail View For \(coin.name)")
    }
    var body: some View {
        Text("Hello")
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView(coin: dev.coin)
    }
}
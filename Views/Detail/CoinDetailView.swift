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
    @StateObject private var viewModel: CoinDetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30
    let coin: CoinModel
    init(coin: CoinModel) {
        self.coin = coin
        _viewModel = StateObject(wrappedValue: CoinDetailViewModel(coin: coin))
    }
    var body: some View {
        ScrollView {
            VStack {
                CoinChartView(coin: viewModel.coin)
                    .padding(.vertical)
                VStack(spacing: 20) {
                    overviewTitle
                    Divider()
                    overviewGrid
                    additionalTitle
                    Divider()
                    additionalGrid
                }
                .padding()
            }
            
        }
        .navigationTitle(viewModel.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
              navigationBarTrailingItems
            }
        }
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CoinDetailView(coin: dev.coin)

        }
    }
}

extension CoinDetailView {
    private var navigationBarTrailingItems: some View {
        HStack {
            HStack {
                Text(viewModel.coin.symbol.uppercased())
                    .font(.headline)
                    .foregroundColor(Color.theme.secondaryText)
                CoinImageView(coin: viewModel.coin)
                    .frame(width: 25, height: 25)
            }
        }
    }
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var additionalTitle: some View {
        
        Text("Additional Info")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var overviewGrid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, pinnedViews: []) {
            ForEach(viewModel.overviewStatistics) { stat in
                StatisticView(statisticModel: stat)
            }
        }
    }
    private var additionalGrid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, pinnedViews: []) {
            ForEach(viewModel.additionalStatistics) { stat in
                StatisticView(statisticModel: stat)
            }
        }
    }
}

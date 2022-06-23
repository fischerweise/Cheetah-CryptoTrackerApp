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
    @State private var showFullDescription: Bool = false
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
                    descriptionSection
                    overviewGrid
                    additionalTitle
                    Divider()
                    additionalGrid
                   websiteSection
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
    private var descriptionSection: some View {
        ZStack {
            if let coinDescription = viewModel.coinDescription, !coinDescription.isEmpty {
                VStack(alignment: .leading) {
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 8)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                    Button {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                        }
                    } label: {
                        Text(showFullDescription ? "Read Less..." : "Read More...")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    }
                    .accentColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }
        }
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
    private var websiteSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let website = viewModel.coinWebsite, let url = URL(string: website) {
                Link("Website", destination: url)
            }
            if let reddit = viewModel.coinRedditPage, let url = URL(string: reddit) {
                Link("Reddit", destination: url)
            }
        }
        .accentColor(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.headline)
    }
}

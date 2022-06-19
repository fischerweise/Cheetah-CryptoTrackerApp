//
//  PreviewProvider.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 18.06.2022.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    let homeViewModel = HomeViewModel()
    let stat1 = StatisticModel(title: "Market Cap", value: "$12.5 Bn", percentageChange: 25.34)
    let stat2 = StatisticModel(title: "Total Volume", value: "$1.25Tr")
    let stat3 = StatisticModel(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
        let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 19199.2,
        marketCap: 366659764276,
        marketCapRank: 1,
        fullyDilutedValuation: 403754878306,
        totalVolume: 27325312902,
        high24H: 20761,
        low24H: 18845.1,
        priceChange24H: -1344.6638066373016,
        priceChangePercentage24H: -6.54533,
        marketCapChange24H: -23746306240.508423,
        marketCapChangePercentage24H: -6.08246,
        circulatingSupply: 19070618,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 69045,
        athChangePercentage: -72.17053,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 28236.64314,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2021-12-08-000000000",
        sparklineIn7D: SparklineIn7D(price: [
        54019]),
        priceChangePercentage24HInCurrency: 3952, currentHoldings: 1.5)
}

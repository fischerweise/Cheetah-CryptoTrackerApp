//
//  MarketDataService.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 20.06.2022.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    init() {
        getData()
    }
    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            return
        }
        marketDataSubscription = NetworkManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}

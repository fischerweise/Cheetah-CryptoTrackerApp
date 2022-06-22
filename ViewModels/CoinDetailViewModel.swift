//
//  CoinDetailViewModel.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 22.06.2022.
//

import Foundation
import Combine

class CoinDetailViewModel: ObservableObject {
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    private func addSubscribers() {
        coinDetailService.$coinDetails.sink { (returnedCoinDetails) in
            print("Received")
            print(returnedCoinDetails)
        }
        .store(in: &cancellables)
    }
}

//
//  CoinImageService.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 19.06.2022.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    init(coin: CoinModel) {
        self.coin = coin
        getCoinsImage()
    }
    private func getCoinsImage() {
        guard let url = URL(string: coin.image) else {
            return
        }
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}

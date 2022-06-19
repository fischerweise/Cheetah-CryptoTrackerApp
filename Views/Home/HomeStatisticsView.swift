//
//  HomeStatisticsView.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 19.06.2022.
//

import SwiftUI

struct HomeStatisticsView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @Binding var showPortfolio: Bool
    var body: some View {
        HStack {
            ForEach(viewModel.statistics) { stat in
                StatisticView(statisticModel: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatisticsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeViewModel)
    }
}

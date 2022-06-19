//
//  StatisticView.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 19.06.2022.
//

import SwiftUI

struct StatisticView: View {
    let statisticModel: StatisticModel
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(statisticModel.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(statisticModel.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (statisticModel.percentageChange ?? 0) >= 0 ? 0 : 180))
                Text(statisticModel.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                .bold()
            }
            .foregroundColor((statisticModel.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(statisticModel.percentageChange == nil ? 0.0 : 1.0)
        }
        
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(statisticModel: dev.stat1)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            StatisticView(statisticModel: dev.stat2)
                .previewLayout(.sizeThatFits)
            StatisticView(statisticModel: dev.stat3)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        
    }
}

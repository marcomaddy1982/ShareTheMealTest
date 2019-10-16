//
//  CampaignsViewModel.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 14.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Foundation

enum CampaignsViewModel {
    case data([CampaignCellViewModel])
    case error
    case loading

    var isLoading: Bool {
        guard case .loading = self else { return false }
        return true
    }

    var isError: Bool {
        guard case .error = self else { return false }
        return true
    }
}

//
//  CampaignsClient.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 16.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Foundation
import Networking

protocol CampaignsClientProtocol {
    func getCampaigns(completion: @escaping (CampaignsViewModel) -> ())
}

class CampaignsClient: CampaignsClientProtocol {
    private let requestDispatcher = RequestDispatcher(environment: EnvironmentCreator.environment(for: .prod))

    func getCampaigns(completion: @escaping (CampaignsViewModel) -> ()) {
        CampaignsTask().execute(in: requestDispatcher) { result in
            switch result {
            case let .data(campaignsOverview):
                let campaignViewModels = campaignsOverview.items.compactMap {
                    CampaignCellViewModel(campaign: $0)
                }
                completion(.data(campaignViewModels))
            case .error:
                completion(.error)
            }
        }
    }
}

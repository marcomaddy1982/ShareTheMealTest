//
//  MockCampaignsClient.swift
//  ShareTheMealTestTests
//
//  Created by Marco Maddalena on 16.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

@testable import ShareTheMealTest

class MockCampaignsClient: CampaignsClientProtocol {
    func getCampaigns(completion: @escaping (CampaignsViewModel) -> ()) {
        let campaign = Campaign(imageUrl: "https://images.contentful.com/test.png",
                                htmlText: "<h2>Test HtmlText</h2>",
                                buttons: [])
        let campaignCellViewModels = [CampaignCellViewModel(campaign: campaign)]
        completion(.data(campaignCellViewModels))
    }
}

class MockCampaignsClientError: CampaignsClientProtocol {
    func getCampaigns(completion: @escaping (CampaignsViewModel) -> ()) {
        completion(.error)
    }
}

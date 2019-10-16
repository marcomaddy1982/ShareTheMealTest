//
//  MockCampaignsInteractor.swift
//  ShareTheMealTestTests
//
//  Created by Marco Maddalena on 16.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

@testable import ShareTheMealTest

class MockCampaignsInteractor: CampaignsInteractorProtocol {
    private(set) var isLoadContentsCalled = false
    private(set) var client: CampaignsClientProtocol

    init(client: CampaignsClientProtocol) {
        self.client = client
    }

    func loadContents() {
        self.isLoadContentsCalled = true
    }
}

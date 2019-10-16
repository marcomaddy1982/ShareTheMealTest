//
//  MockCampaignsView.swift
//  ShareTheMealTestTests
//
//  Created by Marco Maddalena on 16.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

@testable import ShareTheMealTest

class MockCampaignsView: CampaignsViewProtocol {
    private(set) var isRefreshCalled = false

    func refresh(with viewModel: CampaignsViewModel) {
        self.isRefreshCalled = true
    }
}

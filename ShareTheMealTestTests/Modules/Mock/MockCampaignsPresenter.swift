//
//  MockCampaignsPresenter.swift
//  ShareTheMealTestTests
//
//  Created by Marco Maddalena on 16.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

@testable import ShareTheMealTest

class MockCampaignsPresenter: CampaignsPresenterProtocol {
    private(set) var isRefreshSuccessCalled = false
    private(set) var isRefreshErrorCalled = false
    private(set) var isRefreshLoadingCalled = false

    func viewDidLoad() { }

    func refresh(with viewModel: CampaignsViewModel) {
        switch viewModel {
        case .error:
            self.isRefreshErrorCalled = true
        case .data:
            self.isRefreshSuccessCalled = true
        case .loading:
            self.isRefreshLoadingCalled = true
        }
    }

    func didTapDonate() { }

    func didTapRefresh() { }

    func didTapRetry() { }
}

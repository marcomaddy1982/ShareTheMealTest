//
//  CampaignsPresenterSpec.swift
//  ShareTheMealTestTests
//
//  Created by Marco Maddalena on 16.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Nimble
import Quick
@testable import ShareTheMealTest

class CampaignsPresenterSpec: QuickSpec {
    override func spec() {
        var view: MockCampaignsView?
        var router: CampaignsRouterProtocol?
        var presenter: CampaignsPresenter?

        beforeEach {
            view = MockCampaignsView()
            router = CampaignsRouter()
            presenter = CampaignsPresenter()
        }

        describe("campaignsPresenter") {
            context("load campaigns") {
                it("success") {
                    presenter?.viewController = view
                    presenter?.router = router
                    presenter?.refresh(with: .data([]))
                    expect(view?.isRefreshCalled).to(equal(true))
                }
            }
        }

        afterEach {
            view = nil
            router = nil
        }
    }
}

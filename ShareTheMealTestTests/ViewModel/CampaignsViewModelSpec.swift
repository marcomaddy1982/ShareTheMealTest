//
//  CampaignsViewModelSpec.swift
//  ShareTheMealTestTests
//
//  Created by Marco Maddalena on 16.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Nimble
import Quick
@testable import ShareTheMealTest

class CampaignsViewModelSpec: QuickSpec {

    override func spec() {
        describe("campaignsViewModel") {
            context("controller state") {
                it("isLoading") {
                    let isLoadingViewModel = CampaignsViewModel.loading
                    expect(isLoadingViewModel.isLoading).to(equal(true))
                    expect(isLoadingViewModel.isError).to(equal(false))
                }
            }

            context("controller state") {
                it("isError") {
                    let isErrorViewModel = CampaignsViewModel.error
                    expect(isErrorViewModel.isLoading).to(equal(false))
                    expect(isErrorViewModel.isError).to(equal(true))
                }
            }

            context("controller state") {
                it("valid data") {
                    let campaign = Campaign(imageUrl: "https://images.contentful.com/test.png",
                                            htmlText: "<h2>Test HtmlText</h2>",
                                            buttons: [])
                    let campaignCellViewModels = [CampaignCellViewModel(campaign: campaign)]
                    let hasDataViewModel = CampaignsViewModel.data(campaignCellViewModels)
                    expect(hasDataViewModel.isLoading).to(equal(false))
                    expect(hasDataViewModel.isError).to(equal(false))
                }
            }
        }
    }
}

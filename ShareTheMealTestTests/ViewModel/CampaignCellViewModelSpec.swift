//
//  CampaignCellViewModelSpec.swift
//  ShareTheMealTestTests
//
//  Created by Marco Maddalena on 16.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Nimble
import Quick
@testable import ShareTheMealTest

class CampaignCellViewModelSpec: QuickSpec {

    override func spec() {
        describe("campaignCellViewModel") {
            context("valid") {
                it("no buttons") {
                    let campaign = Campaign(imageUrl: "https://images.contentful.com/test.png",
                                            htmlText: "Test HtmlText",
                                            buttons: [])
                    let viewModel = CampaignCellViewModel(campaign: campaign)

                    expect(viewModel.imageUrl).notTo(beNil())
                    expect(viewModel.imageUrl?.absoluteString).to(equal("https://images.contentful.com/test.png"))
                    expect(viewModel.htmlText).notTo(beNil())
                    expect(viewModel.htmlText?.string).to(equal("Test HtmlText"))
                    expect(viewModel.buttons.count).to(equal(0))
                }
            }

            context("valid") {
                it("with buttons") {
                    let buttons = [Button(action: "donate", text: "Make a donation"),
                                   Button(action: "refresh", text: "Refresh")]
                    let campaign = Campaign(imageUrl: "https://images.contentful.com/test.png",
                                            htmlText: "Test HtmlText",
                                            buttons: buttons)
                    let viewModel = CampaignCellViewModel(campaign: campaign)

                    expect(viewModel.imageUrl).notTo(beNil())
                    expect(viewModel.imageUrl?.absoluteString).to(equal("https://images.contentful.com/test.png"))
                    expect(viewModel.htmlText).notTo(beNil())
                    expect(viewModel.htmlText?.string).to(equal("Test HtmlText"))
                    expect(viewModel.buttons.count).to(equal(2))

                    expect(viewModel.buttons[0].action).to(equal("donate"))
                    expect(viewModel.buttons[0].text).to(equal("Make a donation"))

                    expect(viewModel.buttons[1].action).to(equal("refresh"))
                    expect(viewModel.buttons[1].text).to(equal("Refresh"))
                }
            }
        }
    }
}

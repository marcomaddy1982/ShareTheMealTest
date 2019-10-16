//
//  ShareTheMealTestTests.swift
//  ShareTheMealTestTests
//
//  Created by Marco Maddalena on 14.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Nimble
import Quick
@testable import ShareTheMealTest

class CampaignsSpec: QuickSpec {

    override func spec() {

        let decoder: JSONDecoder = JSONDecoder()

        describe("decoding") {
            context("valid JSON") {
                it("succeeds") {
                    let campaignOverview = try? decoder.decode(CampaignOverview.self, from: Mock.valid)
                    expect(campaignOverview?.items.count).to(equal(8))
                }
            }

            context("all buttons campain valid JSON") {
                it("succeeds") {
                    let campaignOverview = try? decoder.decode(CampaignOverview.self, from: Mock.allButtons)
                    expect(campaignOverview?.items[0]).notTo(beNil())

                    let campaign = campaignOverview?.items[0]
                    expect(campaign?.imageUrl).to(equal("https://images.contentful.com/test.png"))
                    expect(campaign?.htmlText).to(equal("<h2>Test HtmlText</h2>"))
                    expect(campaign?.buttons.count).to(equal(3))

                    expect(campaign?.buttons[0].action).to(equal("donate"))
                    expect(campaign?.buttons[0].text).to(equal("Make a donation"))

                    expect(campaign?.buttons[1].action).to(equal("refresh"))
                    expect(campaign?.buttons[1].text).to(equal("Refresh"))

                    expect(campaign?.buttons[2].action).to(equal("facebook"))
                    expect(campaign?.buttons[2].text).to(equal("Open facebook"))
                }
            }

            context("no buttons campain valid JSON") {
                it("succeeds") {
                    let campaignOverview = try? decoder.decode(CampaignOverview.self, from: Mock.noButtons)
                    expect(campaignOverview?.items[0]).notTo(beNil())

                    let campaign = campaignOverview?.items[0]
                    expect(campaign?.imageUrl).to(equal("https://images.contentful.com/test.png"))
                    expect(campaign?.htmlText).to(equal("<h2>Test HtmlText</h2>"))
                    expect(campaign?.buttons.count).to(equal(0))
                }
            }

            context("donate campain valid JSON") {
                it("succeeds") {
                    let campaignOverview = try? decoder.decode(CampaignOverview.self, from: Mock.donateButton)
                    expect(campaignOverview?.items[0]).notTo(beNil())

                    let campaign = campaignOverview?.items[0]
                    expect(campaign?.imageUrl).to(equal("https://images.contentful.com/test.png"))
                    expect(campaign?.htmlText).to(equal("<h2>Test HtmlText</h2>"))
                    expect(campaign?.buttons.count).to(equal(1))

                    expect(campaign?.buttons[0].action).to(equal("donate"))
                    expect(campaign?.buttons[0].text).to(equal("Make a donation"))
                }
            }

            context("refresh campain valid JSON") {
                it("succeeds") {
                    let campaignOverview = try? decoder.decode(CampaignOverview.self, from: Mock.refreshButton)
                    expect(campaignOverview?.items[0]).notTo(beNil())

                    let campaign = campaignOverview?.items[0]
                    expect(campaign?.imageUrl).to(equal("https://images.contentful.com/test.png"))
                    expect(campaign?.htmlText).to(equal("<h2>Test HtmlText</h2>"))
                    expect(campaign?.buttons.count).to(equal(1))

                    expect(campaign?.buttons[0].action).to(equal("refresh"))
                    expect(campaign?.buttons[0].text).to(equal("Refresh"))
                }
            }

            context("donate campain valid JSON") {
                it("succeeds") {
                    let campaignOverview = try? decoder.decode(CampaignOverview.self, from: Mock.facebookButton)
                    expect(campaignOverview?.items[0]).notTo(beNil())

                    let campaign = campaignOverview?.items[0]
                    expect(campaign?.imageUrl).to(equal("https://images.contentful.com/test.png"))
                    expect(campaign?.htmlText).to(equal("<h2>Test HtmlText</h2>"))
                    expect(campaign?.buttons.count).to(equal(1))

                    expect(campaign?.buttons[0].action).to(equal("facebook"))
                    expect(campaign?.buttons[0].text).to(equal("Open facebook"))
                }
            }

            context("invalid JSON") {
                it("fails") {
                    let campaignOverview = try? decoder.decode(CampaignOverview.self, from: Mock.invalid)
                    expect(campaignOverview).to(beNil())
                }
            }
        }
    }
}

enum Mock {
    static var valid: Data {
        let mockJSONFile = Bundle(for: CampaignsSpec.self).path(forResource: "campainsMockPass", ofType: "json")!
        let mockJSONContent = try! String(contentsOfFile: mockJSONFile)
        return mockJSONContent.data(using: .utf8)!
    }

    static var allButtons: Data {
        let mockJSONFile = Bundle(for: CampaignsSpec.self).path(forResource: "campainsMockAllButtons", ofType: "json")!
        let mockJSONContent = try! String(contentsOfFile: mockJSONFile)
        return mockJSONContent.data(using: .utf8)!
    }

    static var noButtons: Data {
        let mockJSONFile = Bundle(for: CampaignsSpec.self).path(forResource: "campainsMockNoButtons", ofType: "json")!
        let mockJSONContent = try! String(contentsOfFile: mockJSONFile)
        return mockJSONContent.data(using: .utf8)!
    }

    static var donateButton: Data {
        let mockJSONFile = Bundle(for: CampaignsSpec.self).path(forResource: "campainsMockDonateButton", ofType: "json")!
        let mockJSONContent = try! String(contentsOfFile: mockJSONFile)
        return mockJSONContent.data(using: .utf8)!
    }

    static var refreshButton: Data {
        let mockJSONFile = Bundle(for: CampaignsSpec.self).path(forResource: "campainsMockRefreshButton", ofType: "json")!
        let mockJSONContent = try! String(contentsOfFile: mockJSONFile)
        return mockJSONContent.data(using: .utf8)!
    }

    static var facebookButton: Data {
        let mockJSONFile = Bundle(for: CampaignsSpec.self).path(forResource: "campainsMockFacebookButton", ofType: "json")!
        let mockJSONContent = try! String(contentsOfFile: mockJSONFile)
        return mockJSONContent.data(using: .utf8)!
    }

    static var invalid: Data {
        let mockJSONFile = Bundle(for: CampaignsSpec.self).path(forResource: "campainsMockFail", ofType: "json")!
        let mockJSONContent = try! String(contentsOfFile: mockJSONFile)
        return mockJSONContent.data(using: .utf8)!
    }
}

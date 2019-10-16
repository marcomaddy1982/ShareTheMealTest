//
//  CampaignsInteractorSpec.swift
//  ShareTheMealTestTests
//
//  Created by Marco Maddalena on 16.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Nimble
import Quick
@testable import ShareTheMealTest

class CampaignsInteractorSpec: QuickSpec {

    override func spec() {
        var presenter: MockCampaignsPresenter?
        var client: CampaignsClientProtocol?
        var interactor: CampaignsInteractor?

        beforeEach {
            presenter = MockCampaignsPresenter()
        }

        describe("campaignsInteractor") {
            context("load campaigns") {
                it("success") {
                    client = MockCampaignsClient()
                    interactor = CampaignsInteractor(client: client!)
                    interactor?.presenter = presenter
                    interactor?.loadContents()
                    expect(presenter?.isRefreshSuccessCalled).to(equal(true))
                    expect(presenter?.isRefreshLoadingCalled).to(equal(true))
                    expect(presenter?.isRefreshErrorCalled).to(equal(false))
                }
            }
        }

        describe("campaignsInteractor") {
            context("load campaigns") {
                it("error") {
                    client = MockCampaignsClientError()
                    interactor = CampaignsInteractor(client: client!)
                    interactor?.presenter = presenter
                    interactor?.loadContents()
                    expect(presenter?.isRefreshSuccessCalled).to(equal(false))
                    expect(presenter?.isRefreshLoadingCalled).to(equal(true))
                    expect(presenter?.isRefreshErrorCalled).to(equal(true))
                }
            }
        }

        afterEach {
            client = nil
            presenter = nil
            interactor = nil
        }
    }
}

//let scaler = ImageScaler()
//let originalImages = loadImages()
//
//// Create an expectation
//let expectation = self.expectation(description: "Scaling")
//var scaledImages: [UIImage]?
//
//scaler.scale(originalImages) {
//    scaledImages = $0
//
//    // Fullfil the expectation to let the test runner
//    // know that it's OK to proceed
//    expectation.fulfill()
//}
//
//// Wait for the expectation to be fullfilled, or time out
//// after 5 seconds. This is where the test runner will pause.
//waitForExpectations(timeout: 5, handler: nil)
//
//XCTAssertEqual(scaledImages?.count, originalImages.count)


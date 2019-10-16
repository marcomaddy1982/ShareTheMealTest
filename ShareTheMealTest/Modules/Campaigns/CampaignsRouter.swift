//
//  CampaignsRouter.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 14.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import UIKit

protocol CampaignsRouterProtocol {
    func showDonationConfirmation()
}

class CampaignsRouter {
    var viewController: UIViewController {
        return _root ?? buildViewController()
    }

    private weak var _root: UINavigationController?
}

extension CampaignsRouter {
    private func buildViewController() -> UINavigationController {
        let root = UINavigationController()
        let viewController = buildCampaignsModule()

        root.viewControllers = [viewController]

        _root = root

        return root
    }

    private func buildCampaignsModule() -> CampaignsViewController {
        let viewController = CampaignsViewController.instantiateFromStoryboard(withName: "Campaigns")
        let presenter = CampaignsPresenter()
        let client = CampaignsClient()
        let interactor = CampaignsInteractor(client: client)
        let router = self

        // VC
        viewController.presenter = presenter

        // Presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.router = router

        // Interactor
        interactor.presenter = presenter

        return viewController
    }
}

extension CampaignsRouter: CampaignsRouterProtocol {
    func showDonationConfirmation() {
        let alert = UIAlertController(title: CampaignsRouter.campaignDonationAlertTitle,
                                      message: CampaignsRouter.campaignDonationAlertMessage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: CampaignsRouter.campaignDonationAlertCancelButton,
                                      style: .default,
                                      handler: nil))
        viewController.present(alert, animated: true)
    }
}

extension CampaignsRouter {
    private static let campaignDonationAlertTitle = "Donate"
    private static let campaignDonationAlertMessage = "Your doantion is confirmed. Thanks You"
    private static let campaignDonationAlertCancelButton = "Cancel"
}

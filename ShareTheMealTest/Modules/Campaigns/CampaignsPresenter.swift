//
//  CampaignsPresenter.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 14.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Foundation

protocol CampaignsPresenterProtocol: class {
    func viewDidLoad()
    func refresh(with viewModel: CampaignsViewModel)
    func didTapDonate()
    func didTapRefresh()
    func didTapRetry()
}

class CampaignsPresenter {

    weak var viewController: CampaignsViewProtocol!
    var router: CampaignsRouterProtocol!
    var interactor: CampaignsInteractorProtocol!
}

extension CampaignsPresenter: CampaignsPresenterProtocol {

    func viewDidLoad() {
        interactor.loadContents()
    }

    func refresh(with viewModel: CampaignsViewModel) {
        viewController.refresh(with: viewModel)
    }

    func didTapDonate() {
        router.showDonationConfirmation()
    }

    func didTapRefresh() {
        interactor.loadContents()
    }

    func didTapRetry() {
        interactor.loadContents()
    }
}

//
//  CampaignsInteractor.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 14.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Foundation

protocol CampaignsInteractorProtocol {
    func loadContents()
}

class CampaignsInteractor {
    weak var presenter: CampaignsPresenterProtocol!
    private var client: CampaignsClientProtocol!

    init(client: CampaignsClientProtocol) {
        self.client = client
    }
}

extension CampaignsInteractor: CampaignsInteractorProtocol {
    func loadContents() {
        presenter.refresh(with: .loading)
        client.getCampaigns(completion: { [weak self] result in
            self?.presenter.refresh(with: result)
        })
    }
}

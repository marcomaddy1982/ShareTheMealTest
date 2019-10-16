//
//  CampaignCellViewModel.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 15.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Foundation

struct CampaignCellViewModel {
    init(campaign: Campaign) {
        self.campaign = campaign
    }

    private let campaign: Campaign

    var imageUrl: URL? {
        return URL(string: campaign.imageUrl) ?? nil
    }

    var htmlText: NSAttributedString? {
        return try? NSAttributedString(html: campaign.htmlText)
    }

    var buttons: [Button] {
        return campaign.buttons
    }
}



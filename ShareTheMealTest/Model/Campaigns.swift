//
//  Campaigns.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 14.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Foundation

public struct CampaignOverview: Decodable, Equatable {
    public let items: [Campaign]
}

public struct Campaign: Decodable, Equatable {
    public let imageUrl: String
    public let htmlText: String
    public let buttons: [Button]
}

public struct Button: Decodable, Equatable {
    public let action: String
    public let text: String
}


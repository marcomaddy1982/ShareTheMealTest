//
//  CampaignsTask.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 14.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import Foundation
import Networking

final class CampaignsTask: JSONTask {
    typealias Output = CampaignOverview

    var state: TaskState = .none

    var request: Request {
        return CompaignsRequest()
    }
}

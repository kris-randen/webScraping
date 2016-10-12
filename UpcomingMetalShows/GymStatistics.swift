//
//  GymStatistics.swift
//  UpcomingMetalShows
//
//  Created by Kris Rajendren on Oct/12/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import Foundation

protocol GymStatisticsType
{
    var name: String? { get }
    var capacity: Int? { get }
    var occupancyNumber: Int? { get }
    var occupancyPercentage: Double? { get }
}

class GymStatistics: GymStatisticsType
{
    struct WhiteBldg
    {
        
    }
    var name: String?
    var capacity: Int?
    var occupancyNumber: Int?
    var occupancyPercentage: Double?
    
    init(currentGymStatistics: [String : [ String : String ]])
    {
        
    }
}

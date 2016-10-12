//
//  GymStatistics.swift
//  UpcomingMetalShows
//
//  Created by Kris Rajendren on Oct/12/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import Foundation
typealias GymStat = [String : [ String : String]]

protocol GymStatisticsType
{
    static var gymStatistics: GymStat? { get set }
    func update()
}

class GymStatistics: GymStatisticsType
{
    static var gymStatistics: GymStat?
    
    init()
    {
        update()
    }
    
    func update() {
        GymStatistics.gymStatistics = cURLscrapeWebPage(link: Constants.Web.Link.PSUfitnessCURLscraping)
    }
}

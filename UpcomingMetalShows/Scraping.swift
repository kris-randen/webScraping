//
//  Scraping.swift
//  UpcomingMetalShows
//
//  Created by Kris Rajendren on Oct/11/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import Foundation
import Alamofire

typealias GymStat = [String : [String : String]]

func cURLscrapeWebPage(link: String) -> GymStat {
    let CURLscraping = ConstantsDictionary[Constants.Mirror.Key.CURLscraping]!
    let headers = CURLscraping[Constants.Mirror.CURLscraping.Key.HeadersPSUFitness]!
    var gymStat: GymStat = [:]
    
    Alamofire.request(link, headers: headers).responseJSON { (response) in
        let string = "\(response)"
        gymStat = stringParser(string: string)
    }
    return gymStat
}

//func scrapeWebPage(link: String) -> Void {
//    Alamofire.request(link).responseString { (response) in
//        print("Success: \(response.result.isSuccess)")
//        parseHTML(html: response.result.value!)
//    }
//}



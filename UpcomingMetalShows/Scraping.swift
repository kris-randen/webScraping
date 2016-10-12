//
//  Scraping.swift
//  UpcomingMetalShows
//
//  Created by Kris Rajendren on Oct/11/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import Foundation
import Alamofire

func cURLscrapeWebPage(link: String) -> Void {
    let CURLscraping = ConstantsDictionary[Constants.Mirror.Key.CURLscraping]!
    let headers = CURLscraping[Constants.Mirror.CURLscraping.Key.HeadersPSUFitness]!
    
    Alamofire.request(link, headers: headers).responseJSON { (response) in
        let string = "\(response)"
        let parsed = stringParser(string: string)
        for i in 1...parsed.count {
            //print(parsed[i-1])
        }
        //print(string)
    }
}

//func scrapeWebPage(link: String) -> Void {
//    Alamofire.request(link).responseString { (response) in
//        print("Success: \(response.result.isSuccess)")
//        parseHTML(html: response.result.value!)
//    }
//}



//
//  Parsing.swift
//  UpcomingMetalShows
//
//  Created by Kris Rajendren on Oct/11/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import Foundation
import Kanna

func stringParser(string: String) -> [String : [String : String]] {
    let resultSemicolon = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).components(separatedBy: ";\n")
    let lengthRaw = resultSemicolon.count
    let numberOfGyms = (lengthRaw - 1) / (Constants.Gym.Statistic.numberOfParameters + 1)
    var indices: [Int] = [0]
    let locationIndex = 4
    var counter = 0
    for i in 1...numberOfGyms
    {
        indices.append((Constants.Gym.Statistic.numberOfParameters + 1) * i)
    }
    
    let relevantResult = resultSemicolon.removeIndices(indices: indices)
    
    //let relevantResult = resultSemicolon.removeIndices(indices: [0, 6, 12, 18])
    
    var keys: [String] = []
    var values: [String] = []
    var result: [[String:String]] = [[:]]
    var resultDict: [String : [String : String]] = [ : ]
    var gymDict: [String : String] = [ : ]
    for i in 1...numberOfGyms
    {
        for j in 1...Constants.Gym.Statistic.numberOfParameters
        {
            let trimmedSplit = relevantResult[(i * Constants.Gym.Statistic.numberOfParameters + j) - 1].trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).replacingOccurrences(of: "\"", with: "").components(separatedBy: Constants.Gym.Parsing.GymDataSeparator)
            gymDict.updateValue(trimmedSplit[1], forKey: trimmedSplit[0])
        }
        resultDict.updateValue(gymDict, forKey: gymDict[Constants.Gym.Parsing.GymParameterKeys[locationIndex - 1]]!)
    }
//    for i in 1...relevantResult.count {
//        let trimmedSplit = relevantResult[i-1].trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).replacingOccurrences(of: "\"", with: "").components(separatedBy: Gym_Data_Separator)
//        keys.append(trimmedSplit[0])
//        values.append(trimmedSplit[1])
//        result.append([keys[i-1] : values[i-1]])
//    }
    print(resultDict)
    return resultDict
}

//func parseHTML(html: String) -> Void {
//    if let doc = Kanna.HTML(html, encoding: String.Encoding.utf8) {
//        
//        // Search for nodes by CSS
//        for show in doc.css("body") {
//            let showString = show.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
//            let regex = try! NSRegularExpression(pattern: "^", options: [.caseInsensitive])
//            if regex.firstMatch(in: showString, options: [], range: NSMakeRange(0, showString.characters.count)) != nil {
//                shows.append(showString)
//                print(showString + "\n")
//            }
//        }
//    }
//}


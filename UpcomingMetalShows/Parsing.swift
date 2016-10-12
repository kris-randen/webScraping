//
//  Parsing.swift
//  UpcomingMetalShows
//
//  Created by Kris Rajendren on Oct/11/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import Foundation
import Kanna

extension Array {
    func removeIndices(indices: [Int]) -> Array {
        var counter = 0
        var result = self
        for i in indices {
            result.remove(at: (i - counter))
            counter += 1
        }
        return result
    }
}

func stringParser(string: String) -> [String : [String : String]] {
    let resultSemicolon = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).components(separatedBy: ";\n")
    let lengthRaw = resultSemicolon.count
    let numberOfGyms = (lengthRaw - 1) / (Constants.Gym.Statistic.numberOfParameters + 1)
    print("NUMBER OF GYMS = \(numberOfGyms)")
    var indices: [Int] = [0]
    
    for i in 1...numberOfGyms
    {
        let length = Constants.Gym.Statistic.numberOfParameters + 1
        indices.append(length * i)
    }
    
    let relevantResult = resultSemicolon.removeIndices(indices: indices)
    print("RELEVANT RESULT LENGTH = \(relevantResult.count)")
    
    var resultDict: [String : [String : String]] = [ : ]
    var gymDict: [String : String] = [ : ]
    for i in 1...numberOfGyms
    {
        for j in 1...Constants.Gym.Statistic.numberOfParameters
        {
            let trimmedSplit = relevantResult[((i - 1) * Constants.Gym.Statistic.numberOfParameters + j) - 1].trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).replacingOccurrences(of: "\"", with: "").components(separatedBy: Constants.Gym.Parsing.GymDataSeparator)
            gymDict.updateValue(trimmedSplit[1], forKey: trimmedSplit[0])
        }
        
        let resultKey = gymDict[Constants.Mirror.Gym.Statistic.LocationDescription]!
        let constantGymDict = ConstantsDictionary[Constants.Mirror.Key.Gym]!
        let gymSynonyms = constantGymDict[Constants.Mirror.Gym.Key.Synonyms]!
    
        resultDict.updateValue(gymDict, forKey: gymSynonyms[resultKey]!)
    }
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


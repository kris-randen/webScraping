//
//  ViewController.swift
//  UpcomingMetalShows
//
//  Created by Sam Agnew on 7/25/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import UIKit
import Kanna
import Alamofire


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

let Current_Val = "Occupancy"
let Full_Capacity_Wait_Time = "Wait Time"
let GUID = "GUID"
let Location_Description = "Gym"
let Max_Val = "Capacity"
let Gym_Data_Separator = " = "
let Gym_Parameter_Keys = [Current_Val, Full_Capacity_Wait_Time, GUID, Location_Description, Max_Val]
let White_Building = "White Building"
let White_Bldg = "White Bldg"
let Rec_Hall = "Rec Hall"
let IM_Building = "IM Building"
let IM_Bldg = "IM Bldg"
let Hepper_Fitness = "Hepper Fitness Center"
let IM_Weight_Room = "IM Weight Room"
let Gym_Synonyms = [Hepper_Fitness : Rec_Hall,
                    White_Building : White_Bldg,
                    IM_Weight_Room : IM_Bldg]


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
        return cell
    }

    let link: String = "https://studentaffairs.psu.edu/CurrentFitnessAttendance/api/CounterAPI"
    
//    func cURLscrapeWebPage(link: String) -> Void {
//        let headers = [
//            "Accept": "application/json, text/javascript, /; q=0.01",
//            "X-Requested-With": "XMLHttpRequest",
//            "Connection": "keep-alive",
//            "Referer": "https://studentaffairs.psu.edu/CurrentFitnessAttendance/"
//        ]
//        
//        Alamofire.request(link, headers: headers).responseJSON { (response) in
//            let string = "\(response)"
//            let parsed = self.stringParser(string: string)
//            for i in 1...parsed.count {
//                print(parsed[i-1])
//            }
//            print(string)
//        }
//    }
    
    func stringParser(string: String) -> [[String:String]] {
        let resultSemicolon = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).components(separatedBy: ";\n")
        let relevantResult = resultSemicolon.removeIndices(indices: [0, 6, 12, 18])
        var keys: [String] = []
        var values: [String] = []
        var result: [[String:String]] = [[:]]
        for i in 1...relevantResult.count {
            let trimmedSplit = relevantResult[i-1].trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).replacingOccurrences(of: "\"", with: "").components(separatedBy: Gym_Data_Separator)
            keys.append(trimmedSplit[0])
            values.append(trimmedSplit[1])
            result.append([keys[i-1] : values[i-1]])
        }
        return result
    }
    
    func scrapeNYCMetalScene() -> Void {
        Alamofire.request("https://studentaffairs.psu.edu/CurrentFitnessAttendance/").responseString { (response) in
            print("Success: \(response.result.isSuccess)")
            self.parseHTML(html: response.result.value!)
        }
    }
    
    func parseHTML(html: String) -> Void {
        if let doc = Kanna.HTML(html, encoding: String.Encoding.utf8) {
            
            // Search for nodes by CSS
            for show in doc.css("body") {
                let showString = show.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
                let regex = try! NSRegularExpression(pattern: "^", options: [.caseInsensitive])
                if regex.firstMatch(in: showString, options: [], range: NSMakeRange(0, showString.characters.count)) != nil {
                    shows.append(showString)
                    print(showString + "\n")
                }
            }
        }
    }
    var shows: [String] = []
    
    let textCellIdentifier = "ShowCell"
    
    @IBOutlet var metalShowTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        metalShowTableView.delegate = self
        metalShowTableView.dataSource = self
        
        GymStatistics().update()
        print(GymStatistics.gymStatistics)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
}

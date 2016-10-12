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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
        return cell
    }
    
//    func stringParser(string: String) -> [[String:String]] {
//        let resultSemicolon = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).components(separatedBy: ";\n")
//        let relevantResult = resultSemicolon.removeIndices(indices: [0, 6, 12, 18])
//        var keys: [String] = []
//        var values: [String] = []
//        var result: [[String:String]] = [[:]]
//        for i in 1...relevantResult.count {
//            let trimmedSplit = relevantResult[i-1].trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).replacingOccurrences(of: "\"", with: "").components(separatedBy: Gym_Data_Separator)
//            keys.append(trimmedSplit[0])
//            values.append(trimmedSplit[1])
//            result.append([keys[i-1] : values[i-1]])
//        }
//        return result
//    }
    
//    func scrapeNYCMetalScene() -> Void {
//        Alamofire.request("https://studentaffairs.psu.edu/CurrentFitnessAttendance/").responseString { (response) in
//            print("Success: \(response.result.isSuccess)")
//            self.parseHTML(html: response.result.value!)
//        }
//    }
//    
//    func parseHTML(html: String) -> Void {
//        if let doc = Kanna.HTML(html, encoding: String.Encoding.utf8) {
//            
//            // Search for nodes by CSS
//            for show in doc.css("body") {
//                let showString = show.text!.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
//                let regex = try! NSRegularExpression(pattern: "^", options: [.caseInsensitive])
//                if regex.firstMatch(in: showString, options: [], range: NSMakeRange(0, showString.characters.count)) != nil {
//                    shows.append(showString)
//                    print(showString + "\n")
//                }
//            }
//        }
//    }
    var shows: [String] = []
    
    let textCellIdentifier = "ShowCell"
    
    @IBOutlet var metalShowTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        metalShowTableView.delegate = self
        metalShowTableView.dataSource = self
        
        GymStatistics()
        print("GYM STATISTICS = \(GymStatistics.gymStatistics)")
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

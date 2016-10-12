//
//  Constants.swift
//  UpcomingMetalShows
//
//  Created by Kris Rajendren on Oct/11/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import Foundation

struct Constants
{
    struct Web
    {
        struct Link
        {
            static let PSUfitnessScraping = "https://studentaffairs.psu.edu/CurrentFitnessAttendance/"
            static let PSUfitnessCURLscraping = "https://studentaffairs.psu.edu/CurrentFitnessAttendance/api/CounterAPI"
        }
    }
    
    struct Scraping
    {
        
    }
    
    /*
 
     "Accept": "application/json, text/javascript, /; q=0.01",
     "X-Requested-With": "XMLHttpRequest",
     "Connection": "keep-alive",
     "Referer": "https://studentaffairs.psu.edu/CurrentFitnessAttendance/"
     
    */
    
    struct CURLscraping
    {
        struct Header
        {
            static let Accept = "Accept"
            static let XRequestedWith = "X-Requested-With"
            static let Connection = "Connection"
            static let Referer = "Referer"
        }
        
        struct HeaderValue {
            static let Accept = "application/json, text/javascript, /; q=0.01"
            static let XRequestedWith = "XMLHttpRequest"
            static let Connection = "keep-alive"
            static let RefererPSUFitness = "https://studentaffairs.psu.edu/CurrentFitnessAttendance/"
        }
    }
    
    struct Parsing
    {
        
    }
    
    struct Gym
    {
        struct Statistic
        {
            static let CurrentVal = "Occupancy"
            static let FullCapacityWaiTime = "Wait Time"
            static let GUID = "GUID"
            static let LocationDescription = "Gym"
            static let MaxVal = "Capacity"
            static let numberOfParameters: Int = 5
        }
        
        struct Parsing
        {
            static let GymDataSeparator = " = "
            static let GymParameterKeys = [Current_Val, Full_Capacity_Wait_Time, GUID, Location_Description, Max_Val]
        }
        
        struct Name
        {
            static let WhiteBuilding = "White Building"
            static let WhiteBldg = "White Bldg"
            static let RecHall = "Rec Hall"
            static let IMBuilding = "IM Building"
            static let IMBldg = "IM Bldg"
            static let HepperFitness = "Hepper Fitness Center"
            static let IMWeightRoom = "IM Weight Room"
        }
    }
    
    struct Mirror
    {
        struct Key
        {
            static let Gym = "Gym"
            static let Web = "Web"
            static let Scraping = "Scraping"
            static let CURLscraping = "CURLscraping"
        }
        
        struct Web
        {
            struct Key
            {
                static let Link = "Link"
            }
            
            struct Link
            {
                static let PSUfitnessScraping = "PSUfitnessScraping"
                static let PSUfitnessCURLscraping = "PSUfitnessCURLscraping"
            }
        }
        
        struct Scraping
        {
            struct Key
            {
                
            }
        }
        
        struct CURLscraping
        {
            struct Key
            {
                static let HeadersPSUFitness = "HeadersPSUFitness"
                static let HeaderValue = "HeaderValue"
            }
            
            struct Header {
                static let Accept = "Accept"
                static let XRequestedWith = "X-Requested-With"
                static let Connection = "Connection"
                static let Referer = "Referer"
            }
        }
        
        struct Gym
        {
            struct Key
            {
                static let Name = "Name"
                static let Statistic = "Statistic"
                static let Parsing = "Parsing"
                static let Synonyms = "Synonyms"
            }
            
            struct Name
            {
                static let WhiteBuilding = "WhiteBuilding"
                static let WhiteBldg = "WhiteBldg"
                static let RecHall = "RecHall"
                static let IMBuilding = "IMBuilding"
                static let IMBldg = "IMBldg"
                static let HepperFitness = "HepperFitness"
                static let IMWeightRoom = "IMWeightRoom"

            }
            
            struct Statistic
            {
                static let CurrentVal = "CurrentVal"
                static let FullCapacityWaiTime = "FullCapacityWaiTime"
                static let GUID = "GUID"
                static let LocationDescription = "LocationDescription"
                static let MaxVal = "MaxVal"
            }
            
            struct Parsing
            {
                static let GymDataSeparator = "GymDataSeparator"
                static let GymParameterKeys = "GymParameterKeys"
            }
        }
    }
}

let ConstantsDictionary: [String : [String : [String : String]]] = [
    Constants.Mirror.Key.Gym : [
        Constants.Mirror.Gym.Key.Statistic : [
            Constants.Mirror.Gym.Statistic.CurrentVal : Constants.Gym.Statistic.CurrentVal,
            Constants.Mirror.Gym.Statistic.FullCapacityWaiTime : Constants.Gym.Statistic.FullCapacityWaiTime,
            Constants.Mirror.Gym.Statistic.GUID : Constants.Gym.Statistic.GUID,
            Constants.Mirror.Gym.Statistic.LocationDescription : Constants.Gym.Statistic.LocationDescription,
            Constants.Mirror.Gym.Statistic.MaxVal : Constants.Gym.Statistic.MaxVal
        ],
        Constants.Mirror.Gym.Key.Synonyms : [
            Constants.Gym.Name.WhiteBuilding : Constants.Gym.Name.WhiteBldg,
            Constants.Gym.Name.HepperFitness : Constants.Gym.Name.RecHall,
            Constants.Gym.Name.IMWeightRoom : Constants.Gym.Name.IMBldg
        ]
    ],
    Constants.Mirror.Key.CURLscraping : [
        Constants.Mirror.CURLscraping.Key.HeadersPSUFitness : [
            Constants.Mirror.CURLscraping.Header.Accept : Constants.CURLscraping.HeaderValue.Accept,
            Constants.Mirror.CURLscraping.Header.XRequestedWith : Constants.CURLscraping.HeaderValue.XRequestedWith,
            Constants.Mirror.CURLscraping.Header.Connection : Constants.CURLscraping.HeaderValue.Connection,
            Constants.Mirror.CURLscraping.Header.Referer: Constants.CURLscraping.HeaderValue.RefererPSUFitness
        ]
    ]
]

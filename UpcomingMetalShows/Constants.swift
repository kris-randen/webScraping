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
    struct Gym
    {
        struct Statistic
        {
            static let CurrentVal = "Occupancy"
            static let FullCapacityWaiTime = "Wait Time"
            static let GUID = "GUID"
            static let LocationDescription = "Gym"
            static let MaxVal = "Capacity"
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
    ]
]

//
//  MockJSON.swift
//  iTunes SearchTests
//
//  Created by Jeff Kang on 2/4/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import Foundation

let dayOneJSON = """
{
    "resultCount": 2,
    "results": [
        {
            "artistName": "Bloom Built Inc",
            "trackName": "Day One Journal"
        },
        {
            "artistName": "Igor Kalicinski",
            "trackName": "Survivalcraft Day One"
        }
    ]
}
""".data(using: .utf8)

let badJSON = """
{
    "resultCount": 2,
    "results": [
        {
            "artistName": "Bloom Built Inc",
            "trackName": "Day One Journal"
        },
        {
            "artistName": "Igor Kalicinski",
            "trackName": "Survivalcraft Day One"
        }
    ]
""".data(using: .utf8)

let noResults = """
{
    "resultCount": 0,
    "results": []
""".data(using: .utf8)

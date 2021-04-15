//
//  WeatherRequest.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/12.
//

import Foundation

struct WeatherRequest: Encodable {
    let area: String
    let date: Date
}

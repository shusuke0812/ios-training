//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/12.
//

import Foundation

struct WeatherResponse: Decodable {
    let weather: Weather
    let maxTemp: Int
    let minTemp: Int
    let date: Date
}

//
//  WeatherError.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/12.
//

import Foundation

enum WeatherError: Error {
    case invalidParameterError
    case jsonDecodeError
    case unknownError
}

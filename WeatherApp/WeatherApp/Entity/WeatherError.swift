//
//  WeatherError.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/12.
//

import Foundation

enum WeatherError: Error {
    case jsonEncodeError
    case jsonDecodeError
    case unknownError
    /// 文字列のエラーメッセージを返す
    func descrption() -> String {
        switch self {
        case .jsonEncodeError:  return "JSONのエンコードに失敗しました"
        case .jsonDecodeError:  return "JSONのデコードに失敗しました"
        case .unknownError:     return "不明なエラーが発生しました"
        }
    }
}

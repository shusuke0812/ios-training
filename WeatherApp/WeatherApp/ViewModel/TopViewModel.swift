//
//  TopViewModel.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/15.
//

import Foundation

protocol TopViewModelDelegate: AnyObject {
    /// 天気予報の取得に成功した
    func didSuccessWeatherInfo()
    /// 天気予報の取得に失敗した
    /// - Parameter errorMessage: エラーメッセージ
    func didFailedWeatherInfo(errorMessage: String)
}
class TopViewModel: NSObject {
    /// 天気情報取得リポジトリ
    private let weatherRepository: WeatherRepositoryProtocol
    // 天気情報
    private(set) var area = "tokyo"
    private(set) var date = Date()
    /// デリゲート
    weak var delegate: TopViewModelDelegate?
    
    init(weatherRepository: WeatherRepositoryProtocol) {
        self.weatherRepository = weatherRepository
    }
}
extension TopViewModel {
    /// 天気情報を取得する
    func getWeatherInfo() {
        self.weatherRepository.fetchWeather(at: self.area, date: self.date) { response in
            switch response {
            case .success(let weather):
                print("DEBUG: ", weather)
                self.delegate?.didSuccessWeatherInfo()
            case .failure(let error):
                print("DEBUG: ", error)
                self.delegate?.didFailedWeatherInfo(errorMessage: error.localizedDescription)
            }
        }
    }
}

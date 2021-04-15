//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/12.
//

import Foundation
import YumemiWeather

protocol WeatherRepositoryProtocol {
    /// 天気情報を取得する
    /// - Parameters:
    ///  - area: 場所
    ///  - date: 日付
    ///  - completion: 天気取得の成功、失敗ハンドラー
    func fetchWeather(at area: String, date: Date, completion: @escaping (Result<WeatherResponse, WeatherError>) -> Void)
}
class WeatherRepository: WeatherRepositoryProtocol {
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter
    }()
}
// MARK: - API Config Method
extension WeatherRepository {
    /// リスエストの組み立て
    /// - Parameters:
    ///  - area: 場所
    ///  - date: 日付
    /// - Returns: JSON型のリクエスト
    private func buildRequest(from request: WeatherRequest) throws -> String {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(self.dateFormatter)
        
        let requestData = try encoder.encode(request)
        guard let requestJsonString = String(data: requestData, encoding: .utf8) else {
            throw WeatherError.jsonDecodeError
        }
        return requestJsonString
    }
}
// MARK: - API Call Method
extension WeatherRepository {
    func fetchWeather(at area: String, date: Date, completion: @escaping (Result<WeatherResponse, WeatherError>) -> Void) {
        let request = WeatherRequest(area: area, date: date)
        if let requestJsonString = try? self.buildRequest(from: request) {
            DispatchQueue.global(qos: .userInteractive).async {
                if let responseJson = try? YumemiWeather.syncFetchWeather(requestJsonString) {
                    guard let resonseData = responseJson.data(using: .utf8) else {
                        completion(.failure(.jsonDecodeError))
                        return
                    }
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(self.dateFormatter)
                    do {
                        let response = try decoder.decode(WeatherResponse.self, from: resonseData)
                        completion(.success(response))
                    } catch {
                        completion(.failure(WeatherError.jsonDecodeError))
                    }
                }
            }
        }
    }
}

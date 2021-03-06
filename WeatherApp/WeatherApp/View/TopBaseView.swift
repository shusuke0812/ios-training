//
//  TopBaseView.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/11.
//

import UIKit

protocol TopBaseViewDelegate: AnyObject {
    func didTapReloadButton()
    func didTapCloseButton()
}

class TopBaseView: UIView {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var weatherActivityIndicatorView: UIActivityIndicatorView!
    
    /// デリゲート
    weak var delegate: TopBaseViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
    // MARK: - Action Method
    @IBAction func didTapReloadButton(_ sender: Any) {
        self.delegate?.didTapReloadButton()
    }
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.delegate?.didTapCloseButton()
    }
}
// MARK: - Initialized Method
extension TopBaseView {
    private func initUI() {
        self.weatherActivityIndicatorView.isHidden = true
    }
}
// MARK: - Setting UI Method
extension TopBaseView {
    /// 天気イメージを設定する
    func setWeatherImageView(weather: WeatherResponse?) {
        if let weather = weather {
            switch weather.weather {
            case .cloudy:
                self.weatherImageView.image = UIImage(named: "cloudy")?.withRenderingMode(.alwaysTemplate)
                self.weatherImageView.tintColor = .lightGray
            case .rainy:
                self.weatherImageView.image = UIImage(named: "rainy")?.withRenderingMode(.alwaysTemplate)
                self.weatherImageView.tintColor = .blue
            case .sunny:
                self.weatherImageView.image = UIImage(named: "sunny")?.withRenderingMode(.alwaysTemplate)
                self.weatherImageView.tintColor = .red
            }
        }
    }
    /// 最低気温・最高気温を設定する
    func setTemperature(weather: WeatherResponse?) {
        if let weather = weather {
            self.minTemperatureLabel.text = "\(weather.minTemp)"
            self.maxTemperatureLabel.text = "\(weather.maxTemp)"
        }
    }
    /// ActivityIndicatorを表示
    func startActivityIndicator() {
        self.weatherActivityIndicatorView.isHidden = false
        self.weatherActivityIndicatorView.startAnimating()
    }
    /// ActivityIndicatorを終了
    func endActivityIndicator() {
        self.weatherActivityIndicatorView.stopAnimating()
        self.weatherActivityIndicatorView.isHidden = true
    }
}

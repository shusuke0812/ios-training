//
//  TopBaseView.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/11.
//

import UIKit

protocol TopBaseViewDelegate: AnyObject {
    func didTapReloadButton()
}

class TopBaseView: UIView {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var reloadButton: UIButton!
    
    /// デリゲート
    weak var delegate: TopBaseViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Action Method
    @IBAction func didTapReloadButton(_ sender: Any) {
        self.delegate?.didTapReloadButton()
    }
}
// MARK: - Initialized Method
extension TopBaseView {
}
// MARK: - Setting UI Method
extension TopBaseView {
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
}

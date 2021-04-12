//
//  TopBaseView.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/11.
//

import UIKit

class TopBaseView: UIView {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var reloadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Initialized Method
extension TopBaseView {
}

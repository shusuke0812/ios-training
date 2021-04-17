//
//  ViewController.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/11.
//

import UIKit

class TopViewController: UIViewController {
    /// BaseView
    private var baseView: TopBaseView { self.view as! TopBaseView }
    /// ViewModel
    private var viewModel: TopViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = TopViewModel(weatherRepository: WeatherRepository())
        self.setDelegate()
    }
}
// MARK: - Initialization
extension TopViewController {
    private func setDelegate() {
        self.baseView.delegate = self
        self.viewModel.delegate = self
    }
}
// MARK: - BaseView Delegate Method
extension TopViewController: TopBaseViewDelegate {
    func didTapReloadButton() {
        self.viewModel.getWeatherInfo()
    }
    func didTapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
// MARK: - ViewModel Delegate Method
extension TopViewController: TopViewModelDelegate {
    func didSuccessWeatherInfo() {
        DispatchQueue.main.async {
            self.baseView.setWeatherImageView(weather: self.viewModel.weather)
            self.baseView.setTemperature(weather: self.viewModel.weather)
        }
    }
    func didFailedWeatherInfo(errorMessage: String) {
        print("DEBUG: ", errorMessage)
        DispatchQueue.main.async {
            UIAlertController.showAlert(style: .alert, viewController: self, title: errorMessage, message: nil, okButtonTitle: "OK", cancelButtonTitle: nil)
        }
    }
}

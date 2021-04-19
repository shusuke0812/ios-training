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
        self.loadWeatherInfoWhenReturnedBackground()
    }
}
// MARK: - Initialization / Private Method
extension TopViewController {
    private func setDelegate() {
        self.baseView.delegate = self
        self.viewModel.delegate = self
    }
    private func loadWeatherInfoWhenReturnedBackground() {
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { _ in
            self.viewModel.getWeatherInfo()
        }
    }
}
// MARK: - BaseView Delegate Method
extension TopViewController: TopBaseViewDelegate {
    func didTapReloadButton() {
        self.baseView.startActivityIndicator()
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
            self.baseView.endActivityIndicator()
        }
    }
    func didFailedWeatherInfo(errorMessage: String) {
        print("DEBUG: ", errorMessage)
        DispatchQueue.main.async {
            self.baseView.endActivityIndicator()
            UIAlertController.showAlert(style: .alert, viewController: self, title: errorMessage, message: nil, okButtonTitle: "OK", cancelButtonTitle: nil)
        }
    }
}

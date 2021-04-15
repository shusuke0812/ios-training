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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension TopViewController {
    private func setDelegate() {
        self.baseView.delegate = self
    }
}
// MARK: - BaseView Delegate Method
extension TopViewController: TopBaseViewDelegate {
    func didTapReloadButton() {
    }
}

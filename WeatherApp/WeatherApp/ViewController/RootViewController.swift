//
//  RootViewController.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/18.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.transitionTopViewController()
    }
}
extension RootViewController {
    /// トップ画面に遷移する
    private func transitionTopViewController() {
        let s = UIStoryboard(name: "TopViewController", bundle: nil)
        let vc = s.instantiateInitialViewController() as! TopViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

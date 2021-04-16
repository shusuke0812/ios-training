//
//  UIAlertController+Extension.swift
//  WeatherApp
//
//  Created by Shusuke Ota on 2021/4/16.
//

import UIKit

extension UIAlertController {
    /// アラート表示
    internal static func showAlert(style: UIAlertController.Style, viewController: UIViewController, title: String?, message: String?, okButtonTitle: String?, cancelButtonTitle: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default) { _ in
            print("DEBUG: OKボタンがタップされました")
        }
        alert.addAction(okAction)
        if let cancelButtonTitle = cancelButtonTitle {
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
                print("DEBUG: キャンセルボタンがタップされました")
            }
            alert.addAction(cancelAction)
        }
        viewController.present(alert, animated: true, completion: nil)
    }
}

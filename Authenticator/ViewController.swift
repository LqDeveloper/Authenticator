//
//  ViewController.swift
//  Authenticator
//
//  Created by Quan Li on 2020/3/10.
//

import UIKit
import RxSwift
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func clickBtn(_ sender: Any) {
        //        Authenticator.authenticateWithBioMetrics(reason: "请求生物验证原因", fallbackTitle: "后备验证", cancelTitle: "取消标题") { (result) in
        //            switch result{
        //            case .success(_):
        //                break
        //            case .failure(let error):
        //                if error == .fallback {
        //                    print("这是后备验证方法")
        //                }
        //                if error == .biometryLockedout {
        //                    Authenticator.authenticateWithPasscode(reason: "请求密码验证原因", cancelTitle: "取消标题") { (re) in
        //                        print(re)
        //                    }
        //                }
        //            }
        //        }
        
      _ = Authenticator.rx.authenticateWithBioMetrics(reason: "请求生物验证原因", fallbackTitle: "后备验证", cancelTitle: "取消标题").subscribe { (_) in
            print("验证成功")
        } onError: { (error) in
            print(error as? AuthenticationError ?? .other)
        }
        
    }
    
}


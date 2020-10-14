//
//  Authenticator+RxSwift.swift
//  Authenticator
//
//  Created by Quan Li on 2020/3/10.
//

import Foundation
import RxSwift

extension Authenticator:ReactiveCompatible{}
public extension Reactive where Base : Authenticator{
    static func authenticateReturnBool(reason: String, fallbackTitle: String? = "", cancelTitle: String? = "") -> Single<Bool>{
        return Single.create { (single) -> Disposable in
            Base.authenticateWithBioMetrics(reason: reason, fallbackTitle: fallbackTitle, cancelTitle: cancelTitle) { (result) in
                switch result{
                case .success(_):
                    single(.success(true))
                case .failure(let error):
                    single(.error(error))
                }
            }
            return Disposables.create {
            }
        }
    }
    
    static func authenticateReturnResult(reason: String, fallbackTitle: String? = "", cancelTitle: String? = "") -> Single<Result<Bool, AuthenticationError>>{
        return Single.create { (single) -> Disposable in
            Base.authenticateWithBioMetrics(reason: reason, fallbackTitle: fallbackTitle, cancelTitle: cancelTitle) { (result) in
                single(.success(result))
            }
            return Disposables.create {
            }
        }
    }
    
    
    static func authenticateWithPasscode(reason: String, cancelTitle: String? = "")-> Single<Bool>{
        return Single.create { (single) -> Disposable in
            Base.authenticateWithPasscode(reason: reason, cancelTitle: cancelTitle) { (result) in
                switch result{
                case .success(_):
                    single(.success(true))
                case .failure(let error):
                    single(.error(error))
                }
            }
            return Disposables.create {
            }
        }
    }
}

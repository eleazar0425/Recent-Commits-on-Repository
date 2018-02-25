//
//  GithubClient.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import Alamofire
import BrightFutures
import SwiftyJSON

class GithubClient : NetClient {
    
    var request: DataRequest?
    
    func request(_ route: URLRequestConvertible) -> Future<JSON, ServiceError> {
        request?.cancel() //by now, always cancel previous request
        let promise = Promise<JSON, ServiceError>()
        request = Alamofire.request(route)
                    .validate()
                    .responseJSON { json in
                        guard let data = json.value else {
                            promise.failure(ServiceError.unknownError(message: "Something happened"))
                            return
                        }
                        
                        promise.success(JSON(data))
                    }
        return promise.future
    }
}

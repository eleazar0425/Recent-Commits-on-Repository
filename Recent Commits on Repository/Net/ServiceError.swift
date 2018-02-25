//
//  Error.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case networkError(message: String)
    case unknownError(message: String)
}

//
//  NSObject+Extention.swift
//  Landmark
//
//  Created by ArifAhmed on 17/5/24.
//

import Foundation

extension NSObject {
    @objc var className: String {
        return String(describing: type(of: self))
    }
    @objc class var className: String {
        return String(describing: self)
    }
}

//
//  Encodable+Extensions.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/20.
//

import Foundation

extension Encodable {
    func setParams() -> [String:Any] {
        var params: [String: Any] = [:]
        let data = try! JSONEncoder().encode(self)
        params = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
        return params
    }
}

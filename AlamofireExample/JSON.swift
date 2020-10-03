//
//  JSON.swift
//  AlamofireExample
//
//  Created by Ruken SANCAR on 3.10.2020.
//

import UIKit

extension NSDictionary {
    var json: Data {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            let stringValue = String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
            if stringValue == "Not a valid JSON" {
                return invalidJson.data(using: .utf8)!
            } else {
                return jsonData
            }
        } catch {
            return invalidJson.data(using: .utf8)!
        }
    }
    func dict2json() -> Data {
        return json
    }
}

extension NSArray {
    var json: Data {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            let stringValue = String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
            if stringValue == "Not a valid JSON" {
                return invalidJson.data(using: .utf8)!
            } else {
                return jsonData
            }
        } catch {
            return  invalidJson.data(using: .utf8)!
        }
    }
    func arr2json() -> Data {
        return json
    }
}

extension NSArray {
    var jsonData: [String: Any] {
        do {
            let jsonDataValue = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            if  String(data: jsonDataValue, encoding: String.Encoding.utf8) != nil {
                if  let json_Val = try JSONSerialization.jsonObject(with: jsonDataValue, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any] {
                    return  json_Val
                } else {
                    return ["String": "Any"]
                }
            } else {
                return ["String": "Any"]
            }
        } catch {
            return ["String": "Any"]
        }
    }
    func arr_Data_json() ->  [String: Any] {
        return jsonData
    }
}

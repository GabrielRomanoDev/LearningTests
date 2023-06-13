//
//  main.swift
//  TesteInfoPlist
//
//  Created by Gabriel Luz Romano on 02/06/23.
//

import Foundation

//# Tentativa 1
//if let path = Bundle.main.path(forResource: "info", ofType: "plist"),
//   let plistData = NSDictionary(contentsOfFile: path) as? [String: Any] {
//       // Faça algo com o dicionário plistData
//    if let value = plistData["OutputFile"] as? String {
//        print("Rolou: \(value)")
//    }
//
//} else {
//    //print("Não Rolou")
//}


//#
func getStringValueFromPlist(forKey key: String) -> String {
    guard let fileURL = Bundle.main.url(forResource: "main", withExtension: "swift") else {
        fatalError("Can't find file")
    }

    let contents = NSDictionary(contentsOf: fileURL) as? [String: String] ?? [:]

    return contents[key] ?? ""
}



let test = getStringValueFromPlist(forKey: "OutputFile")
//let test = Bundle.main.object(forInfoDictionaryKey: "Configuration Name") as? String
print(test)

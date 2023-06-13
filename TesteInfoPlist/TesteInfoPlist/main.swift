//
//  main.swift
//  TesteInfoPlist
//
//  Created by Gabriel Luz Romano on 02/06/23.
//

import Foundation
import Dispatch
import CoreBluetooth

let queue = DispatchQueue.global()
let group = DispatchGroup()
//let semaphore = DispatchSemaphore(value: 0)
var stscheckedState = false
var centralManager = CBCentralManager()

//queue.async(group: group) {
//    group.enter()
//
//    for x in 0...500 {
//        for y in 0...100 {
//            if y % 10 == 0 {
//                print("Função 1: Valor de x:\(x) e valor de y:\(y)")
//            }
//        }
//    }
//
//    scanState()
//    print("finished func 1")
//
//
//    group.leave()
//}
//
//queue.async(group: group) {
//    group.enter()
//
//    for x in 0...500 {
//        for y in 0...100 {
//            if y % 10 == 0 {
//                print("Função 1: Valor de x:\(x) e valor de y:\(y)")
//            }
//        }
//    }
//
//    //scanState()
//    print("finished func 1")
//
//
//    group.leave()
//}
//
//group.wait()
//print("esperou")

scanState()

public func scanState() {
    checkState()
    //semaphore.wait()
    let runLoop = RunLoop.current
    while !stscheckedState && runLoop.run(mode: .default, before: .distantFuture) {
        
    }
    
    print("passou")
    
}

func checkStateInOneSecond() {
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        checkState()
    }
}

public func checkState() {
    if centralManager.state != .unknown {
        print( "state: \(stateString())")
        stscheckedState = true
        //semaphore.signal()
    } else {
        checkStateInOneSecond();
    }
}

func stateString() -> String {
    switch(centralManager.state) {
    case .resetting:
        return "resetting"
    case .poweredOn:
        return "powered on"
    case .poweredOff:
        return "powered off"
    case .unknown:
        return "unknown"
    case .unsupported:
        return "unsupported"
    case .unauthorized:
        return "unauthorized"
    @unknown default:
        return "unknown"
    }
}




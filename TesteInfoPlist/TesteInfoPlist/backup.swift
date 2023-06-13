//
//  main.swift
//  TesteInfoPlist
//
//  Created by Gabriel Luz Romano on 02/06/23.
//

//import Foundation
//import CoreBluetooth
//
//var running: Bool = true
//
//class BluetoothManager: NSObject {
//    var centralManager: CBCentralManager!
//
//    override init() {
//        super.init()
//        centralManager = CBCentralManager()
//        
//    }
//    
//    func run() {
//        checkStateInOneSecond()
//        
//        
//        let runLoop = RunLoop.current
//        let distantFuture = Date.distantFuture
//        while running == true && runLoop.run(mode: RunLoop.Mode.default, before: distantFuture) {
//
//        }
//    }
//    
//    func checkStateInOneSecond() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.checkState()
//        }
//    }
//
//    public func checkState() {
//        if centralManager.state != .unknown {
//            print( "state: \(stateString())" )
//            running = false
//        }
//            checkStateInOneSecond();
//        }
//    
//    func stateString() -> String {
//            switch(centralManager.state) {
//            case .resetting:
//                return "resetting"
//            case .poweredOn:
//                return "powered on"
//            case .poweredOff:
//                return "powered off"
//            case .unknown:
//                return "unknown"
//            case .unsupported:
//                return "unsupported"
//            case .unauthorized:
//                return "unauthorized"
//            @unknown default:
//                return "unknown"
//            }
//        }
//}

// Create an instance of the BluetoothManager to initiate the central manager
//let bluetoothManager = BluetoothManager()
//bluetoothManager.run()
//
//
//exit(0)



//import Foundation
//
//func getBluetoothState() {
//    let task = Process()
//    task.launchPath = "/usr/sbin/system_profiler"
//    task.arguments = ["SPBluetoothDataType", "|", "grep", "State:"]
//
//    let pipe = Pipe()
//    task.standardOutput = pipe
//    task.launch()
//
//    let data = pipe.fileHandleForReading.readDataToEndOfFile()
//    if let output = String(data: data, encoding: .utf8) {
//        print(output)
//    }
//
//    task.waitUntilExit()
//}
//
//getBluetoothState()
//









//import Foundation

//// Crie duas operações
//let operation1 = BlockOperation {
//    for x in 0...500 {
//        for y in 0...100 {
//            if y % 10 == 0 {
//                print("Função 1: Valor de x:\(x) e valor de y:\(y)")
//            }
//        }
//    }
//    print("finished func 1")
//}
//
//let operation2 = BlockOperation {
//    for x in 50...550 {
//        for y in 200...300 {
//            if y % 12 == 0 {
//                print("Função 2: Valor de x:\(x) e valor de y:\(y)")
//            }
//        }
//    }
//    print("finished func 2")
//}
//
//let operation3 = BlockOperation {
//    for x in 10...520 {
//        for y in 700...800 {
//            if y % 8 == 0 {
//                print("Função 3: Valor de x:\(x) e valor de y:\(y)")
//            }
//        }
//    }
//    print("finished func 3")
//}
//
//// Crie uma fila de operação
//let operationQueue = OperationQueue()
//
//// Adicione as operações à fila de operação
//operationQueue.addOperations([operation1, operation2, operation3], waitUntilFinished: true)
//print("esperou")


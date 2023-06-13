//
//  NetflixInfo.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 19/05/23.
//

import Foundation

struct NetflixInfo {
    var title: String
    var subTitle: String
    var imageName: String
}

var netflixInfos: [NetflixInfo] = [
    NetflixInfo(title: "Watch on any Device", subTitle: "Stream on your phone, tablet, laptop, and TV without paying more.", imageName: "image00"),
    NetflixInfo(title: "3, 2, 1... Download!", subTitle: "Downloads only available on ad-free plans.", imageName: "image01"),
    NetflixInfo(title: "No pesky contracts", subTitle: "Join today, cancel anytime.", imageName: "image02"),
    NetflixInfo(title: "How do I Watch?", subTitle: "Members that subscribe to Netflix can watch here in the app.", imageName: "image03")
]

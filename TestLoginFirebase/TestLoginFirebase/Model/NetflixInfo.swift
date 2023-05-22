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
    NetflixInfo(title: "Unlimited movies, TV shows & More", subTitle: "Watch anywhere. Cancel anytime.", imageName: "image01"),
    NetflixInfo(title: "\nNo pesky contracts", subTitle: "Join today, cancel anytime.", imageName: "image02"),
    NetflixInfo(title: "\nWatch everywhere", subTitle: "Stream on your phone, tablet, laptop, TV and more.", imageName: "image03"),
    NetflixInfo(title: "\nDownload and watch offline", subTitle: "Only available on ad-free plans.", imageName: "image04")
]

//
//  RoverData.swift
//  MarsRover
//
//  Created by Mert Yılmaz on 19.09.2021.
//

import Foundation

struct RoverData: Codable {
    let photos: [Photos]
    
    enum CodingKeys: String, CodingKey {
        case photos = "photos"
    }
}

struct Photos: Codable {
    let img_src: String
    let earth_date: String
    let camera: Camera
    let rover: Rover
}

struct Camera: Codable {
    let name: String
    let full_name: String
}

struct Rover: Codable {
    let name: String
    let landing_date: String
    let launch_date: String
    let status: String
}

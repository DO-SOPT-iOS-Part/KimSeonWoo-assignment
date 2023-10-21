
//
//  Protocol.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/10/21.
//


import Foundation

protocol WeatherInfoViewDelegate: AnyObject {
    func weatherInfoViewTapped(_ CityListView: CityListView)
}

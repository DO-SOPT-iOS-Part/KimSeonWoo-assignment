//
//  String+.swift
//  assignment1
//
//  Created by Seonwoo Kim on 12/11/23.
//

import Foundation

//    현재시간을 반환하기 위한 함수입니다.
func getCurrentTime() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    
    let currentTime = Date()
    let formattedTime = dateFormatter.string(from: currentTime)
    
    return formattedTime
}

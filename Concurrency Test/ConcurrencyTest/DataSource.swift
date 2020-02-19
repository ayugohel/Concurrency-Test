//
//  DataSource.swift
//  ConcurrencyTest
//


import Foundation

func _asyncStringAfter(value: String, completion: @escaping (String) -> Void) {
    let random = Int.random(in: 200...2500)
    let interval = DispatchTimeInterval.milliseconds(random)
    DispatchQueue.global().asyncAfter(deadline: .now() + interval) {
        completion(value)
    }
}

func fetchMessageOne(completion: @escaping (String) -> Void) {
    _asyncStringAfter(value: "Hello", completion: completion)
}

func fetchMessageTwo(completion: @escaping (String) -> Void) {
    _asyncStringAfter(value: "world", completion: completion)
}

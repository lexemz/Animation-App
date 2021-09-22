//
//  Animation Model.swift
//  Spring Animation App
//
//  Created by Igor on 22.09.2021.
//


struct Animation {
    let animation: String
    let duration: Double
    let curve: String
    var force: Double = 1.0
    var delay: Double = 0
    
    static func getAnimations() -> [Animation] {
        [
            Animation(animation: "morph", duration: 1, curve: "easeOut", force: 1.0, delay: 0),
            Animation(animation: "pop", duration: 1, curve: "easeOut"),
            Animation(animation: "swing", duration: 0.7, curve: "spring", force: 1.5, delay: 0.1),
            Animation(animation: "wobble", duration: 1.1, curve: "spring", force: 0.5, delay: 0.2),
        ]
    }
}

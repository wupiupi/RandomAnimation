//
//  Animation.swift
//  RandomAnimation
//
//  Created by Paul Makey on 25.01.24.
//

struct Animation {

    let animation: String
    let curve: String
    
    let force: Double
    let duration: Double
    let delay: Double
    
    static func getAnimations() -> [Animation] {
        let data = DataStore.shared
        
        let presets = data.presets
        let curves = data.curves
        let count = min(presets.count, curves.count)
        
        let animations = (0..<count).map { index in
            Animation(
                animation: presets[index],
                curve: curves[index],
                force: Double.random(in: 0.1...2),
                duration: Double.random(in: 0.1...1.5),
                delay: Double.random(in: 0.1...0.5)
            )
        }
        
        return animations
    }
}

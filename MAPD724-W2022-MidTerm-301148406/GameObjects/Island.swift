/**
 * MAPD724 - MidTerm
 * File Name:    Island.swift
 * Author:         Quoc Phong Ngo
 * Student ID:   301148406
 * Version:        1.0
 * Date Modified:   March 3rd, 2022
 */

import GameplayKit
import SpriteKit

class Island : GameObject
{
    
    // constructor / initializer
    init()
    {
        super.init(imageString: "island", initialScale: 1.2)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func CheckBounds()
    {
        // Task 3
        if(position.x <= -730)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 730
        // get a pseudo random number -150 to 150
        let randomY:Int = (randomSource?.nextInt(upperBound: 300))! - 150
        position.y = CGFloat(randomY)
        isCollding = false
    }
    
    // initialization
    override func Start()
    {
        Reset()
        zPosition = 1
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.x -= verticalSpeed!
    }
}

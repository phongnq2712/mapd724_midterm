/**
 * MAPD724 - MidTerm
 * File Name:    PlanePortrait.swift
 * Author:         Quoc Phong Ngo
 * Student ID:   301148406
 * Version:        1.0
 * Date Modified:   March 4th, 2022
 */

import GameplayKit
import SpriteKit

class PlanePortrait : GameObject
{
    // initializer
    init()
    {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        // constrain on the left boundary
        if(position.x <= -310)
        {
            position.x = -310
        }
        
        // constrain on the right boundary
        if(position.x >= 310)
        {
            position.x = 310
        }
    }
    
    // initialization
    override func Start()
    {
        zPosition = 2
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
}

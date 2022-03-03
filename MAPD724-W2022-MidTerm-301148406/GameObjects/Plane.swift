/**
 * MAPD724 - MidTerm
 * File Name:    Plane.swift
 * Author:         Quoc Phong Ngo
 * Student ID:   301148406
 * Version:        1.0
 * Date Modified:   March 3rd, 2022
 */

import GameplayKit
import SpriteKit

class Plane : GameObject
{
    // initializer
    init()
    {
        super.init(imageString: "planeRight", initialScale: 1.2)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        // Task 5
        // constrain on the bottom boundary
        if(position.y <= -130)
        {
            position.y = -130
        }
        
        // Task 5
        // constrain on the top boundary
        if(position.y >= 130)
        {
            position.y = 130
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

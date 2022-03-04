/**
 * MAPD724 - MidTerm
 * File Name:    OceanPortrait.swift
 * Author:         Quoc Phong Ngo
 * Student ID:   301148406
 * Version:        1.0
 * Date Modified:   March 4th, 2022
 */

import GameplayKit
import SpriteKit

class OceanPortrait : GameObject
{
    
    // constructor / initializer
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func CheckBounds()
    {
        if(position.y <= -773)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.y = 773
    }
    
    // initialization
    override func Start()
    {
        zPosition = 0
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.y -= verticalSpeed!
    }
}

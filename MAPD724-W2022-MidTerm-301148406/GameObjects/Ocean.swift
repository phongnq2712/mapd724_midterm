/**
 * MAPD724 - MidTerm
 * File Name:    Ocean.swift
 * Author:         Quoc Phong Ngo
 * Student ID:   301148406
 * Version:        1.0
 * Date Modified:   March 3rd, 2022
 */

import GameplayKit
import SpriteKit

class Ocean : GameObject
{
    
    // constructor / initializer
    init()
    {
        print("initOcean")
        super.init(imageString: "oceanRight", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func CheckBounds()
    {
//        if(position.y <= -773)
        if(position.x <= -773)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
//        position.y = 773
        position.x = 773
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
//        position.y -= verticalSpeed!
        position.x -= verticalSpeed!
    }
}

/**
 * MAPD724 - MidTerm
 * File Name:    GameViewController.swift
 * Author:         Quoc Phong Ngo
 * Student ID:   301148406
 * Version:        1.0
 * Date Modified:   March 4th, 2022
 */

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager
{
    
    // Button Outlets
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndButton: UIButton!
    
    // Label Outlets
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var EndLabel: UILabel!
    
    var currentScene: SKScene?
    var isPressButtonStart = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
               
        // Initialize the Lives and Score
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        EndLabel.isHidden = true
        EndButton.isHidden = true
        
        CollisionManager.gameViewController = self
        SetScene(sceneName: "StartPortraitScene")
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("viewWill....")
        if(UIDevice.current.orientation.isLandscape) {
            // landscape mode
            SetScene(sceneName: "StartScene")
            if(isPressButtonStart) {
                SetScene(sceneName: "GameScene")
            }
        } else if(UIDevice.current.orientation.isPortrait) {
            // portrait mode
            SetScene(sceneName: "StartPortraitScene")
            if(isPressButtonStart) {
                SetScene(sceneName: "GamePortraitScene")
            }
        }
    }
    
    func updateScoreLabel() -> Void
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel() -> Void
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func SetScene(sceneName: String) -> Void
    {
        if let view = self.view as! SKView?
        {
            
            // Load the SKScene - store a reference in currentScene
            currentScene = SKScene(fileNamed: sceneName)
            
            if let gameScene = currentScene as? GameScene
            {
                gameScene.gameManager = self
            }
            
            // Set the scale mode to scale to fit the window
            currentScene?.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(currentScene)
            
            view.ignoresSiblingOrder = true
        }
    }
    
    func PresentStartScene()
    {
        StartButton.isHidden = false
        StartLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
    }
    
    func PresentEndScene()
    {
        EndButton.isHidden = false
        EndLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        SetScene(sceneName: "EndScene")
    }
    
    
    @IBAction func StartButton_Pressed(_ sender: UIButton)
    {
        isPressButtonStart = true
        StartButton.isHidden = true
        StartLabel.isHidden = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        if(UIDevice.current.orientation.isLandscape) {
            SetScene(sceneName: "GameScene")
        } else if(UIDevice.current.orientation.isPortrait) {
            SetScene(sceneName: "GamePortraitScene")
        }
    }
    
    @IBAction func EndButton_Pressed(_ sender: UIButton)
    {
        EndButton.isHidden = true
        EndLabel.isHidden = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        if(UIDevice.current.orientation.isLandscape) {
            SetScene(sceneName: "GameScene")
        } else if(UIDevice.current.orientation.isPortrait) {
            SetScene(sceneName: "GamePortraitScene")
        }
    }
}

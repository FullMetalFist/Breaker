//
//  GameViewController.swift
//  Breaker
//
//  Created by Michael Vilabrera on 6/27/16.
//  Copyright (c) 2016 Michael Vilabrera. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var scnView: SCNView!
    var scnScene: SCNScene!
    var game = GameHelper.sharedInstance
    
    var horizontalCameraNode: SCNNode!
    var verticalCameraNode: SCNNode!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        setupScene()
        setupNodes()
        setupSounds()
    }
    
    // 2
    func setupScene() {
        scnView = self.view as! SCNView
        scnView.delegate = self
        scnScene = SCNScene(named: "Breaker.scnassets/Scenes/Game.scn")
        scnView.scene = scnScene
    }
    
    func setupNodes() {
        scnScene.rootNode.addChildNode(game.hudNode)
    }
    
    func setupSounds() {
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

// 3
extension GameViewController: SCNSceneRendererDelegate {
    func renderer(renderer: SCNSceneRenderer, updateAtTime time: NSTimeInterval) {
        game.updateHUD()
    }
}

//
//  FirstLevel.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class GravityLevel : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;
        
        var label = NORLabelNode(fontNamed: "Helvetica")
        var action = AnimatableText.animateText(3, text: "Help! This box with supplies need to \n reach the other side of these pipes. \n\n This SPACE looks interesting...", label: label)
        label.runAction(action);
        label.position = CGPointMake(maxX/2, maxY/2)
        
        var obstacles = createWalls(frame);
        obstacles.append(label);
        
        return obstacles
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        return []
    }
    func createStart(frame:CGRect) -> SKNode{
        let startPosition = CGPoint(x: frame.maxX/2, y: 4*frame.maxY/5)
        let node = SKShapeNode(rectOfSize: CGSizeMake(100, 100))
        node.position = startPosition
        node.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(100, 100));
        node.fillColor = NSColor.greenColor()
        node.physicsBody?.dynamic = false;
        playerBox = node;
        return node;
    }
    func createFinish(frame:CGRect) -> SKNode{
        let victorySquare = SKShapeNode(rectOfSize: CGSizeMake(frame.maxX/5, frame.maxY/5))
        victorySquare.position.x = frame.maxX/2
        victorySquare.position.y = frame.maxY/5
        victorySquare.fillColor = NSColor.blueColor()
        victorySquare.alpha = 0.4
        return victorySquare
    }
    
    func startLevel() {
        playerBox?.physicsBody?.dynamic = true;
    }
    
    func isFieldAllowed(type: FieldTypes) -> Bool {
        return false;
    }

}
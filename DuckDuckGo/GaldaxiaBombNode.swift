//
//  GaldaxiaBombNode.swift
//  DuckDuckGo
//
//  Copyright © 2020 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import SpriteKit

extension Galdaxia {

    class BombNode: SKShapeNode {

        convenience init(startingAt position: CGPoint) {
            self.init(circleOfRadius: 15)
            self.position = position

            name = Const.bombName

            physicsBody = SKPhysicsBody(circleOfRadius: 15)
            physicsBody?.applyStandardConfiguration()
            physicsBody?.categoryBitMask = Const.collisionBombCategory
            physicsBody?.contactTestBitMask = Const.collisionDaxCategory

            let angle = Double.random(in: -360 ... 360)
            let radians = CGFloat(angle * Double.pi / 180)

            run(.group([
                .repeatForever(.rotate(byAngle: radians, duration: 1)),
                .sequence([ .moveTo(y: -100, duration: 3), .removeFromParent() ])
            ]))

            let cookie = SKLabelNode(text: "🍪")
            addChild(cookie)
            cookie.position.y -= 12
        }

    }

}

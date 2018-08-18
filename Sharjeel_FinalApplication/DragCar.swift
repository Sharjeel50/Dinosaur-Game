//
//  DragCar.swift
//  Sharjeel_FinalApplication
//
//  Created by sj15abm on 16/03/2018.
//  Copyright © 2018 CSStestuser. All rights reserved.
//

import UIKit



class DragCar: UIImageView {
    
    var myDelegate: subviewDelegate?
    
    var startLocation: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        startLocation = touches.first?.location(in: )(self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        self.center = CGPoint(x:self.center.x+dx, y:self.center.y+dy)
        
        let halfyCoordinates = self.bounds.midY
        center.y = max(halfyCoordinates + 50, center.y)
        center.y = min(self.superview!.bounds.size.height - halfyCoordinates, center.y)
        
        let halfxCoordinates = self.bounds.midX
        center.x = max(halfxCoordinates + 50, center.x)
        center.x = min(self.superview!.bounds.size.width - halfxCoordinates - 50, center.x)
        self.center = center
        
        self.myDelegate?.changeSomething()
        
    }

}

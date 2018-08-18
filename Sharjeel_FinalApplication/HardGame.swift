//
//  ViewController.swift
//  Sharjeel_FinalApplication
//
//  Created by sj15abm on 16/03/2018.
//  Copyright © 2018 CSStestuser. All rights reserved.
//

import UIKit
import AVFoundation

protocol subviewDelegate2 {
    func changeSomething()
}
class HardGame: UIViewController, subviewDelegate {
    
    @IBOutlet weak var ExplosionOnHit: UIImageView!
    @IBOutlet weak var Score: UILabel!
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehaviour: UIDynamicItemBehavior!
    var collisionBehavior: UICollisionBehavior!
    var Empty: [UIImageView] = []
    var scoreCounter = 0
    
    @IBOutlet weak var HardDraggingGozilla: HardDrag!
    
    //@IBOutlet weak var FallinCar: UIImageView!
    
    @IBOutlet weak var MovingRoadImages3: UIImageView!
    
    @IBOutlet weak var HardGozillaDrag: HardDrag!
    
    
    
    //@IBOutlet weak var DraggingGodzilla: UIImageView!
    
    //@IBOutlet weak var DragCar: DragCar!
    

    
    //@IBOutlet weak var DraggedCar: DragCar!
    
    
    var misslesArray = [0.4,0.8,1.0,1.4,1.8,2.2,2.6,3.0,3.4,3.8,4.2,4.6,5.0,5.4,5.8,6.2,6.4,6.8,7.2,7.6,8.0,8.4,8.8,9.2,9.6,10.0,10.4,10.8,11.2,11.6,12.0,12.4,12.8,13.2,13.6,14.0,14.4,14.8,15.2,15.6,16.0,16.4,16.8,17.2,17.6,18.0,18.4,18.8,19.2,0.4,0.8,1.0,1.4,1.8,2.2,2.6,3.0,3.4,3.8,]
    
    func random(_ range:Range<Int>) -> Int
    {
        return range.lowerBound + Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound)))
    }
    
    func carsfalling(){
        self.Score.isHidden = false
        for count in 0...57
        {
            
            let waiting = Double(self.misslesArray[count])
            let time = DispatchTime.now() + waiting
            
            
            DispatchQueue.main.asyncAfter(deadline: time){
                
                let rand = Int(arc4random_uniform(5))
                let Misslefalling = UIImageView(image:nil)
                
                switch rand{
                case 1: Misslefalling.image = UIImage(named: "Missle1.fw.png")
                case 2: Misslefalling.image = UIImage(named: "Missle2.fw.png")
                case 3: Misslefalling.image = UIImage(named: "Missle3.fw.png")
                case 4: Misslefalling.image = UIImage(named: "Missle4.fw.png")
                case 5: Misslefalling.image = UIImage(named: "Missle5.fw.png")
                case 6: Misslefalling.image = UIImage(named: "Missle6.fw.png")
                default: Misslefalling.image = UIImage(named: "Missle1.fw.png")
                    
                }
                self.Empty.append(Misslefalling)
                //Misslefalling.image = rand[count]
                Misslefalling.frame = CGRect(x: self.random(40..<300), y: 0, width: 30 , height: 50)
                
                self.view.addSubview(Misslefalling)
                self.view.bringSubview(toFront: Misslefalling)
                
                
                self.dynamicItemBehaviour.addItem(Misslefalling)
                self.dynamicItemBehaviour.addLinearVelocity(CGPoint(x: 0, y: self.random(200..<350)), for: Misslefalling)
                
                self.collisionBehavior.addItem(Misslefalling)
                //self.collisionBehavior.translatesReferenceBoundsIntoBoundary = true
                
                
                
                //self.dynamicAnimator.addBehavior(self.dynamicItemBehaviour)
                self.collisionBehavior.addItem(Misslefalling)
                
                
                //print(index)
                
                //self.collisionBehavior.addItem(Misslefalling)
                //self.dynamicAnimator.addBehavior(self.collisionBehavior)
                self.scoreCounter = self.scoreCounter + 10
                self.Score.text = "Score: " + (String(self.scoreCounter))

                
            }
        }
    }
    
    
    func changeSomething() {
        collisionBehavior.removeAllBoundaries()
        collisionBehavior.addBoundary(withIdentifier: "Collision Gooooozilla" as NSCopying, for: UIBezierPath(rect: HardGozillaDrag.frame) )
        
        for count in Empty{
            if (HardGozillaDrag.frame.intersects(count.frame)){
                if(scoreCounter > 1){
                    scoreCounter = scoreCounter - 2
                    self.Score.text = "Score: " + (String(self.scoreCounter))
                }
                
                count.removeFromSuperview()
                
                var Explosion: [UIImage]!
                
                Explosion = [UIImage(named:"frame_00_delay-0.08s.png")!,
                             UIImage(named:"frame_01_delay-0.08s.png")!,
                             UIImage(named:"frame_02_delay-0.08s.png")!,
                             UIImage(named:"frame_03_delay-0.08s.png")!,
                             UIImage(named:"frame_04_delay-0.08s.png")!,
                             UIImage(named:"frame_05_delay-0.08s.png")!,
                             UIImage(named:"frame_06_delay-0.04s.png")!,
                             UIImage(named:"frame_07_delay-0.08s.png")!,
                             UIImage(named:"frame_08_delay-0.08s.png")!,
                             UIImage(named:"frame_09_delay-0.08s.png")!]
                //                      UIImage(named:"frame_00_delay-0.08s.png")!,
                //                      UIImage(named:"frame_00_delay-0.08s.png")!,
                //                      UIImage(named:"frame_00_delay-0.08s.png")!,
                //                      UIImage(named:"frame_00_delay-0.08s.png")!]
                
                self.view.bringSubview(toFront: ExplosionOnHit)
                ExplosionOnHit.image = UIImage.animatedImage(with: Explosion, duration: 1.0)
                ExplosionOnHit.frame = CGRect(x:HardGozillaDrag.center.x, y: HardGozillaDrag.center.y, width: 100 , height: 120)
                
                
                let time = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: time){
                    
                    //self.ExplosionsOnHit.removeFromSuperview()
                    
                    self.view.sendSubview(toBack: self.ExplosionOnHit)
                }
            }
        }
    }
    
    var bombSoundEffect: AVAudioPlayer?
    
    func onHitExplosion() {
        
        let path = Bundle.main.path(forResource: "all.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
        
    }
    
    func Timer(){
        let time = DispatchTime.now() + 20
        DispatchQueue.main.asyncAfter(deadline: time){
            
            let over = self.storyboard?.instantiateViewController(withIdentifier: "GameOverscreenViewController") as! GameOverScreenViewController
            
            over.passingScore = self.Score.text!
            
            self.show(over, sender: nil)
            self.Score.text = "SCORE" + String(self.scoreCounter)
            self.Score.isHidden = false
            self.view.addSubview(self.Score)
            self.view.bringSubview(toFront: self.Score)
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HardGozillaDrag.myDelegate = self
        onHitExplosion()
        
        Timer()
        carsfalling()
        
        var imageArray: [UIImage]!
        
        imageArray = [UIImage(named:"Road1.fw.png")!,
                      UIImage(named:"Road2.fw.png")!,
                      UIImage(named:"Road3.fw.png")!,
                      UIImage(named:"Road4.fw.png")!,
                      UIImage(named:"Road5.fw.png")!,
                      UIImage(named:"Road6.fw.png")!,
                      UIImage(named:"Road7.fw.png")!,
                      UIImage(named:"Road8.fw.png")!,
                      UIImage(named:"Road9.fw.png")!,
                      UIImage(named:"Road10.fw.png")!,
                      UIImage(named:"Road11.fw.png")!,
                      UIImage(named:"Road12.fw.png")!,
                      UIImage(named:"Road13.fw.png")!,
                      UIImage(named:"Road14.fw.png")!]
        //                      UIImage(named:"road15.png")!,
        //                      UIImage(named:"road16.png")!,
        //                      UIImage(named:"road17.png")!,
        //                      UIImage(named:"road18.png")!,
        //                      UIImage(named:"road19.png")!,
        //                      UIImage(named:"road20.png")!]
        
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        MovingRoadImages3.image = UIImage.animatedImage(with: imageArray, duration: 2.0)
        MovingRoadImages3.frame = UIScreen.main.bounds
        
        
        var draggedGodzilla: [UIImage]!
        
        draggedGodzilla = [UIImage(named:"Godzilla1.fw.png")!,
                           UIImage(named:"Godzilla2.fw.png")!,
                           UIImage(named:"Godzilla3.fw.png")!,
                           UIImage(named:"Godzilla4.fw.png")!]
        
        
        
        HardDraggingGozilla.image = UIImage.animatedImage(with: draggedGodzilla, duration: 0.5)
        //  DraggingGodzilla.frame = UIScreen.main.bounds
        HardDraggingGozilla.frame = CGRect(x:130, y: 400, width: 50 , height: 80)
        
        
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        self.collisionBehavior = UICollisionBehavior(items: [])
        self.dynamicItemBehaviour = UIDynamicItemBehavior(items:[])
        self.dynamicAnimator.addBehavior(self.collisionBehavior)
        self.dynamicAnimator.addBehavior(self.dynamicItemBehaviour)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



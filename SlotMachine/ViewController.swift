//
//  ViewController.swift
//  SlotMachine
//
//  Created by Rizwan Javaid on 10/13/14.
//  Copyright (c) 2014 Rizwan Javaid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstContainer:UIView!
    var secondContainer:UIView!
    var thirdContainer:UIView!
    var fourthContainer:UIView!
    
    var titleLabel:UILabel!
    
    // Information Labels
    
    var creditsLabel:UILabel!
    var betLabel:UILabel!
    var winnerPaidLabel:UILabel!
    
    var creditsTitleLabel:UILabel!
    var betTitleLabel:UILabel!
    var winnerPaidTitleLabel:UILabel!
    
    
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 2.0
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0
    let kHalf:CGFloat = 1.0/2.0
    let kEighth:CGFloat = 1.0/8.0
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    
    var resetButton:UIButton!
    var betOneButton:UIButton!
    var betMaxButton:UIButton!
    var spinButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupContainerViews()
        self.setupFirstContainer(self.firstContainer)
        self.setupSecondContainer(self.secondContainer)
        self.setupThirdContainer(self.thirdContainer)
        self.setupFourthContainerView(self.fourthContainer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView,
                                                   y: self.view.bounds.origin.y,
                                               width: self.view.bounds.width - (kMarginForView * 2),
                                              height: self.view.bounds.height * kSixth))
        
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView,
                                                    y: firstContainer.frame.height,
                                                width: self.view.bounds.width - (kMarginForView * 2),
                                               height: self.view.bounds.height * (3 * kSixth)))
        
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView,
                                                   y: firstContainer.frame.height + secondContainer.frame.height,
                                               width: self.view.bounds.width - (kMarginForView * 2),
                                              height: self.view.bounds.height * kSixth))
        
        self.thirdContainer.backgroundColor = UIColor.grayColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView,
                                                    y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height,
                                                width: self.view.bounds.width - (kMarginForView * 2),
                                               height: self.view.bounds.height * kSixth))
        
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    
    }
    
    func setupFirstContainer(containerView: UIView){
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(containerView: UIView){
    
        for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
            
            for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
                
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird),
                                             y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird),
                                         width: containerView.bounds.width * kThird - kMarginForSlot,
                                        height: containerView.bounds.height * kThird - kMarginForSlot)
                containerView.addSubview(slotImageView)
            }
            
        }
    }
    
    func setupThirdContainer(containerView: UIView) {
        
        for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
        
            self.creditsLabel = UILabel()
            self.creditsLabel.text = "000000"
            self.creditsLabel.textColor = UIColor.redColor()
            self.creditsLabel.font = UIFont(name: "Menlo", size: 16)
            self.creditsLabel.sizeToFit()
            self.creditsLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird)
            self.creditsLabel.textAlignment = NSTextAlignment.Center
            self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
            containerView.addSubview(self.creditsLabel)
            
            self.creditsTitleLabel = UILabel()
            self.creditsTitleLabel.text = "Credits"
            self.creditsTitleLabel.textColor = UIColor.blackColor()
            self.creditsTitleLabel.font = UIFont(name: "American Typewriter", size: 16)
            self.creditsTitleLabel.sizeToFit()
            self.creditsTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * (2 * kThird))
            self.creditsTitleLabel.textAlignment = NSTextAlignment.Center
            containerView.addSubview(self.creditsTitleLabel)
            
            self.betLabel = UILabel()
            self.betLabel.text = "000000"
            self.betLabel.textColor = UIColor.redColor()
            self.betLabel.font = UIFont(name: "Menlo", size: 16)
            self.betLabel.sizeToFit()
            self.betLabel.center = CGPoint(x: containerView.frame.width * 3 * kSixth, y: containerView.frame.height * kThird)
            self.betLabel.textAlignment = NSTextAlignment.Center
            self.betLabel.backgroundColor = UIColor.darkGrayColor()
            containerView.addSubview(self.betLabel)
            
            self.betTitleLabel = UILabel()
            self.betTitleLabel.text = "Bet"
            self.betTitleLabel.textColor = UIColor.blackColor()
            self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 16)
            self.betTitleLabel.sizeToFit()
            self.betTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird * 2)
            containerView.addSubview(self.betTitleLabel)
            
            self.winnerPaidLabel = UILabel()
            self.winnerPaidLabel.text = "00000"
            self.winnerPaidLabel.textColor = UIColor.redColor()
            self.winnerPaidLabel.font = UIFont(name: "Menlo", size: 16)
            self.winnerPaidLabel.sizeToFit()
            self.winnerPaidLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird)
            self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
            self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
            containerView.addSubview(self.winnerPaidLabel)
            
            self.winnerPaidTitleLabel = UILabel()
            self.winnerPaidTitleLabel.text = "Winner Paid"
            self.winnerPaidTitleLabel.textColor = UIColor.blackColor()
            self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size:16)
            self.winnerPaidTitleLabel.sizeToFit()
            self.winnerPaidTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird * 2)
            containerView.addSubview(self.winnerPaidTitleLabel)

            
        
        }
        
        
    }
    
    
    func setupFourthContainerView(containerView:UIView){
        
        self.resetButton = UIButton()
        self.resetButton.backgroundColor = UIColor.grayColor()
        self.resetButton.setTitle("Reset", forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        self.resetButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kHalf)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.resetButton)
        
        self.betOneButton = UIButton()
        self.betOneButton.backgroundColor = UIColor.greenColor()
        self.betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        self.betOneButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPoint(x: containerView.frame.width * kEighth * 3, y: containerView.frame.height * kHalf)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betOneButton)
        
        self.betMaxButton = UIButton()
        self.betMaxButton.backgroundColor = UIColor.redColor()
        self.betMaxButton.setTitle("Bet Max", forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        self.betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPoint(x: containerView.frame.width * kEighth * 5, y: containerView.frame.height * kHalf)
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betMaxButton)
        
        self.spinButton = UIButton()
        self.spinButton.backgroundColor = UIColor.greenColor()
        self.spinButton.setTitle("Spin", forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        self.spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPoint(x: containerView.frame.width * kEighth * 7, y: containerView.frame.height * kHalf)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.spinButton)
    }
    
    func resetButtonPressed (button:UIButton){
    
        println("Reset Button Pressed")
    
    }
    
    func betOneButtonPressed (button:UIButton){
    
        println("Bet One Button Pressed")
    }
    
    func betMaxButtonPressed (button:UIButton){
        println("Bet Max Button Pressed")
    }
    
    func spinButtonPressed (button:UIButton){
        println("Spin Button Pressed")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


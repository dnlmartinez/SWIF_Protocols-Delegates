//
//  ViewController.swift
//  Protocols&Delegates
//
//  Created by daniel martinez gonzalez on 18/9/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController , SomethingDelegate
{
    private var helper = SomethingHelper(intervalInSec: Double(2.0))

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.helper.delegate = self;
        self.helper.start()
    }
    
    
    
    //MARK : DELEGATE 
    
    func didUpdateSomething(somethingHelper: SomethingHelper)
    {
        print("TIMER: \(NSDate.timeIntervalSinceReferenceDate())")
    }

}


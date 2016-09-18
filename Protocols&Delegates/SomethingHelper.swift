//
//  SomethingHelper.swift
//  Protocols&Delegates
//
//  Created by daniel martinez gonzalez on 18/9/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import Foundation
import UIKit

protocol SomethingDelegate
{
    func didUpdateSomething(somethingHelper:SomethingHelper)
}


class SomethingHelper
{
    private var timer : dispatch_source_t! = nil
    private var currentIntervalInSec = 0;
    
    var delegate: SomethingDelegate?
    
    required init(intervalInSec:Double)
    {
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
        dispatch_source_set_timer(self.timer, dispatch_time(DISPATCH_TIME_NOW, 0), UInt64(intervalInSec*Double(NSEC_PER_SEC)), 0)
    
        dispatch_source_set_event_handler(self.timer,
        {
            self.delegate?.didUpdateSomething(self)
        });
    }
    deinit
    {
        stop()
    }
    
    
    func start()
    {
        dispatch_resume(self.timer)
    }
    
    func stop()
    {
        dispatch_suspend(self.timer)
    }
    
}
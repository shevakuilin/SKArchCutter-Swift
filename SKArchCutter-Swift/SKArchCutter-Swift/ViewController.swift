//
//  ViewController.swift
//  SKArchCutter-Swift
//
//  Created by shevchenko on 17/4/5.
//  Copyright © 2017年 shevchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = UIView.init()
        self.view.addSubview(myView)
        myView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 100, height: 100))
        }
        SKArchCutter_Swift.cuttingView(view: view, direction: UIRectCorner.allCorners, cornerRadii: myView.frame.size.height / 2, borderWidth: 1, borderColor: UIColor.black, backgroundColor: UIColor.red)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


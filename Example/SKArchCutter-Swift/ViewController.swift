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
        // 切割UIView
        SKArchCutter_Swift.cuttingView(view: myView, direction: [UIRectCorner.topRight, UIRectCorner.topLeft], cornerRadii: myView.frame.size.height / 2, borderWidth: 1, borderColor: UIColor.black, backgroundColor: UIColor.red)
        
        let myImageView = UIImageView.init()
        self.view.addSubview(myImageView)
        myImageView.image = UIImage.init(named: "lena2")
        myImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(20)
            make.centerX.equalTo(self.view)
            
            make.size.equalTo(CGSize.init(width: 100, height: 100))
        }
        // 切割UIImageView
        SKArchCutter_Swift.cuttingImageView(imageView: myImageView, direction: UIRectCorner.allCorners, cornerRadii: myImageView.frame.size.height / 2, borderWidth: 1, borderColor: UIColor.purple, backgroundColor: UIColor.clear)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


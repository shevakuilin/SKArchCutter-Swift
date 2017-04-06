//
//  SKArchCutter-Swift.swift
//  SKArchCutter-Swift
//
//  Created by shevchenko on 17/4/5.
//  Copyright © 2017年 shevchenko. All rights reserved.
//
import Foundation
import UIKit

class SKArchCutter_Swift: NSObject {
    
    /** 切割UIView、UIButton和UILabel圆角
     * @param view 需要进行切割的对象
     * @param direction 切割的方向
     * @param cornerRadii 圆角半径
     * @param borderWidth 边框宽度
     * @param borderColor 边框颜色
     * @param backgroundColor 背景色
     */
    class func cuttingView(view: UIView, direction: UIRectCorner, cornerRadii: CGFloat, borderWidth: CGFloat, borderColor: UIColor, backgroundColor: UIColor)
    {
        var cornerRadii = cornerRadii
        if view.bounds.size.height != 0 && view.bounds.size.width != 0 {
            let width = view.bounds.size.width
            let height = view.bounds.size.height
            var image : UIImage? = nil
            
            UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
            let currentContext = UIGraphicsGetCurrentContext()
            
            if (currentContext != nil) {
                currentContext?.setFillColor(backgroundColor.cgColor)// 设置填充颜色
                currentContext?.setStrokeColor(borderColor.cgColor)// 设置画笔颜色
                
                if cornerRadii == 0 {
                    cornerRadii = view.bounds.size.height / 2
                }
                // 单切圆角
                if direction == UIRectCorner.allCorners {
                    currentContext?.move(to: CGPoint.init(x: width - borderWidth, y: cornerRadii + borderWidth))// 从右下开始
                    currentContext?.addArc(tangent1End: CGPoint.init(x: width - borderWidth, y: height - borderWidth), tangent2End: CGPoint.init(x: width - cornerRadii - borderWidth, y: height - borderWidth), radius: cornerRadii)
                    currentContext?.addArc(tangent1End: CGPoint.init(x: borderWidth, y: height - borderWidth), tangent2End: CGPoint.init(x: borderWidth, y: height - cornerRadii - borderWidth), radius: cornerRadii)
                    currentContext?.addArc(tangent1End: CGPoint.init(x: borderWidth, y: borderWidth), tangent2End: CGPoint.init(x: width - borderWidth, y: borderWidth), radius: cornerRadii)
                    currentContext?.addArc(tangent1End: CGPoint.init(x: width - borderWidth, y: borderWidth), tangent2End: CGPoint.init(x: width - borderWidth, y:  cornerRadii + borderWidth), radius: cornerRadii)
                    
                } else {
                    currentContext?.move(to: CGPoint.init(x: cornerRadii + borderWidth, y: borderWidth))// 从左上开始
                    if direction.contains(UIRectCorner.topLeft) {
                        currentContext?.addArc(tangent1End: CGPoint.init(x: borderWidth, y: borderWidth), tangent2End: CGPoint.init(x: borderWidth, y: cornerRadii + borderWidth), radius: cornerRadii)
                    } else {
                        currentContext?.addLine(to: CGPoint.init(x: borderWidth, y: borderWidth))
                    }
                    if direction.contains(UIRectCorner.bottomLeft) {
                        currentContext?.addArc(tangent1End: CGPoint.init(x: borderWidth, y: height - borderWidth), tangent2End: CGPoint.init(x: borderWidth + cornerRadii, y: height - borderWidth), radius: cornerRadii)
                    } else {
                        currentContext?.addLine(to: CGPoint.init(x: borderWidth, y: height - borderWidth))
                    }
                    if direction.contains(UIRectCorner.bottomRight) {
                        currentContext?.addArc(tangent1End: CGPoint.init(x: width - borderWidth, y: height - borderWidth), tangent2End: CGPoint.init(x: width - borderWidth, y: height - borderWidth - cornerRadii), radius: cornerRadii)
                    } else {
                        currentContext?.addLine(to: CGPoint.init(x: width - borderWidth, y: height - borderWidth))
                    }
                    if direction.contains(UIRectCorner.topRight) {
                        currentContext?.addArc(tangent1End: CGPoint.init(x: width - borderWidth, y: borderWidth), tangent2End: CGPoint.init(x: width - borderWidth - cornerRadii, y: borderWidth), radius: cornerRadii)
                    } else {
                        currentContext?.addLine(to: CGPoint.init(x: height - borderWidth, y: borderWidth))
                    }
                    currentContext?.addLine(to: CGPoint.init(x: borderWidth + cornerRadii, y: borderWidth))
                    
                    currentContext?.drawPath(using: .fillStroke)
                    image = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                }
                if (image?.isKind(of: UIImage.self as AnyClass))! {
                    let baseImageView = UIImageView.init(image: image)
                    view.insertSubview(baseImageView, at: 0)
                }
            }
        } else {
            DispatchQueue.main.async {
                self.cuttingView(view: view, direction: direction, cornerRadii: cornerRadii, borderWidth: borderWidth, borderColor: borderColor, backgroundColor: backgroundColor)
            }
        }
    }
    
    /** 切割UIImageView圆角
     * @param imageView 需要进行切割的对象
     * @param direction 切割的方向
     * @param cornerRadii 圆角半径
     * @param borderWidth 边框宽度
     * @param borderColor 边框颜色
     * @param backgroundColor 背景色
     */
    class func cuttingImageView(imageView: UIImageView, direction: UIRectCorner, cornerRadii: CGFloat, borderWidth: CGFloat, borderColor: UIColor, backgroundColor: UIColor)
    {
        var cornerRadii = cornerRadii
        if imageView.bounds.size.height != 0 && imageView.bounds.size.width != 0 {
           var image : UIImage? = nil
            if (imageView.image != nil) {
                image = imageView.image
            }
            if cornerRadii == 0 {
                cornerRadii = imageView.bounds.size.height / 2
            }
            let rect = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: imageView.bounds.size.width, height: imageView.bounds.size.height))
            UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
            let currentContext = UIGraphicsGetCurrentContext()
            if (currentContext != nil) {
                let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners: direction, cornerRadii: CGSize.init(width: cornerRadii - borderWidth, height: cornerRadii - borderWidth))
                currentContext?.addPath(path as! CGPath)
                currentContext?.clip()
                
                image?.draw(in: rect)
                borderColor.setStroke()// 画笔颜色
                backgroundColor.setFill()
                path.stroke()
                path.fill()
                image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
            }
            if (image?.isKind(of: UIImage.self))! {
                imageView.image = image
            } else {
                DispatchQueue.main.async {
                    self.cuttingImageView(imageView: imageView, direction: direction, cornerRadii: cornerRadii, borderWidth: borderWidth, borderColor: borderColor, backgroundColor: backgroundColor)
                }
            }
        } else {
            DispatchQueue.main.async {
                self.cuttingImageView(imageView: imageView, direction: direction, cornerRadii: cornerRadii, borderWidth: borderWidth, borderColor: borderColor, backgroundColor: backgroundColor)
            }

        }
        
    }

}

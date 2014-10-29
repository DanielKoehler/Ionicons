//
//  Ionicon.swift
//  Timetabler
//
//  Created by Daniel Koehler on 29/10/2014.
//  Copyright (c) 2014 DanielKoehler. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore
import CoreText

public class Ionicons: NSObject {
    

    public class func fontWithSize(size:CGFloat) -> UIFont {
        
        
        var font = UIFont(name:"ionicons", size: size)
        
        if(font ==  nil){
            
            var path = NSBundle(forClass: self.classForCoder()).pathForResource("ionicons", ofType: "ttf")
            
            var inData = NSData(contentsOfFile:path!)
    
            
            var provider = CGDataProviderCreateWithCFData(inData);
            
            var f = CGFontCreateWithDataProvider(provider);
            
            if (!CTFontManagerRegisterGraphicsFont(f!, nil)) {
                
                NSLog("Failed to load font");

            }
            
            font = UIFont(name:"ionicons", size: size)
            
        }
        
        return font!
        
    }
    
    public class func label(inout label:UILabel,  setIcon ionicon:Ionicon, size: CGFloat, color: UIColor, sizeToFit shouldSizeToFit:Bool)  {
    
        label.font = self.fontWithSize(size);
        label.text = ionicon.rawValue;
        label.textColor = color;
        
        label.backgroundColor = UIColor.clearColor();
        
        if (shouldSizeToFit) {
            label.sizeToFit()
        }
        // NOTE: ionicons will be silent through VoiceOver, but the Label is still selectable through VoiceOver. This can cause a usability issue because a visually impaired user might navigate to the label but get no audible feedback that the navigation happened. So hide the label for VoiceOver by default - if your label should be descriptive, un-hide it explicitly after creating it, and then set its accessibiltyLabel.
        label.accessibilityElementsHidden = true;
        
    }
    
    
    public class func labelWithIcon(#iconName:Ionicon, size: CGFloat, color: UIColor) -> UILabel {
    
        var label = UILabel()
        self.label(&label, setIcon: iconName, size: size, color: color, sizeToFit: true)
        return label
        
    }
    
    public class func imageWithIcon(iconName:Ionicon, size: CGFloat, color: UIColor) -> UIImage {
        
        return Ionicons.imageWithIcon(iconName: iconName,  iconSize:size,  iconColour: color, imageSize: CGSizeMake(size, size));
        
    }
    
    public class func imageWithIcon(#iconName:Ionicon, iconSize: CGFloat, iconColour: UIColor = UIColor.blackColor(), imageSize: CGSize) -> UIImage {
        
        if ((UIDevice.currentDevice().systemVersion as NSString).floatValue < 6) {
            NSLog("[ IonIcons ] Incompatible system version.")
            return UIImage()
        }
        
        var style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.Left
        style.baseWritingDirection = NSWritingDirection.LeftToRight
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0);
        
        var attString = NSAttributedString(string: iconName.rawValue, attributes: [NSFontAttributeName:  Ionicons.fontWithSize(iconSize), NSForegroundColorAttributeName: iconColour, NSParagraphStyleAttributeName: style])
        
        // get the target bounding rect in order to center the icon within the UIImage:
        var ctx = NSStringDrawingContext()
        var boundingRect = attString.boundingRectWithSize(CGSizeMake(iconSize, iconSize), options: NSStringDrawingOptions(rawValue: 0)!, context: ctx)
        
        attString.drawInRect(CGRectMake((imageSize.width/2.0) - boundingRect.size.width/2.0, (imageSize.height/2.0) - boundingRect.size.height/2.0, imageSize.width, imageSize.height))
        
        var iconImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if(iconImage.respondsToSelector(Selector("imageWithRenderingMode:"))){
            iconImage = iconImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        }
        
        return iconImage
        
    }
}

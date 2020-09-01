//
//  Extensions.swift
//  Instagram
//
//  Created by Nikita Kalje on 8/20/20.
//  Copyright © 2020 Nikita Kalje. All rights reserved.
//

import UIKit

extension UIView {
    
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public var left: CGFloat {
        return frame.origin.x
    }
    
    public var right: CGFloat {
        return frame.origin.x+frame.size.width
    }
}

extension String {
    func safeDatabaseKey() -> String {
        //return self.replacingOccurrences(of: "@", with: "-")
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
}

//
//  CandleChartDataEntry.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation

open class WaterFallChartDataEntry: ChartDataEntry
{
    /// close value
    @objc open var close = Double(0.0)
    
    /// open value
    @objc open var open = Double(0.0)
    
    public required init()
    {
        super.init()
    }
    
    @objc public init(x: Double, open: Double, close: Double)
    {
        super.init(x: x, y: (open + close) / 2.0)
        
        self.open = open
        self.close = close
    }
    
    @objc public init(x: Double, open: Double, close: Double, data: AnyObject?)
    {
        super.init(x: x, y: (open + close) / 2.0, data: data)
        
        self.open = open
        self.close = close
    }
    
    @objc public init(x: Double, open: Double, close: Double, icon: NSUIImage?)
    {
        super.init(x: x, y: (open + close) / 2.0, icon: icon)
        
        self.open = open
        self.close = close
    }
    
    @objc public init(x: Double, shadowH: Double, shadowL: Double, open: Double, close: Double, icon: NSUIImage?, data: AnyObject?)
    {
        super.init(x: x, y: (open + close) / 2.0, icon: icon, data: data)
        
        self.open = open
        self.close = close
    }
    
    /// - returns: The body size (difference between open and close).
    @objc open var bodyRange: Double
    {
        return abs(open - close)
    }
    
    /// the center value of the candle. (Middle value between high and low)
    open override var y: Double
    {
        get
        {
            return super.y
        }
        set
        {
            super.y = (open + close) / 2.0
        }
    }
    
    // MARK: NSCopying
    
    open override func copyWithZone(_ zone: NSZone?) -> AnyObject
    {
        let copy = super.copyWithZone(zone) as! WaterFallChartDataEntry
        copy.open = open
        copy.close = close
        return copy
    }
}

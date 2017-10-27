//
//  ICandleChartDataSet.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

@objc
public protocol IWaterFallChartDataSet: ILineScatterCandleRadarChartDataSet
{
    // MARK: - Data functions and accessors
    
    // MARK: - Styling functions and accessors
    var showCandleBar: Bool { get set }
    
    /// the space that is left out on the left and right side of each candle,
    /// **default**: 0.1 (10%), max 0.45, min 0.0
    var barSpace: CGFloat { get set }
    
    /// color for open == close
    var neutralColor: NSUIColor? { get set }
    
    /// color for open > close
    var increasingColor: NSUIColor? { get set }
    
    /// color for open < close
    var decreasingColor: NSUIColor? { get set }
    
    /// Are increasing values drawn as filled?
    var increasingFilled: Bool { get set }
    
    /// Are increasing values drawn as filled?
    var isIncreasingFilled: Bool { get }
    
    /// Are decreasing values drawn as filled?
    var decreasingFilled: Bool { get set }
    
    /// Are decreasing values drawn as filled?
    var isDecreasingFilled: Bool { get }
}

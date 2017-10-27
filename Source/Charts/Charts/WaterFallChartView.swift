//
//  WaterFallChartView.swift
//  Charts
//
//  Created by Marcos Vinicius da Cunha Brito on 26/10/17.
//

import Foundation
import CoreGraphics

class WaterFallChartView: BarLineChartViewBase, WaterFallChartDataProvider
{
    internal override func initialize()
    {
        super.initialize()
        
        renderer = WaterFallChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
        
        self.xAxis.spaceMin = 0.5
        self.xAxis.spaceMax = 0.5
    }
    
    // MARK: - CandleChartDataProvider
    
    open var waterFallData: WaterFallChartData?
    {
        return _data as? WaterFallChartData
    }
}


import Foundation
import CoreGraphics

@objc
public protocol WaterFallChartDataProvider: BarLineScatterCandleBubbleChartDataProvider
{
    var waterFallData: WaterFallChartData? { get }
}

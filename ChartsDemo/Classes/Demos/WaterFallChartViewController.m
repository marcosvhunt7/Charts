//
//  WaterFallViewController.m
//  ChartsDemo
//
//  Created by Marcos Vinicius da Cunha Brito on 26/10/17.
//  Copyright © 2017 dcg. All rights reserved.
//

#import "WaterFallChartViewController.h"
#import "ChartsDemo-Swift.h"

@interface WaterFallChartViewController () <ChartViewDelegate>

@property (nonatomic, strong) IBOutlet WaterFallChartView *chartView;
@property (nonatomic, strong) IBOutlet UISlider *sliderX;
@property (nonatomic, strong) IBOutlet UISlider *sliderY;
@property (nonatomic, strong) IBOutlet UITextField *sliderTextX;
@property (nonatomic, strong) IBOutlet UITextField *sliderTextY;

@end

@implementation WaterFallChartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"WaterFall Stick Chart";
    
    self.options = @[
                     @{@"key": @"toggleValues", @"label": @"Toggle Values"},
                     @{@"key": @"toggleIcons", @"label": @"Toggle Icons"},
                     @{@"key": @"toggleHighlight", @"label": @"Toggle Highlight"},
                     @{@"key": @"animateX", @"label": @"Animate X"},
                     @{@"key": @"animateY", @"label": @"Animate Y"},
                     @{@"key": @"animateXY", @"label": @"Animate XY"},
                     @{@"key": @"saveToGallery", @"label": @"Save to Camera Roll"},
                     @{@"key": @"togglePinchZoom", @"label": @"Toggle PinchZoom"},
                     @{@"key": @"toggleAutoScaleMinMax", @"label": @"Toggle auto scale min/max"},
                     @{@"key": @"toggleData", @"label": @"Toggle Data"},
                     ];
    
    _chartView.delegate = self;
    
    _chartView.chartDescription.enabled = NO;
    
    _chartView.maxVisibleCount = 60;
    _chartView.pinchZoomEnabled = NO;
    _chartView.drawGridBackgroundEnabled = NO;
    
    ChartXAxis *xAxis = _chartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.drawGridLinesEnabled = NO;
    
    ChartYAxis *leftAxis = _chartView.leftAxis;
    leftAxis.labelCount = 7;
    leftAxis.drawGridLinesEnabled = NO;
    leftAxis.drawAxisLineEnabled = NO;
    
    ChartYAxis *rightAxis = _chartView.rightAxis;
    rightAxis.enabled = NO;
    
    _chartView.legend.enabled = NO;
    
    _sliderX.value = 40.0;
    _sliderY.value = 100.0;
    [self slidersValueChanged:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateChartData
{
    if (self.shouldHideData)
    {
        _chartView.data = nil;
        return;
    }
    
    [self setDataCount:_sliderX.value + 1 range:_sliderY.value];
}

- (void)setDataCount:(int)count range:(double)range
{
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    NSMutableArray * dataSets = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; i++)
    {
        double mult = (range + 1);
        double val = (double) (arc4random_uniform(40)) + mult;
        double open = (double) (arc4random_uniform(6)) + 1.0;
        double close = (double) (arc4random_uniform(6)) + 1.0;
        BOOL even = i % 2 == 0;
        WaterFallChartDataEntry *dataEntry = [[WaterFallChartDataEntry alloc] initWithX:i open:even ? val + open : val - open close:even ? val - close : val + close icon: [UIImage imageNamed:@"icon"]];
        [yVals addObject:dataEntry];
        
        WaterFallChartDataSet *set = [[WaterFallChartDataSet alloc] initWithValues:yVals label:@"Data Set"];
        set.axisDependency = AxisDependencyLeft;
        [set setColor:[UIColor colorWithWhite:80/255.f alpha:1.f]];
        
        set.drawIconsEnabled = NO;
        
        
        set.decreasingColor = UIColor.redColor;
        set.decreasingFilled = YES;
        set.increasingColor = [UIColor colorWithRed:122/255.f green:242/255.f blue:84/255.f alpha:1.f];
        set.increasingFilled = YES;
        set.neutralColor = UIColor.blueColor;
        
        [dataSets addObject:set];
    }
    
    
    
    WaterFallChartData *data = [[WaterFallChartData alloc] initWithDataSets:dataSets];//[[WaterFallChartData alloc] initWithDataSet:set1];
    
    _chartView.data = data;
}

- (void)optionTapped:(NSString *)key
{
    [super handleOption:key forChartView:_chartView];
}

#pragma mark - Actions

- (IBAction)slidersValueChanged:(id)sender
{
    _sliderTextX.text = [@((int)_sliderX.value) stringValue];
    _sliderTextY.text = [@((int)_sliderY.value) stringValue];
    
    [self updateChartData];
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}

@end

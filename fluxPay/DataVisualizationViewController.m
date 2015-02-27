//
//  DataVisualizationViewController.m
//  fluxPay
//
//  Created by Rameez Remsudeen  on 2/25/15.
//  Copyright (c) 2015 Rameez Remsudeen. All rights reserved.
//

#import "DataVisualizationViewController.h"
#import <ANDLineChartView.h>

#define MAX_NUMBER_COUNT 20

#define MAX_NUMBER 20

@interface DataVisualizationViewController ()

@end

@implementation DataVisualizationViewController
{
    ANDLineChartView *_chartView;
    NSArray *_elements;
    NSUInteger _numbersCount;
    NSUInteger _maxValue;


}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    _chartView = [[ANDLineChartView alloc] initWithFrame:CGRectZero];
    [_chartView setDataSource:self];
    [_chartView setDelegate:self];
    [_chartView setAnimationDuration:0.4];
    [self.view addSubview:_chartView];
    
    _elements = [self arrayWithRandomNumbers];

    
    return self;

}

- (NSArray*)arrayWithRandomNumbers{
    _numbersCount = MAX_NUMBER_COUNT;//arc4random_uniform(MAX_NUMBER_COUNT + 1) + 1;
    _maxValue = MAX_NUMBER;//arc4random_uniform(MAX_NUMBER + 1);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:_numbersCount];
    for(NSUInteger i = 0;i<_numbersCount;i++){
        NSUInteger r = arc4random_uniform(_maxValue + 1);
        [array addObject:@(r)];
    }
    return array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _graphView.delegate = self;
    _graphView.dataSource = self;
    
    _chartView = [[ANDLineChartView alloc] initWithFrame:_graphView.frame];
    [_chartView setDataSource:self];
    [_chartView setDelegate:self];
    [_chartView setAnimationDuration:0.4];
    [self.view addSubview:_chartView];
    [self randomizeElements];

    
}

- (void)randomizeElements{
    __weak DataVisualizationViewController *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _elements = [self arrayWithRandomNumbers];
        [_chartView reloadData];
        [weakSelf randomizeElements];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)numberOfElementsInChartView:(ANDLineChartView *)chartView
{
    return _numbersCount;
}

-(NSString *)chartView:(ANDLineChartView *)chartView descriptionForGridIntervalValue:(CGFloat)interval
{
    return [NSString stringWithFormat:@"%.1f",interval];
}

-(CGFloat)chartView:(ANDLineChartView *)chartView valueForElementAtRow:(NSUInteger)row
{
    return [(NSNumber*)_elements[row] floatValue];

}

- (NSUInteger)numberOfGridIntervalsInChartView:(ANDLineChartView *)chartView
{
    return 5;
}

- (CGFloat)maxValueForGridIntervalInChartView:(ANDLineChartView *)chartView
{
    return 200.0;
}
- (CGFloat)minValueForGridIntervalInChartView:(ANDLineChartView *)chartView
{
    return 0.0;
}

- (CGFloat)chartView:(ANDLineChartView *)graphView spacingForElementAtRow:(NSUInteger)row{
    return (row == 0) ? 60.0 : 30.0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

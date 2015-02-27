//
//  DataVisualizationViewController.h
//  fluxPay
//
//  Created by Rameez Remsudeen  on 2/25/15.
//  Copyright (c) 2015 Rameez Remsudeen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ANDLineChartView.h>

@interface DataVisualizationViewController : UIViewController <ANDLineChartViewDelegate, ANDLineChartViewDataSource>
@property (weak, nonatomic) IBOutlet ANDLineChartView *graphView;

@end

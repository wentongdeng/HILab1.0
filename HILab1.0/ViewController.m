//
//  ViewController.m
//  HILab1.0
//
//  Created by dengwt on 2017/2/10.
//  Copyright © 2017年 dengwt. All rights reserved.
//

#import "ViewController.h"
#import "TWRChart.h"
@interface ViewController ()
@property(strong, nonatomic) TWRChartView *chartView;
@property (strong,nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong,nonatomic) IBOutlet UIButton *button1;
@property (strong,nonatomic) IBOutlet UIButton *button2;
@property (strong,nonatomic) IBOutlet UIButton *button3;
@property (strong,nonatomic) IBOutlet UILabel *shuoming;
@property (nonatomic) int switchNumber;

- (void)switchChart:(UISegmentedControl *)sender;
//可以只用一个函数，但是为了以后扩展还是声明那么多个button先来
-(void)showMesage1:(UIButton *)button;
-(void)showMesage2:(UIButton *)button;
-(void)showMesage3:(UIButton *)button;
-(NSString*)readFileformWeb:(NSString *)url;
-(NSString*)readFileformLocal:(NSString*)path;
-(NSString*)getPathInLocal:(NSString*)fileName type:(NSString*)type;
-(void)copyContentFromWeb:(NSString*)file1 type:(NSString*)type File2:(NSString*)file2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HILab";
    [_shuoming setNumberOfLines:0];
    // Segmented Control
    [_segmentedControl addTarget:self action:@selector(switchChart:) forControlEvents:UIControlEventValueChanged];
    [_button1 addTarget:self action:@selector(showMesage1:) forControlEvents:UIControlEventTouchUpInside];
    [_button2 addTarget:self action:@selector(showMesage2:) forControlEvents:UIControlEventTouchUpInside];
    [_button3 addTarget:self action:@selector(showMesage3:) forControlEvents:UIControlEventTouchUpInside];
    
    // Chart View
    _chartView = [[TWRChartView alloc] initWithFrame:CGRectMake(80, 120, 320, 400)];
    _chartView.backgroundColor = [UIColor clearColor];
    
    // User interaction is disabled by default. You can enable it again if you want
    // _chartView.userInteractionEnabled = YES;
    
    // Load chart by using a ChartJS javascript file
//    NSString *jsFilePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"js"];
//    [_chartView setChartJsFilePath:jsFilePath];
    
    // Add the chart view to the controller's view
    [self.view addSubview:_chartView];
    [_segmentedControl sendActionsForControlEvents:UIControlEventValueChanged];
//    _segmentedControl.selectedSegmentIndex=0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Loads a bar chart using native code
 */
- (void)loadBarChart {
    // Build chart data
    TWRDataSet *dataSet1 = [[TWRDataSet alloc] initWithDataPoints:@[@10, @15, @5, @15, @5]
                                                        fillColor:[[UIColor orangeColor] colorWithAlphaComponent:0.5]
                                                      strokeColor:[UIColor orangeColor]];
    
    TWRDataSet *dataSet2 = [[TWRDataSet alloc] initWithDataPoints:@[@5, @10, @5, @15, @10]
                                                        fillColor:[[UIColor redColor] colorWithAlphaComponent:0.5]
                                                      strokeColor:[UIColor redColor]];
    
    NSArray *labels = @[@"A", @"B", @"C", @"D", @"E"];
    TWRBarChart *bar = [[TWRBarChart alloc] initWithLabels:labels
                                                  dataSets:@[dataSet1, dataSet2]
                                                  animated:YES];
    // Load data
    [_chartView loadBarChart:bar];
}

/**
 *  Loads a line chart using native code
 */
- (void)loadLineChart {
    // Build chart data
    TWRDataSet *dataSet1 = [[TWRDataSet alloc] initWithDataPoints:@[@10, @15, @5, @15, @5]];
    TWRDataSet *dataSet2 = [[TWRDataSet alloc] initWithDataPoints:@[@5, @10, @5, @15, @10]];
    
    NSArray *labels = @[@"A", @"B", @"C", @"D", @"E"];
    
    TWRLineChart *line = [[TWRLineChart alloc] initWithLabels:labels
                                                     dataSets:@[dataSet1, dataSet2]
                                                     animated:NO];
    // Load data
    [_chartView loadLineChart:line];
}

/**
 *  Loads a pie / doughnut chart using native code
 */
- (void)loadPieChart {
    // Values
    NSArray *values = @[@20, @30, @15, @5];
    
    // Colors
    UIColor *color1 = [UIColor colorWithHue:0.5 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color2 = [UIColor colorWithHue:0.6 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color3 = [UIColor colorWithHue:0.7 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color4 = [UIColor colorWithHue:0.8 saturation:0.6 brightness:0.6 alpha:1.0];
    NSArray *colors = @[color1, color2, color3, color4];
    
    // Doughnut Chart
    TWRCircularChart *pieChart = [[TWRCircularChart alloc] initWithValues:values
                                                                   colors:colors
                                                                     type:TWRCircularChartTypeDoughnut
                                                                 animated:YES];
    
    // You can even leverage callbacks when chart animation ends!
    [_chartView loadCircularChart:pieChart withCompletionHandler:^(BOOL finished) {
        if (finished) {
            NSLog(@"Animation finished!!!");
        }
    }];
}

-(void)showMesage1:(UIButton *)button{
    if (_segmentedControl.selectedSegmentIndex==0) {
        _shuoming.text=@"第一个图像，肺癌的分布图像";
    }else if(_segmentedControl.selectedSegmentIndex==1){
        _shuoming.text=@"第二个图像，老年痴呆的分布图像";
    }else if (_segmentedControl.selectedSegmentIndex==2){
        _shuoming.text=@"第三个图像，小儿麻痹的分布图像";
    }else if (_segmentedControl.selectedSegmentIndex==3){
        _shuoming.text=@"第四个图像，感冒月份概率分布图像";
    }
    
}

-(void)showMesage2:(UIButton *)button{
    _shuoming.text=@"测试按钮2";
}
-(void)showMesage3:(UIButton *)button{
    _shuoming.text=@"测试按钮3";
}

-(void)loadTWRCircularChartTypePie{
    NSArray *values = @[@20, @30, @15, @5];
    
    // Colors
    UIColor *color1 = [UIColor colorWithHue:0.5 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color2 = [UIColor colorWithHue:0.6 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color3 = [UIColor colorWithHue:0.7 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color4 = [UIColor colorWithHue:0.8 saturation:0.6 brightness:0.6 alpha:1.0];
    NSArray *colors = @[color1, color2, color3, color4];
    
    // Doughnut Chart
    TWRCircularChart *pieChart = [[TWRCircularChart alloc] initWithValues:values
                                                                   colors:colors
                                                                     type:TWRCircularChartTypePie
                                                                 animated:YES];
    
    // You can even leverage callbacks when chart animation ends!
    [_chartView loadCircularChart:pieChart withCompletionHandler:^(BOOL finished) {
        if (finished) {
            NSLog(@"Animation finished!!!");
        }
    }];

}

-(NSString*)getPathInLocal:(NSString *)fileName type:(NSString *)type{
    NSString* textPath=[[NSBundle mainBundle]pathForResource:fileName ofType:type];
    return textPath;
}

-(NSString*)readFileformWeb:(NSString *)url{
    NSURL *myUrl=[NSURL URLWithString:url];
    NSString *content=[NSString stringWithContentsOfURL:myUrl encoding:NSASCIIStringEncoding error:NULL];
    return content;
}

-(NSString*)readFileformLocal:(NSString *)path{
    NSString *content=[NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:NULL];
    return content;
}
-(void)copyContentFromWeb:(NSString *)file1 type:(NSString*) type File2:(NSString *)file2{
    NSFileHandle *outFile;
    NSString *path;
    NSData *buffer;
    NSURL* myUrl;
    path=[self getPathInLocal:file1 type:type];
    outFile=[NSFileHandle fileHandleForReadingAtPath:path];
    myUrl=[NSURL URLWithString:file2];
    buffer=[[NSData alloc]initWithContentsOfURL:myUrl];
    [outFile writeData:buffer];
    [outFile closeFile];
}

#pragma mark - UISegmentedController switch methods

- (void)switchChart:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
            //Line
        case 0: {
            _shuoming.text=@"点击按钮查看图片说明";
            [self loadLineChart];
            
        }
            break;
            
            //Bar
        case 1: {
            _shuoming.text=@"点击按钮查看图片说明";
            [self loadBarChart];
        }
            break;
            
            //Pie
        case 2: {
            _shuoming.text=@"点击按钮查看图片说明";
            [self loadPieChart];
        }
            break;
        case 3: {
            _shuoming.text=@"点击按钮查看图片说明";
            [self loadTWRCircularChartTypePie];
        }
            break;
            
        default:
            break;
    }
}

@end

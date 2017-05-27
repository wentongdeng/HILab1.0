//
//  FirstViewController.m
//  HILab1.0
//
//  Created by dengwt on 2017/5/26.
//  Copyright © 2017年 dengwt. All rights reserved.
//

#import "FirstViewController.h"
#import "HelpController.h"
#import <Speech/Speech.h>
@interface FirstViewController ()<SFSpeechRecognizerDelegate>

@property (nonatomic, strong) AVAudioEngine *audioEngine;                           // 声音处理器
@property (nonatomic, strong) SFSpeechRecognizer *speechRecognizer;                 // 语音识别器
@property (nonatomic, strong) SFSpeechAudioBufferRecognitionRequest *speechRequest; // 语音请求对象
@property (nonatomic, strong) SFSpeechRecognitionTask *currentSpeechTask;           // 当前语音识别进程
@property (nonatomic, strong) UILabel *showLb;       // 用于展现的label
@property (nonatomic, strong) IBOutlet UIButton *startBtn;    // 启动按钮

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"HILab";
    UIBarButtonItem* help=[[UIBarButtonItem alloc]initWithTitle:@"help" style:UIBarButtonItemStylePlain target:self action:@selector(pressHelp)];
    self.navigationItem.rightBarButtonItem=help;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) pressHelp{
    HelpController* helpController=[[HelpController alloc]init];
    helpController.view.backgroundColor=[UIColor whiteColor];
    
    
    [self.navigationController pushViewController:helpController animated:YES];
}


-(IBAction)speech{
    
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

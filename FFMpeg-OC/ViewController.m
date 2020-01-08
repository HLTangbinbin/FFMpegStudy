//
//  ViewController.m
//  FFMpeg-OC
//
//  Created by coooo on 2020/1/3.
//  Copyright © 2020 aaaaa. All rights reserved.
//

#import "ViewController.h"
#import "ffmpeg.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150, 300, 60, 40);
    [button setTitle:@"开动" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)test:(UIButton *)sender {
    NSLog(@"******点击了按钮");
     avformat_network_init();
     AVFormatContext *avFormatContext = avformat_alloc_context();
     
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"IMG_0951.MOV" ofType:nil];
     if (avformat_open_input(&avFormatContext, [filePath UTF8String], NULL, NULL) != 0) {
         av_log(NULL, AV_LOG_ERROR, "Couldn't open file");
     }
    
     if (avformat_find_stream_info(avFormatContext, NULL) < 0) {
         av_log(NULL, AV_LOG_ERROR, "Couldn't find stream information");
     } else {
         av_dump_format(avFormatContext, 0, [filePath cStringUsingEncoding:NSUTF8StringEncoding], NO);
     }
}


@end

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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"IMG_0951.MOV" ofType:nil];
    NSString *toFile = @"/Users/coooo/Desktop/Test.gif";
    NSString *commandStr = [NSString stringWithFormat:@"ffmpeg -i %@ %@",filePath,toFile];
    // 分割字符串
    NSMutableArray *argvArr = [commandStr componentsSeparatedByString:@" "].mutableCopy;
    //获取参数个数
    int argc = (int)argvArr.count;
    char **argv = calloc(argc, sizeof(char*));
    for (int i=0; i<argc; i++) {
        NSString *codeStr = argvArr[i];
        argvArr[i] = codeStr;
        argv[i] = (char *)[codeStr UTF8String];
        ffmpeg_main(argc, argv);
    }
}


@end

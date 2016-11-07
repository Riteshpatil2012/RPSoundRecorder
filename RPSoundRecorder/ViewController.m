//
//  ViewController.m
//  RPSoundRecorder
//
//  Created by Ritesh on 07/11/16.
//  Copyright © 2016 riteshpatil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    recordSetting = [[NSMutableDictionary alloc]init];
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    [recordSetting setValue :[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
    [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
    
    NSError *error;
    
    
    
    audioRecorder = [[AVAudioRecorder alloc]initWithURL:[self getRecordURL] settings:recordSetting error:&error];
    
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }
    else {
        NSLog(@"Audio recorder successfully created");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)getRecordPath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"record.caf"];
}

-(NSURL *)getRecordURL {
    
    NSLog(@"%@",[self getRecordPath]);
    
    return [NSURL URLWithString:[self getRecordPath]];
}

- (IBAction)recordButton:(id)sender
{
    UIButton *button =sender;
    

    UIImage * unnamed = [UIImage imageNamed:@"unnamed"];
    UIImage * stop = [UIImage imageNamed:@"stop"];

    UIImage * current =  button.currentImage;
    if ([button.currentImage isEqual:unnamed ])
    {
        [audioRecorder record];
        
        [button setImage:stop forState:UIControlStateNormal];
        NSLog(@"Recording Started");
    }
    else if ([button.currentImage isEqual:stop])
    {
        [audioRecorder stop];
        [button setImage:unnamed forState:UIControlStateNormal];

        NSLog(@"Recording Stopped");
    }
}
- (IBAction)playButton:(id)sender {
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[self getRecordURL] error:&error];
    [audioPlayer play];
    
   }
@end

//
//  ViewController.h
//  RPSoundRecorder
//
//  Created by Ritesh on 07/11/16.
//  Copyright © 2016 riteshpatil. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVFoundation;

@interface ViewController : UIViewController
{
    AVAudioPlayer *audioPlayer;
    AVAudioRecorder *audioRecorder;
    NSMutableDictionary *recordSetting;
    BOOL isRecord;
}
- (IBAction)recordButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *recordstopbutton;
- (IBAction)playButton:(id)sender;


@end


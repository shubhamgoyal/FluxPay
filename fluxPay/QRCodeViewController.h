//
//  QRCodeViewController.h
//  fluxPay
//
//  Created by Shubham Goyal on 27/2/15.
//  Copyright (c) 2015 Rameez Remsudeen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface QRCodeViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic) BOOL isReading;
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (weak, nonatomic) IBOutlet UIView *viewPreview;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) UIImage *theImage;
-(void)stopReading;
-(void)loadBeepSound;
@end

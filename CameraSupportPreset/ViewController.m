//
//  ViewController.m
//  CameraSupportPreset
//
//  Created by Acorn on 2017/10/24.
//  Copyright © 2017年 Acorn. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self printCamerasInfo];
}

- (CMVideoDimensions) getCameraMaxStillImageResolution:(AVCaptureDevicePosition) cameraPosition {
    
    CMVideoDimensions max_resolution;
    max_resolution.width = 0;
    max_resolution.height = 0;
    
    AVCaptureDevice *captureDevice = nil;
    
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if ([device position] == cameraPosition) {
            captureDevice = device;
            break;
        }
    }
    
    if (captureDevice == nil) {
        return max_resolution;
    }
    
    NSArray* availFormats=captureDevice.formats;
    
    for (AVCaptureDeviceFormat* format in availFormats) {
        CMVideoDimensions resolution = format.highResolutionStillImageDimensions;
        int w = resolution.width;
        int h = resolution.height;
        if ((w * h) > (max_resolution.width * max_resolution.height)) {
            max_resolution.width = w;
            max_resolution.height = h;
        }
    }
    
    return max_resolution;
}

- (void) printCamerasInfo {
    CMVideoDimensions res;
    res = [self getCameraMaxStillImageResolution:AVCaptureDevicePositionBack];
    NSLog(@" Back  Camera max Image resolution: %d x %d", res.width, res.height);
    res = [self getCameraMaxStillImageResolution:AVCaptureDevicePositionFront];
    NSLog(@" Front Camera max Image resolution: %d x %d", res.width, res.height);
}


@end

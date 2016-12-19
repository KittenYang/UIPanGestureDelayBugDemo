//
//  MMUIPanGestureRecognizer.m
//  iMarkDemo
//
//  Created by Kitten x iDaily on 16/12/19.
//  Copyright © 2016年 KittenYang. All rights reserved.
//

#import "MMUIPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation MMUIPanGestureRecognizer


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = touches.allObjects.firstObject;
    // 忽略其上的另外 touch
//    __block BOOL hasOtherGestureInSelf = NO;
//    [touch.gestureRecognizers enumerateObjectsUsingBlock:^(UIGestureRecognizer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (obj.view == self.view) {
//            hasOtherGestureInSelf = YES;
//            *stop = YES;
//        }
//    }];
    if (touch.view != self.view) {
        [self setState:UIGestureRecognizerStateFailed];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    NSLog(@"touchesMoved");
    if ([self state] == UIGestureRecognizerStatePossible) {
        [self setState:UIGestureRecognizerStateBegan];
    } else {
        [self setState:UIGestureRecognizerStateChanged];
    }
}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { // Perform final check to make sure a tap was not misinterpreted.
//    [super touchesEnded:touches withEvent:event];
//    if ([self state] == UIGestureRecognizerStateChanged) {
//        [self setState:UIGestureRecognizerStateEnded];
//    } else {
//        [self setState:UIGestureRecognizerStateFailed];
//    }
//}
//
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
//    [super touchesCancelled:touches withEvent:event];
//    [self setState:UIGestureRecognizerStateFailed];
//}


@end

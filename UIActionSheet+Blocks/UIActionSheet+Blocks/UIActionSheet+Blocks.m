//
//  UIActionSheet+Blocks.h
//  UIActionSheet+Blocks
//
//  Created by Mervyn Ong on 19/11/14.
//  Copyright (c) 2014 Mervyn Ong
//
//  The MIT License (MIT)
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


#import <objc/runtime.h>
#import "UIActionSheet+Blocks.h"

static const char kActionSheetDelegate;
static const char kActionSheetCompletionBlock;
static const char kActionSheetWillPresentBlock;
static const char kActionSheetDidPresentBlock;
static const char kActionSheetWillDismissBlock;
static const char kActionSheetDidDismissBlock;

@implementation UIActionSheet (Blocks)

#pragma mark - Private Class Methods

+(instancetype)actionSheetWithCompletionBlock:(CompletionBlock)completion
                                     forTitle:(NSString *)title
                            cancelButtonTitle:(NSString *)cancelButtonTitle
                       destructiveButtonTitle:(NSString *)destructiveButtonTitle
                            otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:title
                                                            delegate:nil
                                                   cancelButtonTitle:cancelButtonTitle
                                              destructiveButtonTitle:destructiveButtonTitle
                                                   otherButtonTitles:nil];
    if (completion){
        [actionSheet setCompletionBlock:completion];
    }
    [actionSheet checkDelegate];
    
    return actionSheet;
}


#pragma mark - Public Class Methods

+(instancetype)showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                    animated:(BOOL)animated
                 withCompletionBlock:(CompletionBlock)completion
                    forTitle:(NSString *)title
           cancelButtonTitle:(NSString *)cancelButtonTitle
      destructiveButtonTitle:(NSString *)destructiveButtonTitle
           otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithCompletionBlock:completion
                                                                      forTitle:title
                                                             cancelButtonTitle:cancelButtonTitle
                                                        destructiveButtonTitle:destructiveButtonTitle
                                                             otherButtonTitles:nil];
    va_list args;
    va_start(args, otherButtonTitles);
    for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString *)) {
        [actionSheet addButtonWithTitle:arg];
    }
    
    [actionSheet showFromBarButtonItem:barButtonItem animated:animated];
    return actionSheet;
}

+(instancetype)showFromCGRect:(CGRect)rect
               inView:(UIView *)view
             animated:(BOOL)animated
          withCompletionBlock:(CompletionBlock)completion
             forTitle:(NSString *)title
    cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
    otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithCompletionBlock:completion
                                                                      forTitle:title
                                                             cancelButtonTitle:cancelButtonTitle
                                                        destructiveButtonTitle:destructiveButtonTitle
                                                             otherButtonTitles:nil];
    va_list args;
    va_start(args, otherButtonTitles);
    for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString *)) {
        [actionSheet addButtonWithTitle:arg];
    }
    
    [actionSheet showFromRect:rect inView:view animated:animated];
    return actionSheet;
}

+(instancetype)showFromTabBar:(UITabBar *)tabBar
          withCompletionBlock:(CompletionBlock)completion
             forTitle:(NSString *)title
    cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
    otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithCompletionBlock:completion
                                                                      forTitle:title
                                                             cancelButtonTitle:cancelButtonTitle
                                                        destructiveButtonTitle:destructiveButtonTitle
                                                             otherButtonTitles:nil];
    va_list args;
    va_start(args, otherButtonTitles);
    for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString *)) {
        [actionSheet addButtonWithTitle:arg];
    }
    
    [actionSheet showFromTabBar:tabBar];
    return actionSheet;
}

+(instancetype)showFromToolbar:(UIToolbar *)toolbar
           withCompletionBlock:(CompletionBlock)completion
              forTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
     otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithCompletionBlock:completion
                                                                      forTitle:title
                                                             cancelButtonTitle:cancelButtonTitle
                                                        destructiveButtonTitle:destructiveButtonTitle
                                                             otherButtonTitles:nil];
    va_list args;
    va_start(args, otherButtonTitles);
    for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString *)) {
        [actionSheet addButtonWithTitle:arg];
    }
    
    [actionSheet showFromToolbar:toolbar];
    return actionSheet;
}

+(instancetype)showInView:(UIView *)view
      withCompletionBlock:(CompletionBlock)completion
         forTitle:(NSString *)title
cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    UIActionSheet *actionSheet = [UIActionSheet actionSheetWithCompletionBlock:completion
                                                                      forTitle:title
                                                             cancelButtonTitle:cancelButtonTitle
                                                        destructiveButtonTitle:destructiveButtonTitle
                                                             otherButtonTitles:nil];
    va_list args;
    va_start(args, otherButtonTitles);
    for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString *)) {
        [actionSheet addButtonWithTitle:arg];
    }
    
    [actionSheet showInView:view];
    return actionSheet;
}


#pragma mark - Setters and Getters

-(void)checkDelegate
{
    if (self.delegate != (id<UIActionSheetDelegate>)self) {
        objc_setAssociatedObject(self, &kActionSheetDelegate, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UIActionSheetDelegate>)self;
    }
}

-(CompletionBlock)completionBlock
{
    return objc_getAssociatedObject(self, &kActionSheetCompletionBlock);
}

-(void)setCompletionBlock:(CompletionBlock)completionBlock
{
    [self checkDelegate];
    objc_setAssociatedObject(self, &kActionSheetCompletionBlock, completionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(ActionSheetBlock)willPresentBlock
{
    return  objc_getAssociatedObject(self, &kActionSheetWillPresentBlock);
}

-(void)setWillPresentBlock:(ActionSheetBlock)willPresentBlock
{
    [self checkDelegate];
    objc_setAssociatedObject(self, &kActionSheetWillPresentBlock, willPresentBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(ActionSheetBlock)didPresentBlock
{
    return  objc_getAssociatedObject(self, &kActionSheetDidPresentBlock);
}

-(void)setDidPresentBlock:(ActionSheetBlock)didPresentBlock
{
    [self checkDelegate];
    objc_setAssociatedObject(self, &kActionSheetDidPresentBlock, didPresentBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CompletionBlock)willDismissBlock
{
    return objc_getAssociatedObject(self, &kActionSheetWillDismissBlock);
}

-(void)setWillDismissBlock:(CompletionBlock)willDismissBlock
{
    [self checkDelegate];
    objc_setAssociatedObject(self, &kActionSheetWillDismissBlock, willDismissBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CompletionBlock)didDismissBlock
{
    return objc_getAssociatedObject(self, &kActionSheetDidDismissBlock);
}

-(void)setDidDismissBlock:(CompletionBlock)didDismissBlock
{
    [self checkDelegate];
    objc_setAssociatedObject(self, &kActionSheetDidDismissBlock, didDismissBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - UIActionSheetDelegate Methods
//Need not use respondToSelector as delegate is always set to self which in this category will would always have the protocol methods

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.completionBlock) {
        self.completionBlock(actionSheet, buttonIndex);
    }
}

-(void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    if (self.completionBlock) {
        self.completionBlock(actionSheet, actionSheet.cancelButtonIndex);
    }
}

-(void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    if (self.willPresentBlock) {
        self.willPresentBlock(actionSheet);
    }
}

-(void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
    if (self.didPresentBlock) {
        self.didPresentBlock(actionSheet);
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.willDismissBlock) {
        self.willDismissBlock(actionSheet, buttonIndex);
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.didDismissBlock) {
        self.didDismissBlock(actionSheet, buttonIndex);
    }
}

@end

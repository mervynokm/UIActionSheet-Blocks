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

#import <UIKit/UIKit.h>

typedef void(^ActionSheetBlock)(UIActionSheet *actionSheet);
typedef void(^ActionSheetCompletionBlock)(UIActionSheet *actionSheet, NSInteger buttonIndex);

@interface UIActionSheet (Blocks) <UIActionSheetDelegate>

+(instancetype)showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                            animated:(BOOL)animated
                 withCompletionBlock:(ActionSheetCompletionBlock)completion
                            forTitle:(NSString *)title
                   cancelButtonTitle:(NSString *)cancelButtonTitle
              destructiveButtonTitle:(NSString *)destructiveButtonTitle
                   otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+(instancetype)showFromCGRect:(CGRect)rect
                       inView:(UIView *)view
                     animated:(BOOL)animated
          withCompletionBlock:(ActionSheetCompletionBlock)completion
                     forTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+(instancetype)showFromTabBar:(UITabBar *)tabBar
          withCompletionBlock:(ActionSheetCompletionBlock)completion
                     forTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+(instancetype)showFromToolbar:(UIToolbar *)toolbar
           withCompletionBlock:(ActionSheetCompletionBlock)completion
                      forTitle:(NSString *)title
             cancelButtonTitle:(NSString *)cancelButtonTitle
        destructiveButtonTitle:(NSString *)destructiveButtonTitle
             otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+(instancetype)showInView:(UIView *)view
      withCompletionBlock:(ActionSheetCompletionBlock)completion
                 forTitle:(NSString *)title
        cancelButtonTitle:(NSString *)cancelButtonTitle
   destructiveButtonTitle:(NSString *)destructiveButtonTitle
        otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

@property (nonatomic, copy) ActionSheetCompletionBlock completionBlock;
@property (nonatomic, copy) ActionSheetBlock willPresentBlock;
@property (nonatomic, copy) ActionSheetBlock didPresentBlock;
@property (nonatomic, copy) ActionSheetCompletionBlock willDismissBlock;
@property (nonatomic, copy) ActionSheetCompletionBlock didDismissBlock;

@end

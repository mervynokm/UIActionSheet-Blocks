# UIActionSheet + Blocks.h
Copyright (c) 2014 Mervyn Ong. All rights reserved.

Simply put, this is a block-based soluation for UIActionSheet to avoid the need of using a delegate

### How to use it
Add UIActionSheet+Blocks into your project and import the necessary header file 

```sh
#import "UIActionSheet+Blocks.h"
```

Additional properties and methods available are as follows:

Properties:
```
@property (nonatomic, copy) CompletionBlock completionBlock;
@property (nonatomic, copy) ActionSheetBlock willPresentBlock;
@property (nonatomic, copy) ActionSheetBlock didPresentBlock;
@property (nonatomic, copy) CompletionBlock willDismissBlock;
@property (nonatomic, copy) CompletionBlock didDismissBlock;
```

Public Class Methods:
```
+(instancetype)showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                    animated:(BOOL)animated
         withCompletionBlock:(CompletionBlock)completion
                    forTitle:(NSString *)title
           cancelButtonTitle:(NSString *)cancelButtonTitle
      destructiveButtonTitle:(NSString *)destructiveButtonTitle
           otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+(instancetype)showFromCGRect:(CGRect)rect
               inView:(UIView *)view
             animated:(BOOL)animated
          withCompletionBlock:(CompletionBlock)completion
             forTitle:(NSString *)title
    cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
    otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+(instancetype)showFromTabBar:(UITabBar *)tabBar
          withCompletionBlock:(CompletionBlock)completion
             forTitle:(NSString *)title
    cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
    otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+(instancetype)showFromToolbar:(UIToolbar *)toolbar
           withCompletionBlock:(CompletionBlock)completion
              forTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
     otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+(instancetype)showInView:(UIView *)view
      withCompletionBlock:(CompletionBlock)completion
         forTitle:(NSString *)title
cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
```

Have fun!
### Version
1.0

//
//  ViewController.m
//  UIActionSheet+Blocks
//
//  Created by Mervyn Ong on 19/11/14.
//  Copyright (c) 2014 Excaliber. All rights reserved.
//

#import "ViewController.h"
#import "UIActionSheet+Blocks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"ActionSheet" style:UIBarButtonItemStylePlain target:self action:@selector(callBarButtonActionSheet:)];
    [self.navigationItem setRightBarButtonItem:rightButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)callActionSheet:(id)sender {
    UIActionSheet *actionSheet = [UIActionSheet showInView:self.view withCompletionBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"%ld", buttonIndex);
    }
                     forTitle:@"Title"
            cancelButtonTitle:nil
       destructiveButtonTitle:@"Destructive"
            otherButtonTitles:@"One", nil];
    actionSheet.willDismissBlock = ^(UIActionSheet *actionSheet, NSInteger buttonIndex){
        NSLog(@"willDismissBlock");
    };
    actionSheet.didDismissBlock = ^(UIActionSheet *actionSheet, NSInteger buttonIndex){
        NSLog(@"didDismissBlock");
    };
    actionSheet.willPresentBlock = ^(UIActionSheet *actionSheet){
        NSLog(@"willPresentBlock");
    };
    actionSheet.didPresentBlock = ^(UIActionSheet *actionSheet){
        NSLog(@"didPresentBlock");
    };
}

-(void)callBarButtonActionSheet:(UIBarButtonItem *)barButtonItem
{
    [UIActionSheet showFromCGRect:CGRectMake(100, 100, 100, 100)
                           inView:self.view
                                animated:YES
                     withCompletionBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
                         NSLog(@"%ld", buttonIndex);
                     }
                                forTitle:@"Title"
                       cancelButtonTitle:nil
                  destructiveButtonTitle:nil
                       otherButtonTitles:@"One", nil];
}

@end

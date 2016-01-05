//
//  ViewController.m
//  KDCycleBannerViewDemo
//
//  Created by Kingiol on 14-4-11.
//  Copyright (c) 2014年 Kingiol. All rights reserved.
//

#import "ViewController.h"

#import "KDCycleBannerView.h"

@interface ViewController () <KDCycleBannerViewDataource, KDCycleBannerViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet KDCycleBannerView *cycleBannerViewTop;
@property (strong, nonatomic) KDCycleBannerView *cycleBannerViewBottom;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _cycleBannerViewTop.autoPlayTimeInterval = 5;
    
    _cycleBannerViewBottom = [KDCycleBannerView new];
    _cycleBannerViewBottom.frame = CGRectMake(20, 270, 280, 150);
    _cycleBannerViewBottom.datasource = self;
    _cycleBannerViewBottom.delegate = self;
    _cycleBannerViewBottom.continuous = YES;
    _cycleBannerViewBottom.autoPlayTimeInterval = 5;
    _cycleBannerViewBottom.pageIndicatorYPosition = 135;
    [self.view addSubview:_cycleBannerViewBottom];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - KDCycleBannerViewDataource

- (NSArray *)numberOfKDCycleBannerView:(KDCycleBannerView *)bannerView {
    
    return @[[UIImage imageNamed:@"audi1"],[UIImage imageNamed:@"audi2"],[UIImage imageNamed:@"audi3"]];
}

- (UIViewContentMode)contentModeForImageIndex:(NSUInteger)index {
    return UIViewContentModeScaleAspectFill;
}

//- (UIImage *)placeHolderImageOfZeroBannerView {
//    return [UIImage imageNamed:@"image1"];
//}

#pragma mark - KDCycleBannerViewDelegate

- (void)cycleBannerView:(KDCycleBannerView *)bannerView didScrollToIndex:(NSUInteger)index {
    NSLog(@"didScrollToIndex:%ld", (long)index);
}

- (void)cycleBannerView:(KDCycleBannerView *)bannerView didSelectedAtIndex:(NSUInteger)index {
    NSLog(@"didSelectedAtIndex:%ld", (long)index);
}

- (UIColor *)cycleBannerViewPageIndicatorTintColor{
    return [UIColor blackColor];
}

- (UIColor *)cycleBannerViewCurrentPageIndicatorTintColor{
    return [UIColor grayColor];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSString *text = textField.text;
    
    @try {
        NSInteger page = [text integerValue];
        [_cycleBannerViewTop setCurrentPage:page animated:YES];
        [_cycleBannerViewBottom setCurrentPage:page animated:YES];
    }
    @catch (NSException *exception) {
        
    }
    
    return YES;
}

@end

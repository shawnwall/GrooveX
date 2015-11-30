//
//  ViewController.m
//  GrooveX
//
//  Created by Shawn Wall on 11/25/15.
//  Copyright © 2015 TwoTap Labs. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:@"https://music.microsoft.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    self.webView.customUserAgent = @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A";
    [self.webView.preferences setPlugInsEnabled:true];
    [self.webView setLayerUsesCoreImageFilters:YES];
    [[[self webView] mainFrame] loadRequest:urlRequest];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end

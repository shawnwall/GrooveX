//
//  ViewController.m
//  GrooveX
//
//  Created by Shawn Wall on 11/25/15.
//  Copyright © 2015 TwoTap Labs. All rights reserved.
//

#import "ViewController.h"
#import "MediaKeyApplication.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nextTrack:) name:MediaKeyNextNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(previousTrack:) name:MediaKeyPreviousNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(togglePlayPause:) name:MediaKeyPlayPauseNotification object:nil];
    
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

- (void)nextTrack:(id)sender {
    [self.webView stringByEvaluatingJavaScriptFromString:@"javascript:document.querySelectorAll(\".iconPlayerNext\")[0].click();"];
}

- (void)previousTrack:(id)sender {
    [self.webView stringByEvaluatingJavaScriptFromString:@"javascript:document.querySelectorAll(\".iconPlayerPrevious\")[0].click();"];
}

- (void)togglePlayPause:(id)sender {
    [self.webView stringByEvaluatingJavaScriptFromString:@"javascript:pause = document.querySelectorAll(\".iconPlayerPause\")[0]; play = document.querySelectorAll(\".iconPlayerPlay\")[0]; if (pause) { pause.click(); } else { play.click();}"];
}

@end

//
//  ParallaxViewController.m
//  JGMarkLable
//
//  Created by stkcctv on 16/8/29.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "ParallaxViewController.h"

#import "ParallaxView.h"

@interface ParallaxViewController ()

@end

@implementation ParallaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.style == 1) {
        ParallaxView * paraView = [[ParallaxView alloc] initWithImageName:@"background.jpg"];
        [self.view addSubview:paraView];
        [self.view sendSubviewToBack:paraView];
    }
    else if (self.style == 2) {
        UIImageView * backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
        backImage.image = [UIImage imageNamed:@"background.jpg"];
        [self.view addSubview:backImage];
        
        ParallaxView * paraView = [[ParallaxView alloc] initMagnifyingGlassWithImageName:@"star.jpeg"];
        [self.view addSubview:paraView];
        //        [self.view sendSubviewToBack:paraView];
    }





}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  AboutViewController.m
//  LOL
//
//  Created by Kean on 16/7/14.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "AboutViewController.h"
#import "Public.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"关于我们";
    [self about];
    
}

- (void)about {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50* KWidth_ScaleW, 140 * KWidth_ScaleW, 350 * KWidth_ScaleW, 200 * KWidth_ScaleW)];
    
    label.text = @"联系QQ：2827858313\n\n意见邮箱：2827858313@qq.com";
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:21 * KWidth_ScaleW];
    [self.view addSubview:label];

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

//
//  ViewController.m
//  CJSignatureDome
//
//  Created by zxjk on 17/8/17.
//
//

#import "ViewController.h"
#import "CJDrawViewController.h"

@interface ViewController () <CJDrawViewControllerDelegate>

@end

@implementation ViewController
{
    UIImageView *showImageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    showImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:showImageView];
    showImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CJDrawViewController *VC = [CJDrawViewController new];
    VC.delegate = self;
    [self presentViewController:VC animated:YES completion:nil];
    
}

- (void)returnImage:(UIImage *)signImage
{
    showImageView.frame = CGRectMake(0, 0, signImage.size.width, signImage.size.height);
    showImageView.center = self.view.center;
    showImageView.image = signImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

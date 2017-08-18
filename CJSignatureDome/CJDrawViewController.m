//
//  CJDrawViewController.m
//  CJSignatureDome
//
//  Created by zxjk on 17/8/17.
//
//

#import "CJDrawViewController.h"
#import "CJSignatureView.h"

@interface CJDrawViewController ()

@property (nonatomic, strong) CJSignatureView *signView;

@end

@implementation CJDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.signView];
    [self createView];
}
#pragma mark 初始化
- (CJSignatureView *)signView
{
    if (!_signView) {
        _signView = [[CJSignatureView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2.0-200/2.0, self.view.frame.size.width, 200)];
        _signView.lineColor = [UIColor redColor];
        _signView.lineWidth = 2;
        _signView.imageScale = 0.5;
        [_signView startDraw];
    }
    return _signView;
}
#pragma mark 创建按钮
- (void)createView
{
    NSArray *titleArr = @[@"返回", @"重置", @"保存"];
    
    CGFloat btnW = self.view.frame.size.width/3.0;
    for (int i = 0; i < titleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(btnW*i, self.view.frame.size.height-40, btnW, 40);
        [self.view addSubview:btn];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100+i;
    }
}
#pragma mark 按钮点击方法
- (void)btnAction:(UIButton *)btn
{
    switch (btn.tag) {
        case 100:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case 101:
            [_signView resetDraw];
            break;
        case 102:
            [_signView saveDraw];
            if ([self.delegate respondsToSelector:@selector(returnImage:)]) {
                [self.delegate returnImage:_signView.signImage];
            }
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
            
        default:
            break;
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

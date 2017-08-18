//
//  CJDrawViewController.h
//  CJSignatureDome
//
//  Created by zxjk on 17/8/17.
//
//

#import <UIKit/UIKit.h>

@protocol CJDrawViewControllerDelegate <NSObject>
// 返回签名图片
- (void)returnImage:(UIImage *)signImage;

@end

@interface CJDrawViewController : UIViewController

@property (nonatomic, assign) id<CJDrawViewControllerDelegate> delegate;

@end

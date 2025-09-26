/*
Thằng nào lấy đéo ghi nguồn làm chó
Code của icecnguyen
https://bio.icêcnguyen.dpdns.org
*/

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FPSDisplay.h"

@interface FPSDisplay ()
@property (strong, nonatomic) UILabel *displayLabel;
@property (strong, nonatomic) CADisplayLink *link;
@property (assign, nonatomic) NSInteger count;
@property (assign, nonatomic) NSTimeInterval lastTime;
@end

@implementation FPSDisplay

+ (instancetype)shareFPSDisplay {
    static FPSDisplay *shareDisplay;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareDisplay = [[FPSDisplay alloc] init];
    });
    return shareDisplay;
}

+ (void)load {
    dispatch_async(dispatch_get_main_queue(), ^{
        [FPSDisplay shareFPSDisplay];
    });
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initDisplayLabel];
    }
    return self;
}

- (void)initDisplayLabel {
    self.displayLabel = [[UILabel alloc] init];
    self.displayLabel.layer.cornerRadius = 5;
    self.displayLabel.clipsToBounds = YES;
    self.displayLabel.textAlignment = NSTextAlignmentCenter;
    self.displayLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
    self.displayLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];

    [self updateLabelFrame];
    [self initCADisplayLink];

    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    if (window) {
        [window addSubview:self.displayLabel];
    }
}

- (void)updateLabelFrame {
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    if (!window) return;
    CGFloat width = 220;
    CGFloat height = 25;
    CGFloat x = (window.bounds.size.width - width) / 2.0;
    CGFloat y = window.safeAreaInsets.top + 5;
    self.displayLabel.frame = CGRectMake(x, y, width, height);
}

- (void)initCADisplayLink {
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)tick:(CADisplayLink *)link {
    if (self.lastTime == 0) {
        self.lastTime = link.timestamp;
        return;
    }
    self.count++;
    NSTimeInterval delta = link.timestamp - self.lastTime;
    if (delta >= 1.0) {
        self.lastTime = link.timestamp;
        float fps = self.count / delta;
        self.count = 0;
        [self updateDisplayLabelText:fps];
    }
}

- (void)updateDisplayLabelText:(float)fps {
    UIDevice *device = [UIDevice currentDevice];
    [device setBatteryMonitoringEnabled:YES];
    double batLeft = (double)[device batteryLevel] * 100.0;

    NSString *WMText = [NSString stringWithFormat:@"FPS: %d | Pin: %.0f%% | %@",
                        (int)roundf(fps), batLeft, [self getSystemDate]];
    UIColor *color;
    if (batLeft > 60) {
        color = [UIColor greenColor];
    } else if (batLeft > 30) {
        color = [UIColor orangeColor];
    } else {
        color = [UIColor redColor];
    }

    NSDictionary *attrs = @{
        NSForegroundColorAttributeName: color,
        NSFontAttributeName: [UIFont systemFontOfSize:12 weight:UIFontWeightBold]
    };
    self.displayLabel.attributedText = [[NSAttributedString alloc] initWithString:WMText attributes:attrs];
}

- (NSString *)getSystemDate {
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    return [dateFormatter stringFromDate:currentDate];
}
@end
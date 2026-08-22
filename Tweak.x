#import <UIKit/UIKit.h>

%hook UIViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig(animated);
    NSLog(@"[SnapchatDylibVip] Loaded successfully!");
}

%end

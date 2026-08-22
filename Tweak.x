#import <UIKit/UIKit.h>

// MARK: - App Lifecycle Hook
%hook UIViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig(animated);
    
    // Logging for debugging
    NSLog(@"[MySnapMod] UIViewController successfully loaded: %@", NSStringFromClass([self class]));
}

%end

// MARK: - Custom Alert On Launch
%hook UIApplication

- (void)applicationDidBecomeActive:(UIApplication *)application {
    %orig(application);
    
    // Dispatch to main thread to safely present UI
    dispatch_async(dispatch_get_main_queue(), ^{
        static BOOL hasShownAlert = NO;
        if (!hasShownAlert) {
            hasShownAlert = YES;
            
            UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
            if (rootVC) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"MySnapMod"
                                                                               message:@"Tweak loaded successfully!"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:nil];
                [alert addAction:okAction];
                
                [rootVC presentViewController:alert animated:YES completion:nil];
            }
        }
    });
}

%end

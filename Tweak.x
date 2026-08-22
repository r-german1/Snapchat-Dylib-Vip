#import <UIKit/UIKit.h>

%hook SCUserSession

// بۆ نموونە: نەهێلانا دیاربوونا Screenshot
- (bool)isScreenshotDetected {
    return NO;
}

%end

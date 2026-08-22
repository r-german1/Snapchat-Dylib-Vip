#import <UIKit/UIKit.h>

// MARK: - Premium / Plus / VIP Hooks
%hook SCUserSession
- (BOOL)isPremiumSubscriber {
    return YES;
}
- (BOOL)isPlusSubscriber {
    return YES;
}
- (BOOL)isVIPSubscriber {
    return YES;
}
%end

// MARK: - Hide View Story / Snap / Read Message
%hook SCStorySnapMediaContent
- (BOOL)shouldSendViewReceipt {
    return NO;
}
%end

%hook SCChatMessage
- (BOOL)shouldSendReadReceipt {
    return NO;
}
%end

// MARK: - Hide Typing & Online Status
%hook SCChatTypingHandler
- (void)sendTypingNotificationForConversation:(id)arg1 isTyping:(BOOL)arg2 {
    // Hide typing activity
    %orig(arg1, NO);
}
%end

%hook SCUserPresenceManager
- (BOOL)isUserOnline {
    return NO;
}
%end

// MARK: - Secret Screenshot & Screen Record
%hook SCUserSession
- (BOOL)isScreenRecordingAllowed {
    return YES;
}
%end

%hook SCNativeScreenshotDetector
- (void)userDidTakeScreenshot {
    // Prevent alerting sender on screenshot
}
%end

// MARK: - Auto-Save & Ad-Blocker
%hook SCAdManager
- (BOOL)isAdEnabled {
    return NO;
}
- (BOOL)shouldShowStoryAds {
    return NO;
}
%end

%hook SCStoryMediaDownloader
- (BOOL)shouldAutoSaveMedia {
    return YES;
}
%end

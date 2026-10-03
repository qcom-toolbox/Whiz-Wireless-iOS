#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static NSString * const kPrefsPath = @"/var/jb/var/mobile/Library/Preferences/qcom-toolbox.whiz-wireless.plist";
static NSString * const kPrefsPathFallback = @"/var/mobile/Library/Preferences/qcom-toolbox.whiz-wireless.plist";
static NSString * const kDefaultCarrierName = @"Whiz Wireless 9G";
static const long long kSignalModeActive = 2;

static NSString *gCarrierName;
static long long gSignalBars = -1;
static Class gCellularSignalViewClass;

@interface _UIStatusBarDataCellularEntry : NSObject
- (void)setString:(NSString *)string;
@end

@interface _UIStatusBarSignalView : UIView
- (void)setSignalMode:(long long)mode;
- (void)setNumberOfActiveBars:(long long)bars;
@end

%hook _UIStatusBarDataCellularEntry

- (void)setString:(NSString *)string {
    %orig(gCarrierName);
}

%end

%group SignalBars

%hook _UIStatusBarSignalView

- (void)setSignalMode:(long long)mode {
    if ([self isKindOfClass:gCellularSignalViewClass]) {
        %orig(kSignalModeActive);
        return;
    }
    %orig;
}

- (void)setNumberOfActiveBars:(long long)bars {
    if ([self isKindOfClass:gCellularSignalViewClass]) {
        %orig(gSignalBars);
        return;
    }
    %orig;
}

%end

%end

%ctor {
    NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:kPrefsPath];
    if (!prefs) prefs = [NSDictionary dictionaryWithContentsOfFile:kPrefsPathFallback];
    gCarrierName = prefs[@"CarrierName"] ?: kDefaultCarrierName;
    gSignalBars = prefs[@"SignalBars"] ? [prefs[@"SignalBars"] longLongValue] : -1;

    %init;

    Class signalView = NSClassFromString(@"_UIStatusBarSignalView");
    gCellularSignalViewClass = NSClassFromString(@"_UIStatusBarCellularSignalView");
    if (gSignalBars >= 0 && gCellularSignalViewClass &&
        class_getInstanceMethod(signalView, @selector(setSignalMode:)) &&
        class_getInstanceMethod(signalView, @selector(setNumberOfActiveBars:))) {
        %init(SignalBars);
    }
}

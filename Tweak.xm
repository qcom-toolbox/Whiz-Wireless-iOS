#import <UIKit/UIKit.h>

static NSString * const kPrefsPath = @"/var/jb/var/mobile/Library/Preferences/qcom-toolbox.whiz-wireless.plist";
static NSString * const kPrefsPathFallback = @"/var/mobile/Library/Preferences/qcom-toolbox.whiz-wireless.plist";
static NSString * const kDefaultCarrierName = @"Whiz Wireless 9G";

static NSString *gCarrierName;

@interface _UIStatusBarDataCellularEntry : NSObject
- (void)setString:(NSString *)string;
@end

%hook _UIStatusBarDataCellularEntry

- (void)setString:(NSString *)string {
    %orig(gCarrierName);
}

%end

%ctor {
    NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:kPrefsPath];
    if (!prefs) prefs = [NSDictionary dictionaryWithContentsOfFile:kPrefsPathFallback];
    gCarrierName = prefs[@"CarrierName"] ?: kDefaultCarrierName;
}

#import <UIKit/UIKit.h>

@interface _UIStatusBarDataCellularEntry : NSObject
- (void)setString:(NSString *)string;
@end

%hook _UIStatusBarDataCellularEntry

- (void)setString:(NSString *)string {
    %orig(@"Whiz Wireless 9G");
}

%end

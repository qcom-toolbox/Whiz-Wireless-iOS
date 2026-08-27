#import "FSTRootListController.h"
#import <spawn.h>
#import <sys/wait.h>

extern char **environ;

@implementation FSTRootListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
    }
    return _specifiers;
}

- (void)respring:(id)sender {
    pid_t pid;
    char *args[] = {"/usr/bin/killall", "-9", "SpringBoard", NULL};
    if (posix_spawn(&pid, args[0], NULL, NULL, args, environ) == 0) {
        waitpid(pid, NULL, 0);
    }
}

@end

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
    for (NSString *path in @[@"/var/jb/usr/bin/killall", @"/usr/bin/killall"]) {
        if (access(path.fileSystemRepresentation, X_OK) != 0) continue;

        pid_t pid;
        char *args[] = {(char *)path.fileSystemRepresentation, "-9", "SpringBoard", NULL};
        if (posix_spawn(&pid, args[0], NULL, NULL, args, environ) == 0) {
            waitpid(pid, NULL, 0);
            return;
        }
    }
}

@end

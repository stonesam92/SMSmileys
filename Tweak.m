#import <Foundation/Foundation.h>
#include "emojiConstants.h"

%hook CKSimpleBalloonView
 
- (void)setText:(NSString *)text
{
    NSLog(text);
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    static id asciiSmileys[20] = { 
        @":)", 
        @":(", 
        @":o", 
        @";)", 
        @":'(", 
        @":D", 
        @":p", 
        @":s", 
        @"<3", 
        @"</3", 
        @"(Y)", 
        @"(N)", 
        @":-)", 
        @":-(", 
        @":-o", 
        @";-)", 
        @":'-(", 
        @":-D", 
        @":-p", 
        @":-s" 
    };
    
    static id emojiSmileys[12] = {
        /* contains all the emoji characters (arranged in the same order as the ascii array) defined in emojiConstants.h  */
        smileyface, 
        sadface, 
        oface, 
        winkeyface, 
        cryingface, 
        dface,
        pface, 
        sface, 
        heart, 
        brokenheart,
        thumbsup, 
        thumbsdown 
    };

    int i = 0;
    NSRange range= {0, [text length]};
    
    
    for (i=0; i<20; i++) {
        /* does a search-and-replace for all strings in the smileys arrays */
        text = [text stringByReplacingOccurrencesOfString:asciiSmileys[i]
                                                             withString:emojiSmileys[i % 12]
                                                                options:NSCaseInsensitiveSearch
                                                                  range:range];
        range.length = [text length];
        NSLog(@"text is now %@", text);
    }
    
    %orig;
    %orig;
}


%end

/*

 [CKSimpleBalloonView setText:] is the other place to insert the hooks, that will also work for imessages
 
*/
#import <Foundation/Foundation.h>
#include "emojiConstants.h"

%hook CKTranscriptBubbleData
 
- (id)appendBubbleDataForMessage:(id)message 
{
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
    NSString *text = [message valueForKey:@"text"];
    NSRange range= {0, [text length]};
    
    
    for (i=0; i<20; i++) {
        text = [text stringByReplacingOccurrencesOfString:asciiSmileys[i]
                                                             withString:emojiSmileys[i % 12]
                                                                options:NSCaseInsensitiveSearch
                                                                  range:range];
        range.length = [text length];
    }
    [message setValue:[text retain] forKey:@"text"];
    NSLog(@"ABAmessage was : %@", message);

    [pool drain];
    return %orig;
}


%end
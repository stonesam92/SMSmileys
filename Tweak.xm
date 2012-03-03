#import <Foundation/Foundation.h>
#include "emojiConstants.h"
#include <CoreGraphics/CGGeometry.h>

%hook CKSimpleBalloonView
 
static const id asciiSmileys[20] = ASCIISMILEYS; 
static const id emojiSmileys[12] = EMOJISMILEYS; 

- (void)setText:(NSString *)text
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    int i = 0;
    NSRange range= {0, [text length]};
    
    
    for (i=0; i<20; i++) {
        /* does a search-and-replace for all strings in the smileys arrays */
        text = [text stringByReplacingOccurrencesOfString:asciiSmileys[i]
                                                             withString:emojiSmileys[i % 12]
                                                                options:NSCaseInsensitiveSearch
                                                                  range:range];
        range.length = [text length];
    }
    
    %orig; %orig; //not sure why this is necessary, but it is :/
    
    [pool drain];
}

+(CGSize)balloonSizeConstrainedToWidth:(float)width text:(id)text subject:(id)subject textBalloonSize:(CGSize*)size subjectBalloonSize:(CGSize*)size5
{

    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    int i = 0;
    NSRange range= {0, [text length]};
    
    
    for (i=0; i<20; i++) {
        /* does a search-and-replace for all strings in the smileys arrays */
        text = [text stringByReplacingOccurrencesOfString:asciiSmileys[i]
                                               withString:emojiSmileys[i % 12]
                                                  options:NSCaseInsensitiveSearch
                                                    range:range];
        range.length = [text length];
    }
    CGSize retval = %orig;
    [pool drain];
    return retval;
    
}


%end
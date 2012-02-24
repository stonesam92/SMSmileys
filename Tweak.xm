#import <Foundation/Foundation.h>
#include "emojiConstants.h"
#include <CoreGraphics/CGGeometry.h>

%hook CKSimpleBalloonView
 
static const id asciiSmileys[20] = { 
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

static const id emojiSmileys[12] = {
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


- (void)setText:(NSString *)text
{
    //NSLog(text);
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
        //NSLog(@"text is now %@", text);
    }
    
    %orig; %orig;
    
    [pool drain];
}

+(CGSize)balloonSizeConstrainedToWidth:(float)width text:(id)text subject:(id)subject textBalloonSize:(CGSize*)siz subjectBalloonSize:(CGSize*)size5
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
        //NSLog(@"text is now %@", text);
    }
    CGSize retval = %orig;
    [pool drain];
    return retval;
    
}

//-(id)initWithFrame:(CGRect)frame delegate:(id)delegate
//{
//    CGFloat x = CGRectGetMinX(frame), y = CGRectGetMinY(frame),
//                width = CGRectGetWidth(frame), height = CGRectGetHeight(frame);
//    frame = CGRectMake(x-8, y, width+8, height);
//    return %orig;
//}
//
//-(void)drawRect:(CGRect)frame
//{
//    CGFloat x = CGRectGetMinX(frame), y = CGRectGetMinY(frame),
//    width = CGRectGetWidth(frame), height = CGRectGetHeight(frame);
//    frame = CGRectMake(x-8, y, width+8, height);
//    return %orig;
//}

%end

//%hook CKBalloonView
//- (void)setFrame:(CGRect)frame
//{
//    NSLog(@"bubble with text AAA '%@' AAA has frame with width %f and height %f", [self text], CGRectGetWidth(frame), CGRectGetHeight(frame));
//    CGFloat x = CGRectGetMinX(frame), y = CGRectGetMinY(frame),
//                width = CGRectGetWidth(frame), height = CGRectGetHeight(frame);
//    frame = CGRectMake(x-8, y, width+8, height);
//    %orig;
//}
//
//%end

/*

 [CKSimpleBalloonView balloonSizeConstrainedToWidth:text:subject:textBalloonSize:subjectBalloonSize:] may let oyu adjust width
 
*/
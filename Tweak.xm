#include "emojiConstants.h"

static const id asciiSmileys[20] = ASCIISMILEYS; 
static const id emojiSmileys[12] = EMOJISMILEYS; 

@interface CKTextMessagePartChatItem
@property (strong) id text;
@end

%hook CKTextMessagePartChatItem

- (id)loadTranscriptText {
    NSMutableAttributedString *orig = %orig;

    NSMutableString *mutableString = orig.mutableString;
    NSRange range= {0, [mutableString length]};

    for (int i=0; i<20; i++) {
        /* does a search-and-replace for all strings in the smileys arrays */
        [mutableString replaceOccurrencesOfString:asciiSmileys[i]
                                       withString:emojiSmileys[i % 12]
                                          options:NSCaseInsensitiveSearch
                                            range:range];

        if (range.length != [mutableString length]) {
            range.length = [mutableString length];
        }
    }
    return orig;
}

%end

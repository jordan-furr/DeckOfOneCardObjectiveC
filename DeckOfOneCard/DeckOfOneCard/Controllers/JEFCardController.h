//
//  JEFCardController.h
//  DeckOfOneCard
//
//  Created by Jordan Furr on 3/24/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JEFCard;

NS_ASSUME_NONNULL_BEGIN

@interface JEFCardController : NSObject

+ (void)drawANewCard:(NSNumber *) numberOfCards completion:(void(^) (NSArray<JEFCard *> *_Nullable cards))completion;

+ (void)fetchCardImage:(JEFCard *) card completion:(void(^) (UIImage *_Nullable image))completion;

@end

NS_ASSUME_NONNULL_END

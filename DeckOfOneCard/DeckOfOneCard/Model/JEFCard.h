//
//  JEFCard.h
//  DeckOfOneCard
//
//  Created by Jordan Furr on 3/24/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JEFCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *imageString;

- (instancetype) initWithSuit: (NSString *)suit imageString: (NSString *)imageString;

@end

@interface JEFCard (JSONConvertable)

- (instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end
NS_ASSUME_NONNULL_END

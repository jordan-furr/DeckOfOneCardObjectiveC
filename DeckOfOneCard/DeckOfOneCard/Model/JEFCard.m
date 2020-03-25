//
//  JEFCard.m
//  DeckOfOneCard
//
//  Created by Jordan Furr on 3/24/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

#import "JEFCard.h"

static NSString * const SuitKey = @"suit";
static NSString * const ImageKey = @"image";

@implementation JEFCard

- (instancetype)initWithSuit:(NSString *)suit imageString:(NSString *)imageString
{
    self = [super init];
    
    if (self){
        _suit = suit;
        _imageString = imageString;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *suit = dictionary[SuitKey];
    NSString *imageString = dictionary[ImageKey];
    
    return [self initWithSuit:suit imageString:imageString];
}

@end

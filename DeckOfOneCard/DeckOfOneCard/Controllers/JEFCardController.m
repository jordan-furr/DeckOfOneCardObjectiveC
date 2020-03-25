//
//  JEFCardController.m
//  DeckOfOneCard
//
//  Created by Jordan Furr on 3/24/20.
//  Copyright © 2020 Jordan Furr. All rights reserved.
//

#import "JEFCardController.h"
#import "JEFCard.h"

static NSString * const BaseURLString = @"https://deckofcardsapi.com/api/deck/new/";
static NSString * const DrawComponent = @"draw/";
static NSString * const CountQueryName = @"count";
static NSString * const CardsArray = @"cards";

@implementation JEFCardController

+ (void) drawANewCard:(NSNumber *)numberOfCards completion:(void (^)(NSArray<JEFCard *> * _Nullable))completion
{
    NSURL *baseurl = [NSURL URLWithString:BaseURLString];
    NSURL *drawURL = [baseurl URLByAppendingPathComponent:DrawComponent];
    NSString *cardCount = [numberOfCards stringValue];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *queryitem = [NSURLQueryItem queryItemWithName:CountQueryName value:cardCount];
    
    urlComponents.queryItems = @[queryitem];
    
    NSURL *searchURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data){
            NSLog(@"Error : no data");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options: 2 error: &error];
        
        if(!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"unable to create dictionary from data");
            completion(nil);
            return;
        }
        
        NSArray *cardsArray = jsonDictionary[CardsArray];
        
        NSMutableArray *cardsPlaceholder = [NSMutableArray array];
        
        for(NSDictionary *cardDict in cardsArray){
            JEFCard *card = [[JEFCard alloc] initWithDictionary:cardDict];
            [cardsPlaceholder addObject:card];
        }
        completion(cardsPlaceholder);
        
    }] resume];
}

+(void) fetchCardImage:(JEFCard *)card completion:(void (^)(UIImage * _Nullable))completion {
    NSURL *imageURL = [NSURL URLWithString:card.imageString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data){
            NSLog(@"Error : no data");
            completion(nil);
            return;
        }
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
    }]resume];
}

@end

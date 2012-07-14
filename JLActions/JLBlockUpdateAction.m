//
//  JLBlockUpdateAction.m
//  JLActions-Example
//
//  Created by Jarod Luebbert on 7/13/12.
//  Copyright (c) 2012 MindSnacks. All rights reserved.
//

#import "JLBlockUpdateAction.h"

@interface JLBlockUpdateAction ()

@property (nonatomic, copy) UpdateHandler handler;

@end

@implementation JLBlockUpdateAction

@synthesize handler=_handler;

+ (id)actionWithBlock:(UpdateHandler)handler
{
    return [[[self alloc] initWithBlock:handler] autorelease];
}

- (id)initWithBlock:(UpdateHandler)handler
{
    if ((self = [super init]))
    {
        self.handler = handler;
    }
    
    return self;
}

- (void)step:(ccTime)time
{
    _handler(target_, time);
}

- (id)copyWithZone:(NSZone *)zone
{
    CCAction *copy = [[(JLBlockUpdateAction *)[self class] copyWithZone:zone] initWithBlock:_handler];
    return copy;
}

- (BOOL)isDone
{
    return NO;
}

#pragma mark - Clean up

- (void)dealloc
{
    [_handler release];
    [super dealloc];
}

@end

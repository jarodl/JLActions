//
//  JLBlockUpdateAction.h
//  JLActions-Example
//
//  Created by Jarod Luebbert on 7/13/12.
//  Copyright (c) 2012 MindSnacks. All rights reserved.
//

#import "CCActionInterval.h"

typedef void (^UpdateHandler)(id sender, ccTime delta);

@interface JLBlockUpdateAction : CCAction <NSCopying>

/** creates an action with a block called on every update **/
+ (id)actionWithBlock:(UpdateHandler)handler;
/** initializes the action with a block called on every update **/
- (id)initWithBlock:(UpdateHandler)handler;

@end

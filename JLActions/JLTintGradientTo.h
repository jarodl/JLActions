//
//  JLTintGradientTo.h
//  JLActions
//
//  Created by Jarod Luebbert on 7/13/12.
//  Copyright MindSnacks 2012. All rights reserved.
//

#import "CCActionInterval.h"

@interface JLTintGradientTo : CCActionInterval <NSCopying>

/** creates an action with duration, start and end color for the gradient */
+(id) actionWithDuration:(ccTime)duration start:(ccColor3B)start end:(ccColor3B)end;
/** initializes the action with duration, start and end color for the gradient */
-(id) initWithDuration:(ccTime)duration start:(ccColor3B)start end:(ccColor3B)end;

@end
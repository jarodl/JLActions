//
//  JLTintGradientTo.m
//  JLActions
//
//  Created by Jarod Luebbert on 7/13/12.
//  Copyright MindSnacks 2012. All rights reserved.
//

#import "JLTintGradientTo.h"
#import "CCLayer.h"

static inline ccColor3B
ccColor3BTransitionStep(const ccColor3B from, const ccColor3B to, const ccTime t)
{
    return ccc3(from.r + (to.r - from.r) * t, 
                from.g + (to.g - from.g) * t,
                from.b + (to.b - from.b) * t);
}

static inline ccColor3B
ccColor3BNegation(const ccColor3B color)
{
    return ccc3(-color.r, -color.g, -color.b);
}

@interface JLTintGradientTo ()

@property (nonatomic, assign) ccColor3B start;
@property (nonatomic, assign) ccColor3B end;
@property (nonatomic, assign) ccColor3B startFrom;
@property (nonatomic, assign) ccColor3B endFrom;

@end

@implementation JLTintGradientTo

@synthesize start=_start;
@synthesize end=_end;
@synthesize startFrom=_startFrom;
@synthesize endFrom=_endFrom;

+ (id)actionWithDuration:(ccTime)duration start:(ccColor3B)start end:(ccColor3B)end
{
    return [[[self alloc] initWithDuration:duration start:start end:end] autorelease];
}

- (id)initWithDuration:(ccTime)duration start:(ccColor3B)start end:(ccColor3B)end
{
    if ((self = [super initWithDuration:duration]))
    {
        _start = start;
        _end = end;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    CCAction *copy = [[(JLTintGradientTo *)[self class] copyWithZone:zone] initWithDuration:[self duration]
                                                                                      start:_start
                                                                                        end:_end];
    return copy;
}

- (void)startWithTarget:(id)target
{
    NSAssert([target isKindOfClass:[CCLayerGradient class]], @"target must be CCLayerGradient");
    [super startWithTarget:target];
    CCLayerGradient *layer = (CCLayerGradient *)target;
    _startFrom = layer.startColor;
    _endFrom = layer.endColor;
}

- (void)update:(ccTime)time
{
    CCLayerGradient *tn = (CCLayerGradient *)target_;
    ccColor3B nextStart = ccColor3BTransitionStep(_startFrom, _start, time);
    ccColor3B nextEnd = ccColor3BTransitionStep(_endFrom, _end, time);
    [tn setStartColor:nextStart];
    [tn setEndColor:nextEnd];
}

@end
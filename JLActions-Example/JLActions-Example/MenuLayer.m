//
//  MenuLayer.m
//  JLActions-Example
//
//  Created by Jarod Luebbert on 7/13/12.
//  Copyright MindSnacks 2012. All rights reserved.
//


#import "MenuLayer.h"
#import "AppDelegate.h"
#import "JLTintGradientTo.h"

typedef void (^MenuItemHandler)(id sender);

@implementation MenuLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MenuLayer *layer = [MenuLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if ((self = [super init]))
    {
        CGSize size = [[CCDirector sharedDirector] winSize];
        
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"JLActions" fontName:@"Marker Felt" fontSize:64];
		label.position =  ccp( size.width /2 , size.height/2 );
		[self addChild: label];

		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		// Achievement Menu Item using blocks
        MenuItemHandler tintToBlock = ^(id sender) {
            ccColor4B start = ccc4(176, 134, 188, 255);
            ccColor3B startTo = ccc3(106, 179, 197);
            ccColor4B end = ccc4(133, 116, 172, 255);
            ccColor3B endTo = ccc3(76, 144, 159);
            CCLayerGradient *layer = [CCLayerGradient layerWithColor:start fadingTo:end];
            layer.contentSize = size;
            [self addChild:layer];
            float duration = 0.5f;
            id tintTo = [JLTintGradientTo actionWithDuration:duration start:startTo end:endTo];
            id tintBack = [JLTintGradientTo actionWithDuration:duration
                                                         start:ccc3(start.r, start.g, start.b)
                                                           end:ccc3(end.r, end.g, end.b)];
            id tintForever = [CCRepeatForever actionWithAction:
                              [CCSequence actions:
                               tintTo,
                               tintBack,
                               nil]];
            [layer runAction:tintForever];
        };
		CCMenuItem *tintGradientTo = [CCMenuItemFont itemWithString:@"JLTintGradientTo"
                                                              block:tintToBlock];

		CCMenu *menu = [CCMenu menuWithItems:tintGradientTo, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp(size.width / 2, size.height / 2 - 50)];
		
		[self addChild:menu];
	}
    
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

@end

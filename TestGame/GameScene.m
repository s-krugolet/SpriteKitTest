//
//  GameScene.m
//  TestGame
//
//  Created by sarayev on 9/25/14.
//  Copyright (c) 2014 akvelon. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    [self setupScene];
    
    
    
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//    
//    myLabel.text = @"Hello, World!";
//    myLabel.fontSize = 65;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
//    
//    [self addChild:myLabel];
}

- (void) setupScene
{
    [self setBackgroundColor:[SKColor orangeColor]];
    [[self physicsWorld] setGravity:CGVectorMake(0, -1)];
    [self SKShapeNodeDemo];
//    [self setupPhysicsProperties];
//    [self setupPhysics];
//    [self setupSprites];
//    [self setupShapes];
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    /* Called when a touch begins */
//    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
//    }
//}

- (void)setupSprites
{
    SKTexture *texture = [SKTexture textureWithImage:[UIImage imageNamed:@"desert_BG"]];
    
    SKSpriteNode *backgroundSprite = [SKSpriteNode spriteNodeWithTexture:texture];
    [backgroundSprite setName:@"Background"];
    [backgroundSprite setSize: [[UIScreen mainScreen] bounds].size];
    [backgroundSprite setPosition:CGPointZero];
    [backgroundSprite setAnchorPoint:CGPointZero];
    
    [self addChild:backgroundSprite];
    
    SKSpriteNode *simpleSprite = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(50, 50)];
    [simpleSprite setName:@"SimpleSprite"];
    [simpleSprite setPosition:CGPointMake(200, 150)];
    [simpleSprite setZPosition:1];
    
    [self addChild:simpleSprite];
    
    SKSpriteNode *imageSprite = [SKSpriteNode spriteNodeWithImageNamed:@"DerevoOpora"];
    [imageSprite setName:@"ImageSprite"];
    [imageSprite setSize:CGSizeMake(100, 15)];
    [imageSprite setPosition:CGPointMake(250, 50)];
    
    [self addChild:imageSprite];
}

- (void)setupShapes
{
    SKShapeNode *circleShape = [SKShapeNode shapeNodeWithCircleOfRadius:20];
    [circleShape setName:@"Circle"];
    [circleShape setPosition:CGPointMake(50, 200)];
    [circleShape setFillColor:[UIColor redColor]];
    [circleShape setLineWidth:10];
    [circleShape setStrokeColor:[UIColor blueColor]];
    
    [self addChild:circleShape];
    
    SKShapeNode *quad = [SKShapeNode shapeNodeWithRect:CGRectMake(0, 0, 50, 50)];
    [quad setName:@"Quad"];
    [quad setPosition:CGPointMake(100, 200)];
    [quad setFillColor:[UIColor blackColor]];
    [quad setLineWidth:4];
    [quad setStrokeColor:[UIColor whiteColor]];
    
    [self addChild:quad];
    
    SKShapeNode *ellips = [SKShapeNode shapeNodeWithEllipseInRect:CGRectMake(0, 0, 50, 90)];
    [ellips setName:@"Ellips"];
    [ellips setPosition:CGPointMake(200, 200)];
    [ellips setFillColor:[UIColor purpleColor]];
    [ellips setLineWidth:2];
    [ellips setStrokeColor:[UIColor greenColor]];
    [ellips setGlowWidth:5];
    
    [self addChild:ellips];
   
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:12];

    SKShapeNode *roundRect = [SKShapeNode shapeNodeWithPath:path.CGPath centered:YES];
    [roundRect setName:@"RoundRect"];
    [roundRect setPosition:CGPointMake(50, 100)];
    [roundRect setFillColor:[UIColor blueColor]];
    [roundRect setLineWidth:2];
    [roundRect setStrokeColor:[UIColor redColor]];
    
    [self addChild:roundRect];
    
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint:CGPointMake(0, 0)];
    [trianglePath addLineToPoint:CGPointMake(-25, -50)];
    [trianglePath addLineToPoint:CGPointMake(25, -50)];
    [trianglePath addLineToPoint:CGPointMake(0, 0)];
    
    SKShapeNode *triangle = [SKShapeNode shapeNodeWithPath:trianglePath.CGPath centered:YES];
    [triangle setName:@"Triangle"];
    [triangle setPosition:CGPointMake(200, 70)];
    [triangle setFillColor:[UIColor blueColor]];
    [triangle setLineWidth:2];
    [triangle setStrokeColor:[UIColor blackColor]];
    
    [self addChild:triangle];
}

- (void)setupPhysics
{
    SKShapeNode *rectangle = [SKShapeNode shapeNodeWithRect:CGRectMake(-580/2, -10, 580, 20)];
    [rectangle setName:@"Rectangle"];
    [rectangle setPosition:CGPointMake(280, 40)];
    [rectangle setFillColor:[SKColor whiteColor]];
    
    SKPhysicsBody *rectanglePhysics = [SKPhysicsBody bodyWithRectangleOfSize:[rectangle frame].size];
    [rectanglePhysics setDynamic:NO];
    
    [rectangle setPhysicsBody:rectanglePhysics];
    
    [self addChild:rectangle];
    
    
    
    SKShapeNode *circle = [SKShapeNode shapeNodeWithCircleOfRadius:40];
    [circle setName:@"Circle"];
    [circle setPosition:CGPointMake(100, 160)];
    [circle setStrokeColor:[SKColor greenColor]];
    [circle setLineWidth:2];
    
    SKPhysicsBody *circlePhysics = [SKPhysicsBody bodyWithCircleOfRadius:[circle frame].size.width / 2];
    [circlePhysics setDynamic:YES];
    
    [rectangle setPhysicsBody:rectanglePhysics];
    
    [self addChild:circle];
    
    
    
    SKTexture *texture = [SKTexture textureWithImageNamed:@"DerevoOpora"];
    
    SKSpriteNode *texturedSprite = [SKSpriteNode spriteNodeWithTexture:texture];
    [texturedSprite setName:@"Texture"];
    [texturedSprite setPosition:CGPointMake(200, 180)];
    [texturedSprite setSize:CGSizeMake(100, 30)];
    
    SKPhysicsBody *texturedPhysics = [SKPhysicsBody bodyWithRectangleOfSize:[texturedSprite frame].size];
    [texturedPhysics setDynamic:YES];
    
    [texturedSprite setPhysicsBody:texturedPhysics];
    
    [self addChild:texturedSprite];
    
    
    
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint:CGPointMake(0,0)];
    [trianglePath addLineToPoint:CGPointMake(-50, -100)];
    [trianglePath addLineToPoint:CGPointMake(50, -100)];
    [trianglePath addLineToPoint:CGPointMake(0, 0)];
    
    SKShapeNode *triangle = [SKShapeNode shapeNodeWithPath:trianglePath.CGPath centered:YES];
    [triangle setName:@"Triangle"];
    [triangle setPosition:CGPointMake(400, 190)];
    [triangle setStrokeColor:[SKColor blackColor]];
    [triangle setLineWidth:2];
    [triangle setFillColor:[UIColor blueColor]];
    
    SKPhysicsBody *trianglePhysics = [SKPhysicsBody bodyWithPolygonFromPath:trianglePath.CGPath];
    [trianglePhysics setDynamic:YES];
    
    [triangle setPhysicsBody:trianglePhysics];
    
    [self addChild:triangle];
    
    
    
    SKLabelNode *label = [SKLabelNode labelNodeWithText:@"Xcode"];
    [label setName:@"Label"];
    [label setPosition:CGPointMake(500, 200)];
    [label setFontSize:22];
    
    SKPhysicsBody *labelPhysics = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(-25, -25, 50, 50)];
    
    [label setPhysicsBody:labelPhysics];
    
    [self addChild:label];
}

-(void)setupPhysicsProperties
{
    
    float RotateAngle = 10 * (2 * M_PI)/360;
    
    
    SKShapeNode *Opora1 = [SKShapeNode shapeNodeWithRect:CGRectMake(-150/2, -10, 150, 20)];
    Opora1.position = CGPointMake(100, 200);
    Opora1.strokeColor = [SKColor greenColor];
    Opora1.fillColor = [SKColor greenColor];
    Opora1.name = @"Opora1";
    Opora1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:Opora1.frame.size];
    Opora1.physicsBody.dynamic = NO;
    Opora1.zRotation = -RotateAngle;
    [self addChild:Opora1];
    
    
    SKShapeNode *Opora2 = [SKShapeNode shapeNodeWithRect:CGRectMake(-150/2, -10, 150, 20)];
    Opora2.position = CGPointMake(468, 200);
    Opora2.strokeColor = [SKColor redColor];
    Opora2.fillColor = [SKColor redColor];
    Opora2.name = @"Opora2";
    Opora2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:Opora2.frame.size];
    Opora2.physicsBody.dynamic = NO;
    Opora2.zRotation = RotateAngle;
    [self addChild:Opora2];
    
    
    
    SKShapeNode *Opora3 = [SKShapeNode shapeNodeWithRect:CGRectMake(-568/2, -10, 568, 20)];
    Opora3.position = CGPointMake(568/2, 10);
    Opora3.strokeColor = [SKColor yellowColor];
    Opora3.fillColor = [SKColor yellowColor];
    Opora3.name = @"Opora3";
    Opora3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:Opora3.frame.size];
    Opora3.physicsBody.dynamic = NO;
    [self addChild:Opora3];
    
    
    
    SKShapeNode *Circle1 = [SKShapeNode shapeNodeWithCircleOfRadius:15];
    Circle1.position = CGPointMake(250, 280);
    Circle1.strokeColor = [SKColor whiteColor];
    Circle1.fillColor = [SKColor blackColor];
    Circle1.name = @"Circle1";
    Circle1.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:15];
    Circle1.physicsBody.restitution = 0;
    [self addChild:Circle1];
    
    
    SKShapeNode *Circle2 = [SKShapeNode shapeNodeWithCircleOfRadius:15];
    Circle2.position = CGPointMake(310, 280);
    Circle2.strokeColor = [SKColor whiteColor];
    Circle2.fillColor = [SKColor purpleColor];
    Circle2.name = @"Circle2";
    Circle2.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:15];
    Circle2.physicsBody.restitution = 0.7;
    [self addChild:Circle2];
    
    
    
    
    SKShapeNode *Quad1 = [SKShapeNode shapeNodeWithRect:CGRectMake(-30/2, -30/2, 30, 30)];
    Quad1.position = CGPointMake(50, 320);
    Quad1.strokeColor = [SKColor whiteColor];
    Quad1.fillColor = [SKColor whiteColor];
    Quad1.name = @"Quad1";
    Quad1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:Quad1.frame.size];
    Quad1.physicsBody.friction = 1;
    [self addChild:Quad1];
    
    
    
    SKShapeNode *Quad2 = [SKShapeNode shapeNodeWithRect:CGRectMake(-30/2, -30/2, 30, 30)];
    Quad2.position = CGPointMake(518, 320);
    Quad2.strokeColor = [SKColor blackColor];
    Quad2.fillColor = [SKColor blackColor];
    Quad2.name = @"Quad2";
    Quad2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:Quad2.frame.size];
    Quad2.physicsBody.friction = 0.1;
    [self addChild:Quad2];
    
    
}

-(void)SKShapeNodeDemo
{
    //Создаем наш SKShapeNode и инициализируем его. В качестве параметра передаем радиус.
    SKShapeNode *Circle = [SKShapeNode shapeNodeWithCircleOfRadius:20];
    Circle.position = CGPointMake(50, 200); // задаем позицию.
    Circle.lineWidth = 10; // задаем ширину линий.
    Circle.strokeColor = [SKColor blueColor]; // задаем цвет контура.
    Circle.fillColor = [SKColor redColor]; // задаем цвет внутренности.
    Circle.name = @"Circle"; // задаем имя.
    [self addChild:Circle]; // добавляем наш объект на нашу сцену.
    
    //Создаем наш SKShapeNode и инициализируем его. В качестве параметра передаем координаты и размер прямоугольника (CGRectMake).
    SKShapeNode *Quad = [SKShapeNode shapeNodeWithRect:CGRectMake(0, 0, 50, 50)];
    Quad.position = CGPointMake(100, 200); // задаем позицию.
    Quad.lineWidth = 4; // задаем ширину линий.
    Quad.strokeColor = [SKColor whiteColor]; // задаем цвет контура.
    Quad.fillColor = [SKColor blackColor]; // задаем цвет внутренности.
    Quad.name = @"Quad"; // задаем имя.
    [self addChild:Quad]; // добавляем наш объект на нашу сцену.
    
    // Создаем наш SKShapeNode и инициализируем его. В качестве параметра передаем координаты и размер прямоугольника (CGRectMake).
    // В данном случае форма эллипса будет создана внутри прямоугольника в соответствии с его размерами.
    SKShapeNode *Ellips = [SKShapeNode shapeNodeWithEllipseInRect:CGRectMake(0, 0, 50, 90)];
    Ellips.position = CGPointMake(200, 200); // задаем позицию.
    Ellips.lineWidth = 2; // задаем ширину линий.
    Ellips.strokeColor = [SKColor greenColor]; // задаем цвет контура.
    Ellips.fillColor = [SKColor purpleColor]; // задаем цвет внутренности.
    Ellips.glowWidth = 5; // задаем эффект свечение контура.
    Ellips.name = @"Ellips"; // задаем имя.
    [self addChild:Ellips]; // добавляем наш объект на нашу сцену.
    
    
    
    // Создаем и инициализируем объект типа UIBezierPath. В качестве параметра передаем координаты и размер прямоугольника (CGRectMake),
    // а также радиус округление углов.
    UIBezierPath *RoundedRectPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:12];
    
    // Создаем наш SKShapeNode и инициализируем его. В качестве параметра передаем объект созданный нами выше и булева значение.
    // обратите внимание на то, что к объекту передаваемому в первом параметре добавляется свойство CGPath.
    SKShapeNode *RoundedRect = [ SKShapeNode shapeNodeWithPath:RoundedRectPath.CGPath centered:YES];
    RoundedRect.position = CGPointMake(50, 100); // задаем позицию.
    RoundedRect.lineWidth = 2;  // задаем ширину линий.
    RoundedRect.strokeColor = [SKColor blueColor]; // задаем цвет контура.
    RoundedRect.fillColor = [SKColor redColor]; // задаем цвет внутренности.
    RoundedRect.name = @"RoundedRect"; // задаем имя.
    [self addChild:RoundedRect]; // добавляем наш объект на нашу сцену.
    
    
    UIBezierPath *TrianglePath = [UIBezierPath bezierPath];  // Создаем и инициализируем объект типа UIBezierPath.
    [TrianglePath moveToPoint:CGPointMake(0, 0)]; // переходим на точку с заданными координатами.
    [TrianglePath addLineToPoint:CGPointMake(-25, -50)]; // добавляем линию к заданной точке.
    [TrianglePath addLineToPoint:CGPointMake(25, -50)]; // добавляем линию к заданной точке.
    [TrianglePath addLineToPoint:CGPointMake(0, 0)]; // добавляем линию к заданной точке.
    
    // Создаем наш SKShapeNode и инициализируем его. В качестве параметра передаем объект созданный нами выше и булева значение.
    // обратите внимание на то, что к объекту передаваемому в первом параметре добавляется свойство CGPath.
    SKShapeNode *Triangle = [SKShapeNode shapeNodeWithPath:TrianglePath.CGPath centered:YES];
    Triangle.position = CGPointMake(200, 70); // задаем позицию.
    Triangle.lineWidth = 2; // задаем ширину линий.
    Triangle.strokeColor = [SKColor blackColor]; // задаем цвет контура.
    Triangle.fillColor = [SKColor blueColor]; // задаем цвет внутренности.
    Triangle.name = @"Triangle"; // задаем имя.
    [self addChild:Triangle]; // добавляем наш объект на нашу сцену.
    
}

-(void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
}

@end

//
//  ViewController.m
//  test
//
//  Created by Nazir on 09/01/2017.
//  Copyright © 2017 m-4-b.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize inViewContainerC;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self insertLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertLabel {
    NSMutableArray * content = [self arrayOfLabelContent];
    [content enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel * label = [self label];
        [label setText:obj];
        
        [inViewContainerC addSubview:label];
        
        [self setConstraints:label];
        
        lastAddedLabel = label;
    }];
    
    //Bottom
    NSLayoutConstraint * bottom =[NSLayoutConstraint
                              constraintWithItem:inViewContainerC
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:lastAddedLabel
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0f
                              constant:20.f];
    
    [inViewContainerC addConstraint:bottom];
    
    [self.view layoutIfNeeded];
}

- (UILabel *)label {
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setNumberOfLines:0];
    [label setTextColor:[UIColor blackColor]];
    [label setBackgroundColor:[UIColor lightTextColor]];
    
    return label;
}

- (void)setConstraints:(UILabel *)label {
    
    label.translatesAutoresizingMaskIntoConstraints = NO;
    lastAddedLabel.translatesAutoresizingMaskIntoConstraints = NO;

    
    //Trailing
    NSLayoutConstraint * trailing =[NSLayoutConstraint
                                   constraintWithItem:inViewContainerC
                                   attribute:NSLayoutAttributeTrailing
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:label
                                   attribute:NSLayoutAttributeTrailing
                                   multiplier:1.0f
                                   constant:20.f];
    
    //Leading
    
    NSLayoutConstraint * leading = [NSLayoutConstraint
                                   constraintWithItem:label
                                   attribute:NSLayoutAttributeLeading
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:inViewContainerC
                                   attribute:NSLayoutAttributeLeading
                                   multiplier:1.0f
                                   constant:20.f];
    
    [inViewContainerC addConstraint:trailing];
    [inViewContainerC addConstraint:leading];
    
    if (lastAddedLabel == nil) {
        //Top
        NSLayoutConstraint * top = [NSLayoutConstraint
                                     constraintWithItem:label
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:inViewContainerC
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1.0f
                                     constant:20.f];
        
        [inViewContainerC addConstraint:top];
        
    } else {
        //Top
        NSLayoutConstraint * top = [NSLayoutConstraint
                                    constraintWithItem:label
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:lastAddedLabel
                                    attribute:NSLayoutAttributeBottom
                                    multiplier:1.0f
                                    constant:20.f];
        
        [inViewContainerC addConstraint:top];
        
        //Top
        NSLayoutConstraint * bottom = [NSLayoutConstraint
                                    constraintWithItem:label
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:lastAddedLabel
                                    attribute:NSLayoutAttributeBottom
                                    multiplier:1.0f
                                    constant:20.f];
        
        [inViewContainerC addConstraint:bottom];
        
    }
}


- (NSMutableArray *)arrayOfLabelContent {
    NSMutableArray * array = [[NSMutableArray alloc] init];
    [array addObject:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Semper nisi proin scelerisque varius facilisis proin: Aliquam elementum eleifend sed penatibus imperdiet pede! Facilisis facilisi per"];
    
    [array addObject:@"iaculis cubilia dui vulputate! Curabitur curae; proin natoque conubia rutrum senectus: Iaculis dignissim etiam! Sed ligula egestas metus tortor urna"];
    
    [array addObject:@"Nec amet suscipit bibendum urna nam potenti: Ligula hendrerit pharetra! Torquent dui erat enim venenatis quam?"];
    [array addObject:@"Per elit natoque habitant; Risus integer consequat tortor aliquet felis! Parturient class potenti eros donec? Leo nec curabitur... Fringilla lacus ut... Dictum nullam adipiscing per augue. Pharetra sit dolor eros... In justo magna felis pede tempus nam venenatis. Class imperdiet gravida nulla sem: Elit etiam ultricies arcu! Montes ullamcorper ultricies auctor enim litora feugiat cubilia. Dis nibh eros magnis maecenas: Vivamus parturient id nibh pede pellentesque volutpat: Egestas scelerisque class ac. Dolor lectus conubia mus; Vel suscipit elementum!"];
    return array;
}

@end

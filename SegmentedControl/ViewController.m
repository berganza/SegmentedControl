//
//  ViewController.m
//  SegmentedControl
//
//  Created by BerAir on 13/10/13.
//  Copyright (c) 2013 BerAir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView * vista = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    vista.backgroundColor = [UIColor cyanColor];
    
    NSArray * nombresSegmentoUno = [NSArray arrayWithObjects:@"uno",@"dos",@"tres",@"cuatro", nil];
    _segmentoUno = [[UISegmentedControl alloc] initWithItems:nombresSegmentoUno];
    _segmentoUno.frame = CGRectMake(10, 40, 300, 50);
    _segmentoUno.selectedSegmentIndex = 0;
    _segmentoUno.tintColor = [UIColor blackColor];
    _segmentoUno.backgroundColor = [UIColor yellowColor];
    
    [vista addSubview:_segmentoUno];
    
    
    
    NSArray * nombresSegmentoDos = [NSArray arrayWithObjects:@"DER", @"IZQ", @"ARR", @"ABA", nil];
    _segmentoDos = [[UISegmentedControl alloc] initWithItems:nombresSegmentoDos];
    _segmentoDos.frame = CGRectMake(10, 120, 300, 50);
    _segmentoDos.selectedSegmentIndex = 2;
    
    [vista addSubview:_segmentoDos];
    
    
    
    
    _boton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _boton.frame = CGRectMake(90, 200, 150, 50);
    [_boton setTitle: @"mostrar" forState:UIControlStateNormal];
    [_boton addTarget:self action:@selector(pulsar:) forControlEvents: UIControlEventTouchUpInside];
    _boton.tintColor = [UIColor whiteColor];
    _boton.backgroundColor = [UIColor redColor];
    _boton.titleLabel.font = [UIFont systemFontOfSize:24];
    
    [vista addSubview:_boton];
    

    
    _capaAzul = [CALayer layer];
    _capaPurpura = [CALayer layer];
    _contenedor = [CALayer layer];
    
    [vista.layer addSublayer:_contenedor];
    [_contenedor addSublayer:_capaAzul];
    [_contenedor addSublayer:_capaPurpura];
    

    
    self.view = vista;
    
}



-(void)viewWillAppear:(BOOL)animated {
    
    CGRect cuadrado = CGRectMake(0, 0, 200, 200);
    
    _contenedor.backgroundColor = [[UIColor clearColor] CGColor];
    _contenedor.bounds = cuadrado;
    _contenedor.position = CGPointMake(160, 400);
    [_contenedor setNeedsDisplay];
    
    _capaAzul.backgroundColor = [[UIColor blueColor] CGColor];
    _capaAzul.bounds = cuadrado;
    _capaAzul.position = CGPointMake(100, 100);
    _capaAzul.hidden = YES;
    [_capaAzul setNeedsDisplay];
    
    _capaPurpura.backgroundColor = [[UIColor purpleColor] CGColor];
    _capaPurpura.bounds = cuadrado;
    _capaPurpura.position = CGPointMake(100, 100);
    [_capaPurpura setNeedsDisplay];
    
}




-(void) pulsar:(id)sender {

    CATransition *transition = [CATransition animation];
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    NSString *transitionTypes[4] = { kCATransitionPush, kCATransitionMoveIn, kCATransitionReveal, kCATransitionFade };
    transition.type = transitionTypes[_segmentoUno.selectedSegmentIndex];
    
    NSString *transitionSubtypes[4] = { kCATransitionFromRight, kCATransitionFromLeft,  kCATransitionFromBottom, kCATransitionFromTop };
    transition.subtype = transitionSubtypes[_segmentoDos.selectedSegmentIndex];
    
    [_contenedor addAnimation:transition forKey:nil];
    _capaAzul.hidden = !_capaAzul.hidden;
    _capaPurpura.hidden = !_capaPurpura.hidden;

}


@end

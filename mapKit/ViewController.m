//
//  ViewController.m
//  mapKit
//
//  Created by 山本　援 on 2015/09/17.
//  Copyright (c) 2015年 En Yamamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MapViewオブジェクトを生成
    //初期化
    MKMapView *mapView = [[MKMapView alloc] init];
    
    //大きさ、位置を決定
    //iphone4サイズ
    //20にすると上がいい感じに表示される
    //余白なく表示
    mapView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20);
    
    //表示位置を設定
    //coという変数作ってる
    CLLocationCoordinate2D co;
    
    //アヤラの位置を設定
    co.latitude = 10.317347;//緯度
    co.longitude = 123.905759;//経度
    
    [mapView setCenterCoordinate:co];
    
    //縮尺を指定
    MKCoordinateRegion cr = mapView.region;
    
    //地図の範囲を指定（緯度）
    //この数字を小さくするともっと細かい地図になる
    cr.span.latitudeDelta = 0.05;
    
    //地図の範囲を指定（経度）
    cr.span.longitudeDelta = 0.05;
    
    cr.center = co;
    
    [mapView setRegion:cr];
    
    //地図の表示種類設定
//    mapView.mapType = MKMapTypeSatellite;
//    mapView.mapType = MKMapTypeHybrid;
    mapView.mapType = MKMapTypeStandard;
    
    //ピンをたてる
    //緯度経度はアヤラ
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = CLLocationCoordinate2DMake(10.317347, 123.905759);
    pin.title = @"アヤラ";
    pin.subtitle = @"セブて１番大きい";
    [mapView addAnnotation:pin];
    
    //もうひとつピンSM
    MKPointAnnotation *pin2 = [[MKPointAnnotation alloc] init];
    pin2.coordinate = CLLocationCoordinate2DMake(10.311715, 123.918332);
    pin2.title = @"SMモール";
    pin2.subtitle = @"セブで２番目に大きい";
    
    [mapView addAnnotation:pin2];
    
    //もうひとつピン2quad
    MKPointAnnotation *pin3 = [[MKPointAnnotation alloc] init];
    pin3.coordinate = CLLocationCoordinate2DMake(10.314276, 123.90535);
    pin3.title = @"2QUAD";
    pin3.subtitle = @"NexSeed";
    
    [mapView addAnnotation:pin3];
    
    //セブカントリークラブ
    MKPointAnnotation *pin4 = [[MKPointAnnotation alloc] init];
    pin4.coordinate = CLLocationCoordinate2DMake(10.329878, 123.900071);
    pin4.title = @"セブカントリークラブ";
    pin4.subtitle = @"セブにゴルフ場！";
    
    [mapView addAnnotation:pin4];
    
    //ITパーク
    MKPointAnnotation *pin5 = [[MKPointAnnotation alloc] init];
    pin5.coordinate = CLLocationCoordinate2DMake(10.338069, 123.900071);
    pin5.title = @"ITパーク";
    pin5.subtitle = @"最近できたラーメン屋が激ウマ！";
    
    [mapView addAnnotation:pin5];
    
    //表示するためにViewに追加
    //これは常に最後.じゃないと表示されない
    [self.view addSubview:mapView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

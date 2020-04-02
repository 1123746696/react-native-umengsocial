
#import "RNUmengSocial.h"
#import <UMSocialCore/UMSocialCore.h>
@implementation RNUmengSocial
RCT_EXPORT_MODULE();
/**
 *  设置Umeng key
 *
 *  @param key          key
 */
RCT_EXPORT_METHOD(setUmengAppKey:(NSString *)key){
    [[UMSocialManager defaultManager] setUmSocialAppkey:key];
}
/**
 *  设置Umeng key
 *
 *  @param key          key
 */
RCT_EXPORT_METHOD(openLog:(BOOL)isOpen){
    [[UMSocialManager defaultManager] openLog:isOpen];
}
/***
 * 设置平台账号
 * @param type     类别0,新浪 1,微信 2,朋友圈  4,qq  5,Qzone    12,短信
 * @param appkey   key
 * @param appSecret secret
 * @param redirectURL   redirectURL
 */
RCT_EXPORT_METHOD(setPlaform:(NSInteger)type appkey:(NSString *)appkey appSecret:(NSString *)appSecret redirectURL:(NSString *)redirectURL){
    [[UMSocialManager defaultManager] setPlaform:(UMSocialPlatformType)type appKey:appkey appSecret:appSecret redirectURL:redirectURL];
}
/**
 *  分享到社交平台
 *
 *  @param title          分享的title
 *  @param description    分享的描述信息
 *  @param image          分享的图片路径（本地路径）
 *  @param url            分享的链接URL
 *  @param type           分享的类型 0,新浪 1,微信 2,朋友圈  4,qq  5,Qzone    12,短信
 *  @param callback       分享成功的回调
 */
RCT_EXPORT_METHOD(share:(NSString *)title description:(NSString *)description url:(NSString *)url imageUrl:(NSString *)imageUrl type:(NSInteger)type callback:(RCTResponseSenderBlock)callback){
    
    UIViewController *presentingViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    while (presentingViewController.presentedViewController != nil) {
        presentingViewController = presentingViewController.presentedViewController;
    }
    [UmengSocial shareWithTitle:title description:description url:url image:imageUrl type:(UMSocialPlatformType)type fromScene:presentingViewController complate:^(id data, NSError *error){
        NSString *message = nil;
        if (!error) {
            message = [NSString stringWithFormat:@"分享成功"];
            callback(@[[NSNull null],@{@"result":message}]);
        } else {
            message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
            callback(@[[NSNumber numberWithInteger:error.code],@{@"result":message}]);
        }
        
    }];
}

RCT_EXPORT_METHOD(shareMiniProgram:(NSString *)title description:(NSString *)description url:(NSString *)url imageUrl:(NSString *)imageUrl userName:(NSString *)userName path:(NSString *)path callback:(RCTResponseSenderBlock)callback){
    UIViewController *presentingViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    while (presentingViewController.presentedViewController != nil) {
        presentingViewController = presentingViewController.presentedViewController;
    }
    //创建分享消息对象
    UIImage* image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    UMShareMiniProgramObject *shareObject = [UMShareMiniProgramObject shareObjectWithTitle:title descr:description thumImage:image];
    shareObject.webpageUrl = url;
    shareObject.userName = userName;
    shareObject.path = path;
    messageObject.shareObject = shareObject;
    //  shareObject.hdImageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"png"]];
    //  shareObject.miniProgramType = UShareWXMiniProgramTypeRelease; // 可选体验版和开发板
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:presentingViewController completion:^(id data, NSError *error) {
        NSString *message = nil;
        if (!error) {
            message = [NSString stringWithFormat:@"分享成功"];
            callback(@[[NSNull null],@{@"result":message}]);
        } else {
            message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
            callback(@[[NSNumber numberWithInteger:error.code],@{@"result":message}]);
        }
        //      if (error) {
        //          UMSocialLogInfo(@"************Share fail with error %@*********",error);
        //      }else{
        //          if ([data isKindOfClass:[UMSocialShareResponse class]]) {
        //              UMSocialShareResponse *resp = data;
        //              //分享结果消息
        //              UMSocialLogInfo(@"response message is %@",resp.message);
        //              //第三方原始返回的数据
        //              UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
        //          }else{
        //              UMSocialLogInfo(@"response data is %@",data);
        //          }
        //      }
        //      [self alertWithError:error];
    }];
}

/**
 *  获取第三方的用户信息
 *
 *  @param type           分享的类型 0,新浪 1,微信 2,朋友圈  4,qq
 *  @param callback       分享成功的回调
 */
RCT_EXPORT_METHOD(authWithPlatform:(NSInteger)type callback:(RCTResponseSenderBlock)callback{
    [UmengSocial authWithPlatform:type callback:callback];
})

/**
 *  获取第三方的软件是否登录
 *
 *  @param type           分享的类型 0,新浪 1,微信 2,朋友圈  4,qq
 */
RCT_EXPORT_METHOD(isInstallWithPlatform:(NSInteger)type resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject{
    resolve(@([[UMSocialManager defaultManager] isInstall:(UMSocialPlatformType)type]));
})

+(void)shareWithTitle:(NSString *)title description:(NSString *)description url:(NSString *)url image:(NSString *)imageUrl type:(UMSocialPlatformType)type fromScene:(UIViewController *)scene complate:(UMSocialRequestCompletionHandler)completion{
    
    NSString *shareTitle = title;
    NSString *shareContent =description;
    NSString *shareUrl =url;
    if ([BStringUtil emptyOrNull:url]) {
        shareUrl=@"https://www.bnq.com.cn";
    }
    id shareImage = imageUrl;
    if ([BStringUtil emptyOrNull:imageUrl]) {
        shareImage=[UIImage imageNamed:@"share"];
    }
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    messageObject.text=shareContent;
    
    messageObject.shareObject=[UMShareWebpageObject shareObjectWithTitle:shareTitle descr:shareContent thumImage:shareImage];
    ((UMShareWebpageObject *)(messageObject.shareObject)).webpageUrl=shareUrl;
    [[UMSocialManager defaultManager] shareToPlatform:type messageObject:messageObject currentViewController:scene completion:completion];
    
    
}
+(void)authWithPlatform:(NSInteger)type callback:(RCTResponseSenderBlock)callback{
    
    UIViewController *presentingViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    while (presentingViewController.presentedViewController != nil) {
        presentingViewController = presentingViewController.presentedViewController;
    }
    [[UMSocialManager defaultManager] authWithPlatform:(UMSocialPlatformType)type currentViewController:presentingViewController completion:^(id result, NSError *error) {
        
        if (error) {
            callback(@[[NSNumber numberWithInteger:1],@{}]);
        } else {
            UMSocialAuthResponse *resp = result;
            NSLog(@"----------------------------");
            NSLog(@"%@",resp.originalResponse);
            
            NSMutableDictionary *dic= [[NSMutableDictionary alloc] init];
            [dic setObject:resp.openid forKey:@"openId"];
            [dic setObject:resp.accessToken forKey:@"accessToken"];
            if(type==4){
                [dic setObject:[resp.originalResponse objectForKey:@"pf"] forKey:@"pf"];
                [dic setObject:[resp.originalResponse objectForKey:@"pfkey"] forKey:@"pfkey"];
            }
            callback(@[[NSNumber numberWithInteger:0],dic]);
        }
    }];
}
- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

@end
  

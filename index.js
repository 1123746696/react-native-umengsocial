

/**
 * Created by user on 16/10/8.
 */
var UmengSocialModul = require('react-native').NativeModules.RNUmengSocial;
export default class UmengSocial{
    /**
     *  设置Umeng key
     *  @param key          key
     */
    static setUmengAppKey(key:string){
        UmengSocialModul.setUmengAppKey(key)
    }
    static openLog(isOpen:boolean){
        UmengSocialModul.openLog(isOpen)
    }
    /***
     * 设置平台账号
     * @param type     类别0,新浪 1,微信 2,朋友圈  4,qq  5,Qzone    12,短信
     * @param appkey   key
     * @param appSecret secret
     * @param redirectURL   redirectURL
     */
    static setPlaform(type:number,appkey:string,appSecret:string,redirectURL:string){
        UmengSocialModul.setPlaform(type,appkey,appSecret,redirectURL)
    }
    /**
     *  分享到社交平台
     *
     *  @param title          分享的title
     *  @param description    分享的描述信息
     *  @param imageUrl       分享的图片内容logo
     *  @param url            分享的链接URL
     *  @param type           分享的类型 0,新浪 1,微信 2,朋友圈  4,qq  5,Qzone    12,短信
     *  @param callback       分享成功的回调
     */
    static share(title:string,discription:string,url:string,imageUrl:string,type:number,callback:Function) {
        UmengSocialModul.share(title,discription,url,imageUrl,type,(error, events) => {
            console.log('share,result',error, events);
            if(callback){
                callback(error,events)
            }
        })
    }
    /**
     *  分享小程序
     *
     *  @param title          分享的title
     *  @param description    分享的描述信息
     *  @param image          分享的图片路径（本地路径）
     *  @param url            分享的链接URL
     *  @param userName       小程序原始id,在微信平台查询
     *  @param path           小程序页面路径
     *  @param callback       分享成功的回调
     */
    static shareMiniProgram(title:string,discription:string,url:string,imageUrl:string,userName:string,path:string,callback:Function) {
        UmengSocialModul.shareMiniProgram(title,discription,url,imageUrl,userName,path,(error, events) => {
            console.log('share,result',error, events);
            if(callback){
                callback(error,events)
            }
        })
    }
    /**
     *  获取社交平台的用户信息（用于第三方登录）
     *
     *  @param type           分享的类型 0,新浪 1,微信 2,朋友圈  4,qq  5,Qzone    12,短信
     *  @param callback       信息获取成功的回调
     */
    static authWithPlatform(type:number,callback:Function) {
        UmengSocialModul.authWithPlatform(type,(error, events) => {
            console.log('share,result',error, events);
            if(callback){
                callback(error,events)
            }
        })
    }
    static isInstallWithPlatform(type){
        return UmengSocialModul.isInstallWithPlatform(type)
    }
};

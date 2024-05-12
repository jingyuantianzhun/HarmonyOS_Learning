
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';
import image from '@ohos.multimedia.image';
import { Logger } from './Logger';

const TAG = 'MediaTools';

export class MediaTools {

  // 加载图片像素资源
  static async getPixelMapFormResource(context:common.UIAbilityContext,name:resourceManager.Resource):Promise<PixelMap>{
    let resourceMgr = context.resourceManager;
    let fileData = await resourceMgr.getMediaContent(name);
    return await image.createImageSource(fileData.buffer).createPixelMap();
  }
// 获取像素图文件
  static async getPexelMapFormFile(id:string,path:string):Promise<image.PixelMap> {
    Logger.info(TAG,'getPixelMapFormFile id:' + id + ',path:' + path);
    return await image.createImageSource(path).createPixelMap();
  }
  /**
   * 日期不足两位补0
   * @param value 数据值
   * @returns {string} 日期不足两位补0
   */
  private static fill(value:number):string {
    return (value.toString().padStart(2,'0'));
  }
  static msToCountdownTime(ms:number):string{
    if(!ms){
      return '00:00';
    }
    const days = Math.floor(ms/(1000*60*60*24));
    const hours = Math.floor((ms%(1000*60*60*24))/(1000*60*60));
    const minutes = Math.floor((ms%(1000*60*60))/(1000*60));
    const seconds = Math.floor((ms%(1000*60))/1000);
    return `${(days?MediaTools.fill(days)+':':"")}${(hours?MediaTools.fill(hours)+':':"")}
      ${MediaTools.fill(minutes)}:${MediaTools.fill(seconds)}`.trim();
  }
}
























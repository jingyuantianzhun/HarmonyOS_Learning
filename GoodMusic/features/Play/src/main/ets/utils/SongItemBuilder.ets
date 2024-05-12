import common from '@ohos.app.ability.common'
import resourceManager from '@ohos.resourceManager';
import { SongItem } from '../viewmodel/SongData';
import { Logger } from './Logger';

export default class SongItemBuilder {
  private context: common.UIAbilityContext | undefined = AppStorage.Get('context');
  private realUrl?: resourceManager.RawFileDescriptor;
  private songItem: SongItem | null = null;

  /**
   * 为realUrl、songItem赋值
   * @param songItem 歌曲
   * @returns songItem
   */
  public async build(songItem: SongItem): Promise<SongItem> {
    this.songItem = songItem;
    if (!this.songItem) {
      return this.songItem;
    }
     // 根据歌曲src路径获取对应歌曲资源的rawfileFd
    let rawfileFd = await this.context.resourceManager.getRawFd(songItem.src)
      .catch((error: Error) => {
        Logger.error(`resourceManager error cause：${JSON.stringify(error)}`)
      })
    if(rawfileFd){
      this.realUrl = rawfileFd;// 将rawfileFd赋值给realUrl
    }else{
      Logger.error('get rawfileFd failed')
    }
    Logger.info('MediaAssetBuilder build realUrl:' + this.realUrl);
    return this.songItem;
  }
/**
 * 获取realUrl
 * @returns realUrl
 */
  public getRealUrl():resourceManager.RawFileDescriptor | undefined {
    return this.realUrl;
  }
/**
 * 释放rawfileFd资源
 * @returns
 */
  public  async release():Promise<void>{
    if(this.context && this.context !== null && this.songItem !== null){
      this.context.resourceManager.closeRawFd(this.songItem.src);
    }
    this.songItem = null;
  }


}






































































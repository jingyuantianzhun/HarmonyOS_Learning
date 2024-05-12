import mediaquery from '@ohos.mediaquery'
import ScreenModel from '../model/ScreenModel'

export default  class MediaQueryUtil{


  /**
   * 最小屏幕的条件监听句柄
   */
  private smListener:mediaquery.MediaQueryListener=mediaquery.matchMediaSync(ScreenModel.RANGE_SM)

  /**
   * 中等屏幕的条件监听句柄
   */
  private mdListener:mediaquery.MediaQueryListener=mediaquery.matchMediaSync(ScreenModel.RANGE_MD)

  /**
   * 最大屏幕的条件监听句柄
   */
  private mxListener:mediaquery.MediaQueryListener=mediaquery.matchMediaSync(ScreenModel.RANGE_LG)

  /**
   * 将当前屏幕的尺寸大小(sm、md、lg)保存到全局UI状态存储中
   */
  updateAppStore(screenSetting:string){
    AppStorage.SetOrCreate(ScreenModel.CURRENT_SCREEN_SETTING,screenSetting)
  }

  /**
   * 屏幕尺寸为sm时的回调函数
   * @param mediaQueryResult
   */
  smListenerCallback(mediaQueryResult:mediaquery.MediaQueryResult){
    if (mediaQueryResult.matches) {
      this.updateAppStore(ScreenModel.BREAKPOINT_SM)
    }
  }

  /**
   * 屏幕尺寸为md时的回调函数
   * @param mediaQueryResult
   */
  mdListenerCallback(mediaQueryResult:mediaquery.MediaQueryResult){
    if (mediaQueryResult.matches) {
      this.updateAppStore(ScreenModel.BREAKPOINT_MD)
    }
  }

  /**
   * 屏幕尺寸为lg时的回调函数
   * @param mediaQueryResult
   */
  lgListenerCallback(mediaQueryResult:mediaquery.MediaQueryResult){
    if (mediaQueryResult.matches) {
      this.updateAppStore(ScreenModel.BREAKPOINT_LG)

    }
  }

  /**
   * 将条件监听句柄和回调函数进行绑定
   */
  register(){
    this.smListener.on('change',this.smListenerCallback.bind(this))
    this.mdListener.on('change',this.mdListenerCallback.bind(this))
    this.mxListener.on('change',this.lgListenerCallback.bind(this))
  }

  unregister(){
    this.smListener.off('change',this.smListenerCallback.bind(this))
    this.mdListener.off('change',this.mdListenerCallback.bind(this))
    this.mxListener.off('change',this.lgListenerCallback.bind(this))
  }

}

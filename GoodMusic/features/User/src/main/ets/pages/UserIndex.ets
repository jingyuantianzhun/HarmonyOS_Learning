import users, { User } from '../bean/User'
import Header from '../components/headers/Header'
import IndexTabs from '../components/IndexTabs'
import IndexStatusPanel from '../components/panels/IndexStatusPanel'
import UserExtend from '../components/UserExtend'
import UserMessage from '../components/UserMessage'
import ScreenModel from '../model/ScreenModel'
import userStatusList, { UserStatus } from '../model/UserStatus'
import Logger from '../util/LogUtil'
import MediaQueryUtil from '../util/MediaQueryUtil'

@Entry
@Component
export  struct UserIndex {

  /**
   * 屏幕尺寸保存到全局UI存储中
   */
  @StorageLink('currentBreakpoint') screenSize:string=ScreenModel.BREAKPOINT_SM

  mediaQueryUtil:MediaQueryUtil =new MediaQueryUtil()

  @State user:User=users[0]

  aboutToAppear(){
    /**
     * 条件监听句柄和回调函数进行绑定
     */

    Logger.COMMON.log(this.screenSize)

    this.mediaQueryUtil.register()
  }

  aboutToDisappear(){
    /**
     * 条件监听句柄和回调函数进行解绑
     */
    this.mediaQueryUtil.unregister()
  }

  @State showPanel:boolean=false

  private controller:Scroller=new Scroller()


  //判断index的滚动是否到达底部，默认为false
  @Provide('ableScroll') ableScroll:boolean=false

  @State userStatus:Array<UserStatus>=userStatusList

  @State status:Array<string>=['1','2','3','4','5']
  // @Provide('ableScroll1') ableScroll1:boolean=false


  @State nu:number=0

  changeShowPanel(){
    this.showPanel=true
  }

  build() {
    Column(){
      Column(){
        //首页头部
        Header({changeShow:this.changeShowPanel.bind(this)})
        //首页头部以下
        Scroll(this.controller){
          Column({space:20}){
            //个人信息
            UserMessage({user:$user})
            //用户扩展：历史、本地
            UserExtend({screenSize:$screenSize})
            IndexTabs()
          }
          .width('100%')
        }
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.None)
        .onScrollEdge((side:Edge)=>{
          if (side === Edge.Bottom) {
            this.ableScroll=true
          }else{
            this.ableScroll=false
          }
        })
      }
      .layoutWeight(1)

      //更改用户状态面板
      IndexStatusPanel({showPanel:$showPanel,screenSize:$screenSize})


    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_red'))
    .onClick(()=>{
      this.showPanel=false
    })




  }
}
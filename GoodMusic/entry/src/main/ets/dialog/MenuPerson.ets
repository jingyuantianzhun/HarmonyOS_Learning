import common from '@ohos.app.ability.common'
import { Logger } from 'play/src/main/ets/utils/Logger'
import preferences from '@ohos.data.preferences'
import preferencesUtil from '../common/util/PreferencesUtils'
import Constants, { FS, SPACE } from '../constants/Constants'

//文字主题色
@Extend(Text) function modelTextStyle(textColor:string){
  .fontColor(textColor)
}

//图片主题色
@Extend(Image) function modelImageStyle(imageColor:string){
  .fillColor(imageColor)
}

@Extend(Column) function modelBackStyle1(styleBlackColor:string){
  .backgroundColor(styleBlackColor)
}
@Extend(Row) function modelBackStyle2(styleBlackColor:string){
  .backgroundColor(styleBlackColor)
}

@Component
export default struct MenuPerson{
  controller:CustomDialogController

  //主题默认是白天的颜色
  @State textColor:string='#000000'
  @State imageColor:string='#000000'
  @State big_container:string='#eeeeee'
  @State styleBlackColor:string='#FFFFFF'
/*  @State isOn:boolean=false*/

  async aboutToAppear(){
    this.textColor=await preferencesUtil.getPreferences('textColorPreference','textColor','#000000') as string
    this.imageColor=await preferencesUtil.getPreferences('imageColorPreference','imageColor','#000000')as string
    this.big_container=await preferencesUtil.getPreferences('big_containerPreference','big_container','#eeeeee')as string
    this.styleBlackColor=await preferencesUtil.getPreferences('styleBlackColorPreference','styleBlackColor','#FFFFFF')as string
/*    this.isOn=await preferencesUtil.getPreferences('isOnPreference','isOn',false)as boolean*/


  }

  @Styles sty(){
    .width('90%').borderRadius(SPACE.SPACE_5)
  }

  build(){
      Column(){
        //头像
        Row({space:SPACE.SPACE_5}){
          Image($r('app.media.acount')).width(Constants.SIZE_30).borderRadius(SPACE.SPACE_15)
          Text('挡我者已死').modelTextStyle(this.textColor)
          Image($r("app.media.right1")).width(Constants.SIZE_20).modelImageStyle(this.imageColor)
          Blank()
          Image($r("app.media.scan1")).width(Constants.SIZE_25).modelImageStyle(this.imageColor)
        }.width(Constants.FULL_WIDTH).padding(SPACE.SPACE_10)
        .modelBackStyle2(this.styleBlackColor)
        // 内容
        List(){
          ListItem(){
            Column({space:SPACE.SPACE_10}){
              //设置项
              Column(){
                //我的消息
                Row({space:SPACE.SPACE_5}){
                  Image($r("app.media.email1")).width(Constants.SIZE_30)
                    .modelImageStyle(this.imageColor)
                  Badge({
                    count: 10,
                    position: BadgePosition.Right,
                    style: { badgeSize: 16, badgeColor: '#FA2A2D' }
                  }){
                    Text('我的消息').width(200).modelTextStyle(this.textColor)
                  }
                  Image($r("app.media.right1")).width(Constants.SIZE_15).margin({left:SPACE.SPACE_10})
                }.width(Constants.FULL_WIDTH).height(Constants.SIZE_40)
                .padding({left:SPACE.SPACE_15,right:SPACE.SPACE_15})
                Divider()
                this.rowBuild({image:$r("app.media.cloud_manager1"),description:"限时兑换福利",text:"云贝中心"})
                Divider()
                this.rowBuild({image:$r("app.media.creator_center1"),text:"创作者中心"})
              }.sty().modelBackStyle1(this.styleBlackColor)
              .margin({top:SPACE.SPACE_10})
              //音乐服务
              Column(){
                Row(){
                  Text('音乐服务').fontSize(FS.FS_12).fontColor('#ffbeb8b8').margin({left:SPACE.SPACE_15})
                }.width(Constants.FULL_WIDTH).height(Constants.SIZE_30)
                Divider()
                this.rowBuild({image:$r("app.media.star2"),description:"点击查看今日运势",text:"趣测"})
                this.rowBuild({image:$r("app.media.ticket1"),text:"云村有票"})
                this.rowBuild({image:$r("app.media.shop1"),text:"商城"})
                this.rowBuild({image:$r("app.media.collect1"),description:"与音乐人共享收益",text:"音乐收藏家"})

              }.sty().modelBackStyle1(this.styleBlackColor)
              //其他
              Column(){
                Row(){
                  Text('其他').fontSize(FS.FS_12).fontColor('#ffbeb8b8').margin({left:SPACE.SPACE_15})
                }.width(Constants.FULL_WIDTH).height(Constants.SIZE_30)
                Divider()
                this.rowBuild({image:$r("app.media.setting1"),text:"设置"})
                //深色模式
                Row({space:SPACE.SPACE_5}){
                  Image($r("app.media.dark1")).width(Constants.SIZE_30).modelImageStyle(this.imageColor)
                    Text('深色模式').modelTextStyle(this.textColor)
                  Blank()
                  Toggle({ type: ToggleType.Switch, isOn: false })
                    .width(Constants.SIZE_40).height(Constants.SIZE_20)
                    .selectedColor('#FF0000')
                    .switchPointColor('#FFFFFF')
                    /*.onChange((isOn: boolean=this.isOn)=>{*/
                    .onChange((isOn: boolean)=>{
                      if(isOn) {
                        //夜晚模式
                        this.textColor='#FFFFFF'
                        this.imageColor='#FFFFFF'
                        this.big_container='#3C3F41'
                        this.styleBlackColor='#000000'

                        preferencesUtil.putPreferences('textColorPreference','textColor','#FFFFFF')
                        preferencesUtil.putPreferences('imageColorPreference','imageColor','#FFFFFF')
                        preferencesUtil.putPreferences('big_containerPreference','big_container','#3C3F41')
                        preferencesUtil.putPreferences('styleBlackColorPreference','styleBlackColor','#000000')
                        /*preferencesUtil.putPreferences('isOnPreference','isOn',true)*/


                      }else {
                        this.textColor='#000000'
                        this.imageColor='#000000'
                        this.big_container='#eeeeee'
                        this.styleBlackColor='#FFFFFF'

                        preferencesUtil.putPreferences('textColorPreference','textColor','#000000')
                        preferencesUtil.putPreferences('imageColorPreference','imageColor','#000000')
                        preferencesUtil.putPreferences('big_containerPreference','big_container','#eeeeee')
                        preferencesUtil.putPreferences('styleBlackColorPreference','styleBlackColor','#FFFFFF')
                        /*preferencesUtil.putPreferences('isOnPreference','isOn',false)*/
                      }
                    })

                }.width(Constants.FULL_WIDTH).height(Constants.SIZE_40)
                .padding({left:SPACE.SPACE_15,right:SPACE.SPACE_15})
                this.rowBuild({image:$r("app.media.set_time1"),text:"定时关闭"})
                this.rowBuild({image:$r("app.media.clothes1"),text:"个性装扮"})
                this.rowBuild({image:$r("app.media.listen1"),description:"未开启",text:"边听变存"})
                this.rowBuild({image:$r("app.media.forbid1"),text:"音乐黑名单"})
                this.rowBuild({image:$r("app.media.child_protect1"),description:"未开启",text:"青少年模式"})
                this.rowBuild({image:$r("app.media.clock1"),text:"音乐闹钟"})

              }.sty().modelBackStyle1(this.styleBlackColor)
              //订单
              Column(){
                this.rowBuild({image:$r("app.media.order1"),text:"我的订单"})
                this.rowBuild({image:$r("app.media.coupon1"),text:"优惠券"})
                this.rowBuild({image:$r("app.media.custom_service1"),text:"我的客服"})
                this.rowBuild({image:$r("app.media.share1"),text:"分享网易云音乐"})
                this.rowBuild({image:$r("app.media.personal_info1"),text:"个人信息收集与使用清单"})
                this.rowBuild({image:$r("app.media.protect1"),text:"个人信息与隐私保护"})
                this.rowBuild({image:$r("app.media.about1"),text:"关于"})
              }.sty().modelBackStyle1(this.styleBlackColor)
              //账号
              Column(){
                this.rowBuild({image:$r("app.media.switch1"),text:"切换账号"})
                Row({space:SPACE.SPACE_5}){
                  Image($r("app.media.exit1")).width(Constants.SIZE_30).modelImageStyle(this.imageColor)
                    Text('退出登录/关闭').modelTextStyle(this.textColor)
                      .onClick(()=>{
                        let context = getContext(this) as common.UIAbilityContext
                        context.terminateSelf(()=>{
                          Logger.info('tagTest','退出应用')
                        })
                      })
                }.width(Constants.FULL_WIDTH).height(Constants.SIZE_40)
                .padding({left:SPACE.SPACE_15,right:SPACE.SPACE_15})
              }.sty().height(150).modelBackStyle1(this.styleBlackColor)
            }.width(Constants.FULL_WIDTH)
          }
        }
      }.width('90%').height(Constants.FULL_HEIGHT)
    .backgroundColor(this.big_container).alignItems(HorizontalAlign.Center)
  }

  @Builder rowBuild($$:{image:Resource,description?:string,text:string}){
    Row({space:SPACE.SPACE_5}){
      Image($$.image).width(Constants.SIZE_30).modelImageStyle(this.imageColor)
      Text($$.text).modelTextStyle(this.textColor)
      Blank()
      Text($$.description).fontSize(FS.FS_12).fontColor('#ffbeb8b8')
      Image($r("app.media.right1")).width(Constants.SIZE_15)
    }.width(Constants.FULL_WIDTH).height(Constants.SIZE_40)
    .padding({left:SPACE.SPACE_15,right:SPACE.SPACE_15})
  }
}
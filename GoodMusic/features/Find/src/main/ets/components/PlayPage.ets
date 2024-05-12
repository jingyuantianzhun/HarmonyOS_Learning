import router from '@ohos.router'
import { songs } from '../constants';
import { songItemType } from '../models';
import AVPlayerClass from '../utils/AVPlayerClass';
@Entry
@Component
struct PlayPage {
  @State opacityNum: number = 1
  @State trackThickness:number=2
  @State angle:number=-55
  item: songItemType
  index: number

  // 时长数字(ms)转字符串
  number2time(number: number) {
    const seconds = Math.floor(number / 1000);
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    const timeString = minutes.toString().padStart(2, '0') + ':' + remainingSeconds.toString().padStart(2, '0');
    return timeString;

/*    const ms: number = number % 1000
    const second = (number - ms) / 1000
    const s: number = second % 60
    if (second > 60) {
      const m: number = (second - s) / 60 % 60
      return m.toString()
        .padStart(2, '0') + ':' + s.toString()
        .padStart(2, '0')
    }
    return '00:' + s.toString()
      .padStart(2, '0')*/
  }

  build() {
      Column() {
        //标题栏
        Row(){
          //返回按钮
          Image($r('app.media.title_1'))
            .width(20)
            .interpolation(ImageInterpolation.High)
            .onClick(()=>{
              router.back()
            })

          //状态模式切换
            Row(){
              Text('私人漫游 · 默认模式 ')
                .fontColor('#B0A3A3')
                .fontSize(16)
              Image($r('app.media.title_1'))
                .height(5)
                .interpolation(ImageInterpolation.High)
            }.onClick(()=>{
              //打开模式选择面板
            })

          //分享
          Image($r("app.media.title_2"))
            .width(20)
            .interpolation(ImageInterpolation.High)
        }
        .width('100%').height(60).padding({ left:10,right:10,top:5 })
        .justifyContent(FlexAlign.SpaceBetween).margin({ bottom:24 })


        //旋转播放
        Stack({ alignContent: Alignment.Top }){
          //旋转背景
          Row() {
            Row() {
              Image(songs[0].img)
                .width('70%')
                .borderRadius(400)
            }
            .backgroundImage($r('app.media.ic_cd'))
            .backgroundImageSize(ImageSize.Cover)
            .justifyContent(FlexAlign.Center)
            .width('100%')
            .borderRadius(400)
            .clip(true)
            .aspectRatio(1)
          }
          .margin({ top: 60 })
          .width('90%')
          .aspectRatio(1)
          .justifyContent(FlexAlign.Center)
          .padding(24)

          // 唱针
          Image($r('app.media.ic_stylus'))
            .width(200)
            .aspectRatio(1)
            .rotate({
              angle:this.angle,
              centerX: 100,
              centerY: 30
            })
            .animation({
            duration: 1200,
            curve: Curve.Friction,
            delay: 500,
            iterations: -1, // 设置-1表示动画无限循环
            playMode: PlayMode.Alternate
          })
        }.margin({ bottom:40 })

        //信息栏
        Row(){
          Column(){
            //歌名
            Row(){
              Text(songs[0].name)
                .fontColor('#BCAEAD')
                .fontWeight(FontWeight.Bold)
                .fontSize(18)
              Row(){
                Text('VIP')
                  .fontColor('#947081')
                  .fontSize(10)
              }.width(40).height(15).borderRadius(10)
              .backgroundColor('#502A3F')
              .justifyContent(FlexAlign.Center)

            }.justifyContent(FlexAlign.Start).width('100%').margin({bottom:5})
            //作者信息
            Row(){
              Text(songs[0].author)
                .fontColor('#827775')
                .fontSize(14)
              Row(){
                Text('关注+')
                  .fontColor('#947081')
                  .fontSize(10)
              }.width(30).height(15).borderRadius(10)
              .backgroundColor('#502A3F')
              .justifyContent(FlexAlign.Center)

            }.justifyContent(FlexAlign.Start).width('100%')

          }.width(120)

          Blank()
          //点赞喜欢
          Badge({
            value: songs[0].like,
            position: BadgePosition.RightTop,
            style: { badgeSize: 12,color:'#A57D90',badgeColor:Color.Transparent,fontSize:6}
          })
          {
            Image($r("app.media.like"))
              .width(24)
              .interpolation(ImageInterpolation.High)

          }.margin({right:60})

          //评论
          Badge({
            value: songs[0].comment,
            position: BadgePosition.RightTop,
            style: { badgeSize: 12,color:'#A57D90',badgeColor:Color.Transparent,fontSize:6}
          })
          {
            Image($r("app.media.comment"))
              .width(24)
              .interpolation(ImageInterpolation.High)
          }.margin({right:10})

        }.justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .padding({left:20,right:20})

        //播放进度条
        Row(){
          Slider({
            value: 0,
            min: 0,
            max: 0,
            style: SliderStyle.OutSet

          }).trackColor('#715967').blockColor('#FFFFFF').selectedColor('#9A8A95')
            .trackThickness(this.trackThickness).width('92%')


        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
        //进度条具体数字显示
        Row(){
          Text('00:00')
            .fontColor('#745062')
            .fontSize(14)
          Text('00:00')
            .fontColor('#745062')
            .fontSize(14)
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('90%').margin({ bottom:24 })

        //播放控制
        Row(){
          //五个控制按钮

          //播放模式切换
          Image($r('app.media.repeat_1'))
            .width(25)
            .interpolation(ImageInterpolation.High)
          //上一首
          Image($r('app.media.last_music'))
            .width(25)
            .fillColor('#4F4343')
            .interpolation(ImageInterpolation.High)
          //暂停
          Image($r('app.media.stop'))
            .width(35)
            .interpolation(ImageInterpolation.High)
            .onClick(() => {
              AVPlayerClass.singlePlay(this.item)
            })
          //下一首
          Image($r('app.media.next_music'))
            .width(25)
            .interpolation(ImageInterpolation.High)
          //待添加功能
          Image($r('app.media.DJMusic'))
            .width(25)
            .interpolation(ImageInterpolation.High)
        }.width('100%').margin({ bottom:30 })
        .justifyContent(FlexAlign.SpaceAround)

        //其他信息
        Row(){
          //播放设备选择 蓝牙 投屏
          Image($r('app.media.bottom_1'))
            .width(25)
            .interpolation(ImageInterpolation.High)
          //下载
          Image($r('app.media.bottom_2'))
            .width(25)
            .interpolation(ImageInterpolation.High)
          //歌曲更多信息
          Image($r('app.media.bottom_3'))
            .width(25)
            .interpolation(ImageInterpolation.High)
        }.width('100%').height(30).justifyContent(FlexAlign.SpaceEvenly)
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#4D1D35')
  }

  // 页面也换效果,避免滑动切换效果
/*  pageTransition() {
    PageTransitionEnter({ duration: 200 })
      .onEnter(() => {
        this.opacityNum = 1
      })
    PageTransitionExit({ duration: 200 })
      .onExit(() => {
        this.opacityNum = 0
      })
  }*/
}
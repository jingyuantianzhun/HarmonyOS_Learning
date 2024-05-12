import router from '@ohos.router'
import promptAction from '@ohos.promptAction';
import Constants from '../constants/Constants';
import { ControlConstants } from '../constants/ControlConstants';
import { Logger } from '../utils/Logger';
import { MediaService } from '../utils/MediaService';
import { MusicPlayMode } from '../viewmodel/MusicData';
import { PlayControlModel } from '../viewmodel/PlayControlModel';
import { SongItem } from '../viewmodel/SongData';


@Component
export struct PlayPage1 {
  // 获取播放的音乐列表
  @StorageLink('musicList') musicList: SongItem[] | undefined = []
  // 获取播放音乐在音乐列表中的index
  @StorageLink('selectIndex') selectIndex: number = 0;
  @ObjectLink playControl: PlayControlModel;
  @StorageLink('isPlay') isPlay: boolean = false;
  @StorageLink('currentTime') currentTime: string = '00:00';
  @StorageLink('totalTime') totalTime: string = '00:00';
  @StorageLink('progress') value: number = 0;
  @StorageLink('progressMax') max: number = 0;
  @State index: number = 1 //播放模式：默认顺序播放
  //播放模式
  @State playModeImage: Resource = $r('app.media.repeat_0')
  @State playImg: Resource = $r('app.media.pause')
    @State intervalPM:number = -1
  //旋转角度
  @State angle:number = 0
  @State anglePoint:number = -60
  //isFirst
  @StorageLink('isFirst') isFirst:boolean = false;


  aboutToAppear() {
    this.playControlClick('play');
    this.isPlay = true;
    setTimeout(()=>this.anglePoint=-40,1000)
    this.setPlayRotate()
  }



onPageHide(){
  // let currentSong:SongItem = this.musicList[this.selectIndex];
  // AppStorage.SetOrCreate('currentSong',currentSong);
  AppStorage.SetOrCreate('angle',this.angle);
}

  //播放事件
  playControlClick(key: string) {
    switch (key) {
      case ControlConstants.PLAY_MODE:
        this.changePlayMode();
        break;
      case ControlConstants.PREVIOUS:
        MediaService.getInstance().playPrevious();
        break;
      case ControlConstants.PLAY:
        if (MediaService.getInstance().getFirst() && this.isFirst) {
          MediaService.getInstance().loadAssent(0);
        } else {
          MediaService.getInstance().play();
          MediaService.getInstance().loadAssent(this.selectIndex);

        }
        this.playControl.key = ControlConstants.PAUSE;
        break;
      case ControlConstants.PAUSE:
        MediaService.getInstance().pause();
        this.playControl.key = ControlConstants.PLAY;
        break;
      case ControlConstants.NEXT:
        MediaService.getInstance().playNextAuto(true);
        break;
      case ControlConstants.PLAY_LIST:
        break;
      default:
        break;
    }
  }
  //播放模式
  private changePlayMode(): void {
    const mode = [MusicPlayMode.SINGLE_CYCLE, MusicPlayMode.ORDER, MusicPlayMode.RANDOM];
    const resource = [$r('app.media.ic_single_cycle'), $r('app.media.ic_list_cycle'), $r('app.media.ic_list_random')];
    this.index = MediaService.getInstance().getPlayMode() + 1;
    if (this.index > mode.length - 1) {
      this.index = 0;
    }
    Logger.info('change play mode setPlayModel index:' + this.index);
    // this.playControl.icon = resource[index];
    MediaService.getInstance().setPlayModel(mode[this.index]);
  }

  //播放功能
  setPlayRotate() {
    clearInterval(this.intervalPM);
    //播放功能
    this.isPlay ? this.intervalPM = setInterval(() => {
      console.log('testTag',"定时器开启2")
      this.angle += 20;
    }, 600) : clearInterval(this.intervalPM);
  }


build() {
    Column() {
      //标题栏
      Row() {
        //返回按钮
        Row(){
          Image($r('app.media.title_1'))
            .width(20)
            .interpolation(ImageInterpolation.High)
        }
        .width(40)
        .height(20)
          .onClick(() => {
            router.back()
          })

        //状态模式切换
        Row() {
          Text('私人漫游 · 默认模式 ')
            .fontColor('#B0A3A3')
            .fontSize(16)
          Image($r('app.media.title_1'))
            .height(5)
            .interpolation(ImageInterpolation.High)
        }.onClick(() => {
          //打开模式选择面板
        })

        //分享
        Image($r("app.media.title_2"))
          .width(20)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%')
      .height(60)
      .padding({ left: 10, right: 10, top: 5 })
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 24 })


      //旋转播放
      Stack({ alignContent: Alignment.Top }) {
        //旋转背景
        Row() {
          Row() {
            Image(this.musicList[this.selectIndex].image)
              .width('70%')
              .borderRadius(400)
              .rotate({
                //旋转轴
                x:0,
                y:0,
                z:1,
                //旋转中心
                centerX:'50%',
                centerY:'50%',
                angle: this.angle
              })
              .animation({
                duration: 2000,
                curve: Curve.EaseOut,
                iterations: 1,
                playMode: PlayMode.Normal
              })

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
            angle: this.anglePoint,
            centerX: '50%',
            centerY: '20%',
          })
          .animation({
            duration: 500,
            curve: Curve.EaseOut,
            iterations: 1,
            playMode: PlayMode.Normal
          })
      }.margin({ bottom: 40 })

      //信息栏
      Row() {
        Column() {
          //歌名
          Row() {
            Text(this.musicList[this.selectIndex].name)
              .fontColor('#BCAEAD')
              .fontWeight(FontWeight.Bold)
              .fontSize(18)
            Row() {
              Text(this.musicList[this.selectIndex].typeDescription)
                .fontColor('#947081')
                .fontSize(10)
            }
            .width(40)
            .height(15)
            .borderRadius(10)
            .backgroundColor('#502A3F')
            .justifyContent(FlexAlign.Center)

          }.justifyContent(FlexAlign.Start).width('100%').margin({ bottom: 5 })
          //作者信息
          Row() {
            Text(this.musicList[this.selectIndex].author)
              .fontColor('#827775')
              .fontSize(14)
            Row() {
              Text('关注+')
                .fontColor('#947081')
                .fontSize(10)
            }
            .width(30)
            .height(15)
            .borderRadius(10)
            .backgroundColor('#502A3F')
            .justifyContent(FlexAlign.Center)

          }.justifyContent(FlexAlign.Start).width('100%')

        }.layoutWeight(1)

        Blank()
        //点赞喜欢
        Badge({
          value: this.musicList[this.selectIndex].like.toString(),
          position: BadgePosition.RightTop,
          style: { badgeSize: 12, color: '#A57D90', badgeColor: Color.Transparent, fontSize: 6 }
        }) {
          Image($r("app.media.like"))
            .width(24)
            .interpolation(ImageInterpolation.High)

        }.margin({ right: 20 })

        //评论
        Badge({
          value: this.musicList[this.selectIndex].comment.toString(),
          position: BadgePosition.RightTop,
          style: { badgeSize: 12, color: '#A57D90', badgeColor: Color.Transparent, fontSize: 6 }
        }) {
          Image($r("app.media.comment"))
            .width(24)
            .interpolation(ImageInterpolation.High)
        }.margin({ right: 10 })

      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding({ left: 20, right: 20 })

      //播放进度条
      Row() {
        Slider({
          value: this.value,
          min: 0,
          step:1,
          max: this.max,
          style: SliderStyle.OutSet

        })
          .trackColor('#715967')
          .blockColor('#FFFFFF')
          .selectedColor('#9A8A95')
          .trackThickness(3)
          .width('92%')
          .onChange(value=>{
            MediaService.getInstance().seek(value)
            this.value = value
          })


      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      //进度条具体数字显示
      Row() {
        Text(this.currentTime)
          .fontColor('#745062')
          .fontSize(14)
        Text(this.totalTime)
          .fontColor('#745062')
          .fontSize(14)
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('90%').margin({ bottom: 24 })

      //播放控制
      Row() {
        //五个控制按钮

        //播放模式切换
        Image(this.playModeImage)
          .width(25)
          .interpolation(ImageInterpolation.High)
          .onClick(() => {
            this.playControlClick('playMode')
            if (this.index == 0) {
              this.playModeImage = $r('app.media.repeat_1')
              promptAction.showToast({
                message:"单曲循环",
                bottom:740
              })
            } else if (this.index == 1) {
              this.playModeImage = $r('app.media.repeat_0')
              promptAction.showToast({
                message:"顺序播放",
                bottom:740
              })
            } else {
              this.playModeImage = $r('app.media.repeat_2')
              promptAction.showToast({
                message:"随机播放",
                bottom:740
              })
            }

          })

        //上一首
        Image($r('app.media.up_one'))
          .width(35)
          .fillColor('#4F4343')
          .interpolation(ImageInterpolation.High)
          .onClick(() => {
            this.playControlClick("previous")
            this.playImg = $r('app.media.pause')
            this.anglePoint = -60
            setTimeout(()=>{
              this.anglePoint=-40;
              this.setPlayRotate()
            },600)

          })
        //暂停
        Image(this.playImg)
          .width(45)
          .interpolation(ImageInterpolation.High)
          .onClick(() => {
            this.isPlay = !this.isPlay
            this.isPlay ? this.playControlClick('play') : this.playControlClick('pause')
            this.isPlay ? this.playImg = $r('app.media.pause') : this.playImg = $r("app.media.ic_pplay")
            this.isPlay ? this.anglePoint=-40: this.anglePoint=-60
            this.setPlayRotate()

          })
        //下一首
        Image($r('app.media.down_one'))
          .width(35)
          .interpolation(ImageInterpolation.High)
          .onClick(() => {
            this.playControlClick("next")
            this.playImg = $r('app.media.pause')
            this.anglePoint = -60
            setTimeout(()=>{
              this.anglePoint=-40
              this.setPlayRotate()
            },600)

          })
        //待添加功能
        Image($r('app.media.DJMusic'))
          .width(25)
          .interpolation(ImageInterpolation.High)
      }.width('100%').margin({ bottom: 30 })
      .justifyContent(FlexAlign.SpaceAround)

      //其他信息
      Row() {
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
}
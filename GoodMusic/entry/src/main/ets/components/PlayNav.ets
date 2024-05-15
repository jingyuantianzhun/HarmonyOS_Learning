
import { MediaService } from 'play/src/main/ets/utils/MediaService'
import Constants, { SPACE } from '../constants/Constants'
import SongItem from '../viewmodel/SongItem'
import {PlayControlModel} from 'play'
import { ControlConstants } from 'play/src/main/ets/constants/ControlConstants'

@Component
export default struct PlayNav {

  //播放按钮图片
  @State img: Resource = $r('app.media.pause_fill')
  @StorageLink('isPlay')
  isPlay: boolean = false
  @StorageLink('currentSong')
  currentSong: SongItem | undefined = null
  @StorageLink('progress')
  value: number = 0;
  @StorageLink('progressMax')
  max: number = 0;
  //angle
  @StorageLink('angle')
  angle:number = 0
  @State intervalPM:number = -1
  @StorageLink('selectIndex')
  selectIndex: number = 0;
  @StorageLink('isFirst')
  isFirst:boolean = false;

  //播放功能
  setPlayRotate() {
    clearInterval(this.intervalPM);
    //播放功能
    this.isPlay ? this.intervalPM = setInterval(() => {
      console.log('testTag',"定时器开启2")
      this.angle += 20;
    }, 600) : clearInterval(this.intervalPM);
  }



  aboutToAppear(){

    this.isPlay?this.setPlayRotate():""
    this.isPlay?this.img = $r('app.media.pause_fill'):this.img = $r('app.media.play_fill1')
    if(!this.currentSong){
      this.currentSong = {
        id: 1,
        image: $rawfile('zhimibuwu.jpg'),
        name: '执迷不悟（伤感女声版）',
        typeDescription: '超清母带',
        author: 'Jessie熙熙',
        src: 'zhimibuwu.mp3',
        index: 0,
        like: 996,
        comment: 669
      }
    }
  }

  build() {
    //播放导航
    Row({ space: SPACE.SPACE_8 }) {
      //1.唱片
      Row() {
        Image(this.currentSong.image).width(40).height(40)
          .borderRadius(20)
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
      .width(60)
      .height(60)
      .borderRadius(30)
      .backgroundImage($r('app.media.ic_cd'))
      .backgroundImageSize(ImageSize.Cover)
      .justifyContent(FlexAlign.Center)
      //2.歌曲信息
      Row() {
        Text(`${this.currentSong.name} - ${this.currentSong.author}`).textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
      }
      .width(180)
      .alignItems(VerticalAlign.Center)

      Blank()
      //3.控制按钮
      Stack() {
        Progress({ value: this.value,total:this.max, type: ProgressType.Ring })
          .style({ strokeWidth: 3 })
          .width(35).color(Color.Black)
        Image(this.img).width(30)

      }

      .onClick(() => {
        this.setPlayRotate()
        //如果isPlay为true，播放音乐

        this.isPlay ? this.img = $r("app.media.pause_fill") : this.img = $r('app.media.play_fill1')
        this.isPlay = !this.isPlay
      })

      Image($r("app.media.playlist_1")).width(30)


    }.width(Constants.FULL_WIDTH)
    .padding({ left: 10, right: 10, bottom: 5 ,top:5})
  }
}
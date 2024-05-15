import router from '@ohos.router'
import PlayNav from '../components/PlayNav'
import RecommendDay from '../components/RecommendDay'
import Constants, { FS, SPACE } from '../constants/Constants'
import { songs1, songs2 } from '../model/Model'
import Song from '../viewmodel/SongItem'
@Entry
@Component
struct RecommendDayPage {
  @State song1:Song[] = songs1
  @State song2:Song[] = songs2
  @State switch:boolean = false

  setBackgroundColor(){
    if(!this.switch){
      return '#eeeeee'
    }else {
      return 'transition'
    }
  }

  setBackgroundColor1(){
    if(this.switch){
      return '#eeeeee'
    }else {
      return 'transition'
    }
  }

  setFontColor(){
    if(!this.switch){
      return Color.Black
    }else {
      return Color.White
    }
  }
  setFontColor1(){
    if(this.switch){
      return Color.Black
    }else {
      return Color.White
    }
  }

  build() {
    Column(){

      Row(){
        Image($r('app.media.back1')).width(Constants.SIZE_30)
          .onClick(()=>{
            router.back()
          })
        Row(){
          Row({space:SPACE.SPACE_5}){
            Button("默认推荐").fontSize(FS.FS_16).backgroundColor(this.setBackgroundColor()).fontColor(this.setFontColor())
              .height(Constants.SIZE_30)
              .onClick(()=>{
                   this.switch = false

              })
            Button("风格推荐").fontSize(FS.FS_16).backgroundColor(this.setBackgroundColor1()).fontColor(this.setFontColor1())
              .height(Constants.SIZE_30)
              .onClick(()=>{
                  this.switch = true


              })
          }.borderRadius(17)
          .backgroundColor('rgba(131,162,196,1)')

        }.layoutWeight(1).justifyContent(FlexAlign.Center)

        Image($r('app.media.menu1')).width(Constants.SIZE_30)
      }.width(Constants.FULL_WIDTH).height(Constants.SIZE_160)
      .alignItems(VerticalAlign.Top)
      .padding({top:Constants.SIZE_20})
      .backgroundImage($r('app.media.rec_day'))
      .backgroundImageSize(ImageSize.Cover)


      if(this.switch){
        RecommendDay({songs:$song2})

      }else{
        RecommendDay({ songs:$song1 })
      }

      PlayNav()
        .position({
          x:'0%',
          y:715
        })
        .backgroundColor(Color.White)

    }
  }
}
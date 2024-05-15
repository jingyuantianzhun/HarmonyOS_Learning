import {CommonHeader} from 'user'
import {ExtendPageHeader} from 'user'
import {MusicSwiper} from 'user'
import {MVSwiper} from 'user'
import {SingleSwiper} from 'user'
import {SoundSwiper} from 'user'
import  { titles,CommonTitle } from 'user'

@Entry
@Component
struct LocalPage {

  @State outerIndex:number=0
  @State innerIndex:number=0

  private swiperController:SwiperController=new SwiperController()


  @State outerTitles:Array<CommonTitle>=titles[0]

  @Builder outerTabBarBuilder(title:string,index:number){
    Text(title)
      .fontSize(this.outerIndex===index?20:18)
      .fontColor(this.outerIndex===index?Color.Black:$r('app.color.swiper_gray'))
      .padding({top:8})
  }

  build() {
    Column() {
      CommonHeader({titles:this.outerTitles,index:$outerIndex,controller:this.swiperController})

      Swiper(this.swiperController){

        SingleSwiper()
        SoundSwiper()
        MVSwiper()
        MusicSwiper()

      }
      .indicator(false)
      // .border({style:BorderStyle.Solid,width:1})


    }
    .height('100%')
    .width('100%')
  }
}
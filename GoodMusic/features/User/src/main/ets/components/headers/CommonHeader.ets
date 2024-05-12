import router from '@ohos.router'
import { CommonTitle } from '../../model/CommonTitle'


@Component
export struct CommonHeader{

  @Prop titles:Array<CommonTitle>

  controller:SwiperController

  @Link index:number


  build(){

    Row(){
      Image($rawfile('../../../resources/rawfile/back.svg'))
        .width(25)
        .interpolation(ImageInterpolation.High)
        .onClick(()=>{
          router.back()
        })
      ForEach(this.titles,(item:CommonTitle)=>{
        Text(item.title)
          .fontSize(item.index===this.index?21:20)
          .fontColor(item.index===this.index?Color.Black:$r('app.color.swiper_gray'))
          .padding(10)
          .onClick(()=>{
            if (this.index < item.index) {
              for (let i = 0; i <item.index-this.index; i++) {
                this.controller.showNext()
              }
              this.index=item.index
              return
            }
            if (this.index > item.index) {
              for (let i = 0; i <this.index-item.index; i++) {
                this.controller.showPrevious()
              }
              this.index=item.index
            }

          })
      })

      Image($rawfile('../../../resources/rawfile/soushou.svg'))
        .width(25)
        .interpolation(ImageInterpolation.High)
        .margin({right:10})
      Image($rawfile('../../../resources/rawfile/sandian.svg'))
        .height(20)
        .interpolation(ImageInterpolation.High)
        .fillColor(Color.Black)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(18)
    .width('100%')
  }
}
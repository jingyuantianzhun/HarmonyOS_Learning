
@Component
export struct MVSwiper{

  build(){


    Column(){
      Row(){
        Text('无结果')
          .fontColor($r('app.color.swiper_gray'))
          .margin(50)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding(100)
    }
    .height('100%')
    .alignItems(HorizontalAlign.Center)

  }
}
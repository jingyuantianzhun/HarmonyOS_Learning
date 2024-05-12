import router from '@ohos.router'


@Component
export struct BuyHeader{


  build(){

    Column(){
      Row(){
        Image($rawfile('../../../resources/rawfile/jiankuohao.svg'))
          .height(25)
          .interpolation(ImageInterpolation.High)
          .onClick(()=>{
            router.back()
          })

        Text('已购')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Text('订单')
          .fontSize(18)
          .borderRadius(100)
          .padding({left:15,right:15,top:5,bottom:5})
          .fontColor($r('app.color.swiper_gray'))
          .border({style:BorderStyle.Solid,width:1,color:$r('app.color.swiper_gray')})

      }
      .justifyContent(FlexAlign.SpaceBetween)

      .padding(15)
      .width('100%')

    }
    .width('100%')
  }
}
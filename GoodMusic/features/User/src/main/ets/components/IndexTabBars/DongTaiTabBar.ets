

@Entry
@Component
export default struct DongTaiTabBar{


  build(){

    Column({space:15}){

      Row(){

        Image($rawfile('../../../resources/rawfile/music_icon.svg'))
          .height(25)
          .fillColor($r('app.color.swiper_gray'))
        Text('分享你喜欢的音乐吧')
          .fontColor($r('app.color.swiper_gray'))
          .fontSize(20)

      }
      Row(){
        Text('去分享')
      }
      .borderRadius(15)
      .border({style:BorderStyle.Solid,width:1,color:$r('app.color.swiper_gray')})
      .padding({left:10,right:10,top:5,bottom:5})

    }
    .height('60%')

  }
}
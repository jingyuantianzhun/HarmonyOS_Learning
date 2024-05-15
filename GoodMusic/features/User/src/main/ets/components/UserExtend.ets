import router from '@ohos.router'
import ScreenModel from '../model/ScreenModel'
import Logger from '../util/LogUtil'
import MediaQueryUtil from '../util/MediaQueryUtil'

@Extend(Image) function image_Style(){
  .height(15)
  // .fillColor('#ffb6b6b6')
  .fillColor('#fffcfcfc')
  .opacity(0.8)
}

@Styles function common_Style(){
  .borderRadius(7)
  .backgroundColor('#ffb65a3d')
  .padding(9)
  .opacity(0.7)
}

// @Entry
@Component
export default struct UserExtend{


  @Link screenSize:string

  aboutToAppear(){
    Logger.COMMON.error(this.screenSize)
  }

  @Builder rowBuilder(image:Resource,text:string,url:string,screenSize:string){

    if (screenSize==='sm'){
      Row({space:4}){
        Image(image)
          .image_Style()
          .height(15)
        Text(text)
          .fontSize(14)
          .fontColor($r('app.color.color_shenGray'))

      }
      .onClick(()=>{
        router.pushUrl({
          url:url
        })
      })
      .common_Style()
      .padding({left:10,right:10,top:7,bottom:7})
    }else if (screenSize==='md'){
      Row({space:8}){
        Image(image)
          .image_Style()
          .height(20)
        Text(text)
          .fontSize(18)
          .fontColor($r('app.color.color_shenGray'))

      }
      .onClick(()=>{
        router.pushUrl({
          url:url
        })
      })
      .common_Style()
      .borderRadius(10)
      .padding({left:30,right:30,top:15,bottom:15})
    }else if (screenSize==='lg'){
      Row({space:8}){
        Image(image)
          .image_Style()
          .height(30)
        Text(text)
          .fontSize(28)
          .fontColor($r('app.color.color_shenGray'))
      }
      .onClick(()=>{
        router.pushUrl({
          url:url
        })
      })
      .common_Style()
      .borderRadius(10)
      .padding({left:30,right:30,top:15,bottom:15})
    }
  }


  build(){

    Row({space:5}){

      this.rowBuilder($rawfile('../../resources/rawfile/zuijin.svg'),'最近',"pages/RecentPage",this.screenSize)


      this.rowBuilder($rawfile('../../resources/rawfile/bendi.svg'),'本地',"pages/LocalPage",this.screenSize)



      this.rowBuilder($rawfile('../../resources/rawfile/yunpan.svg'),'云盘',"pages/ColudDisksPage",this.screenSize)



      this.rowBuilder($rawfile('../../resources/rawfile/yigou.svg'),'已购',"pages/BuyPage",this.screenSize)


      this.rowBuilder($rawfile('../../resources/rawfile/gengduo.svg'),'',"pages/RecentPage",this.screenSize)

    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({left:15,right:15})

    // Row({space:5}){
    //   Row({space:this.screenSize==='lg'?8:4}){
    //     Image($rawfile('zuijin.svg'))
    //       .image_Style()
    //       .height(this.screenSize==='lg'?30:15)
    //     Text('最近')
    //       .fontSize(this.screenSize==='lg'?28:14)
    //       .fontColor($r('app.color.color_shenGray'))
    //
    //   }
    //   .onClick(()=>{
    //     router.pushUrl({
    //       url:"pages/RecentPage"
    //     })
    //   })
    //   .common_Style()
    //   .padding(this.screenSize==='lg'?{left:30,right:30,top:15,bottom:15}:0)
    //
    //   Row({space:this.screenSize==='lg'?8:4}){
    //     Image($rawfile('bendi.svg'))
    //       .image_Style()
    //       .height(this.screenSize==='lg'?30:15)
    //     Text('本地')
    //       .fontSize(14)
    //       .fontSize(this.screenSize==='lg'?28:14)
    //       .fontColor($r('app.color.color_shenGray'))
    //
    //   }
    //   .onClick(()=>{
    //     router.pushUrl({
    //       url:"pages/LocalPage"
    //     })
    //   })
    //   .common_Style()
    //   .padding(this.screenSize==='lg'?{left:30,right:30,top:15,bottom:15}:0)
    //
    //   Row({space:this.screenSize==='lg'?8:4}){
    //     Image($rawfile('yunpan.svg'))
    //       .image_Style()
    //       .height(this.screenSize==='lg'?30:15)
    //     Text('云盘')
    //       .fontSize(14)
    //       .fontSize(this.screenSize==='lg'?28:14)
    //       .fontColor($r('app.color.color_shenGray'))
    //
    //   }
    //   .onClick(()=>{
    //     router.pushUrl({
    //       url:"pages/ColudDisksPage"
    //     })
    //   })
    //   .common_Style()
    //   .padding(this.screenSize==='lg'?{left:30,right:30,top:15,bottom:15}:0)
    //
    //   Row({space:this.screenSize==='lg'?8:4}){
    //     Image($rawfile('yigou.svg'))
    //       .image_Style()
    //       .height(this.screenSize==='lg'?30:15)
    //     Text('已购')
    //       .fontSize(14)
    //       .fontSize(this.screenSize==='lg'?28:14)
    //       .fontColor($r('app.color.color_shenGray'))
    //
    //   }
    //   .onClick(()=>{
    //     router.pushUrl({
    //       url:"pages/BuyPage"
    //     })
    //   })
    //   .common_Style()
    //   .padding(this.screenSize==='lg'?{left:30,right:30,top:15,bottom:15}:0)
    //
    //   Row({space:this.screenSize==='lg'?8:4}){
    //     Image($rawfile('gengduo.svg'))
    //       .image_Style()
    //       .height(this.screenSize==='lg'?30:15)
    //
    //   }
    //   .onClick(()=>{
    //     router.pushUrl({
    //       url:"pages/RecentPage"
    //     })
    //   })
    //   .common_Style()
    //   .padding(this.screenSize==='lg'?{left:30,right:30,top:15,bottom:15}:0)
    // }
    // .width('100%')
    // .justifyContent(FlexAlign.SpaceBetween)
    // .padding({left:15,right:15})
  }
}


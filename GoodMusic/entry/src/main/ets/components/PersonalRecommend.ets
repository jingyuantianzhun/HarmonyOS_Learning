
import router from '@ohos.router'
import Constants, { FS, FW, SPACE } from '../constants/Constants'
import { recommends } from '../model/Model'
import RecommendSing from '../viewmodel/RecommendSing'

@Component
export default struct PersonalRecommend{

  day:number = new Date().getDate()

  recommends:RecommendSing[]= recommends


  build() {
    Column(){
      Row(){
        Text('个性化推荐').fontSize(FS.FS_20).fontWeight(FW.FW_600)
      }.width(Constants.FULL_WIDTH).justifyContent(FlexAlign.Start)
      .padding({bottom:SPACE.SPACE_10})
      //推荐歌单
      List({space:SPACE.SPACE_8}){
        //1.每日推荐
        ListItem(){
          this.recommend_day()
        }

        ForEach(this.recommends,(item:RecommendSing)=>{
          ListItem(){
            this.recommend({text:item.text,image:item.image,description:item.description})
          }
        })
      }.width(Constants.FULL_WIDTH)
      .listDirection(Axis.Horizontal)
    }
  }

  //每日推荐
  @Builder recommend_day(){
    Column(){
      Column({space:SPACE.SPACE_10}){
        Text('每日推荐').fontSize(FS.FS_20).fontColor(Color.White)
          .margin({top:SPACE.SPACE_8,left:SPACE.SPACE_8})
          .fontWeight(FW.FW_600)
        Row(){
          Stack(){
            Image($r('app.media.calendar')).width(Constants.SIZE_80)
            Text(this.day.toFixed(0)).fontWeight(FW.FW_800).fontSize(FS.FS_24).fontColor(Color.White)
              .margin({top:SPACE.SPACE_15})
          }
        }.width(Constants.FULL_WIDTH).justifyContent(FlexAlign.Center)
        Row(){
          Text('免费听').fontSize(FS.FS_12).fontColor(Color.White)
          Blank()
          Image($r('app.media.play_icon')).width(Constants.SIZE_20)
        }.width(Constants.FULL_WIDTH).padding(SPACE.SPACE_10)
      }.layoutWeight(1).alignItems(HorizontalAlign.Start).borderRadius(SPACE.SPACE_5)
      .width(Constants.FULL_WIDTH)
      .backgroundImage($r('app.media.recommend_day'),ImageRepeat.NoRepeat)
      .backgroundImageSize(ImageSize.Cover)

      Row(){
        Text('符合你口味的新鲜好歌').fontSize(FS.FS_14)
          .fontColor(Color.White)
      }.height(Constants.SIZE_50)
    }.height(Constants.SIZE_230).width(Constants.SIZE_160)
    .backgroundColor('#ff716f6f')
    .borderRadius(Constants.SIZE_5)
    .onClick(()=>{
      router.pushUrl({
        url:"pages/RecommendDayPage"
      })
    })
  }

  //推荐
  @Builder recommend($$:{text:string,image:Resource,description:string}){
    Column(){
      Column({space:SPACE.SPACE_10}){
        Text($$.text).fontSize(FS.FS_20).fontColor(Color.White)
          .margin({top:SPACE.SPACE_8,left:SPACE.SPACE_8})
          .fontWeight(FW.FW_600)

        Row(){
          Image($r('app.media.play_icon')).width(Constants.SIZE_20)
        }.width(Constants.FULL_WIDTH).padding(SPACE.SPACE_10).justifyContent(FlexAlign.End)
        .margin({top:Constants.SIZE_90})
      }.layoutWeight(1).alignItems(HorizontalAlign.Start).borderRadius(SPACE.SPACE_5)
      .width(Constants.FULL_WIDTH)
      .backgroundImage($$.image,ImageRepeat.NoRepeat)
      .backgroundImageSize(ImageSize.Cover)

      Row(){
        Text($$.description).fontSize(FS.FS_14)
          .fontColor(Color.White)
      }.height(Constants.SIZE_50)
    }.height(Constants.SIZE_230).width(Constants.SIZE_160)
    .backgroundColor('#ff716f6f')
    .borderRadius(Constants.SIZE_5)
  }

}
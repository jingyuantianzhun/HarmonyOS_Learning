import Constants, { FS, FW, SPACE } from '../constants/Constants'
import { recommendSings } from '../model/Model'
import RecommendSing from '../viewmodel/RecommendSing'

@Component
export default struct RecommendSings{
  //推荐歌单
 recommendSings:RecommendSing[]=recommendSings

  build(){
    Column(){
      //标题
      Text('推荐歌单').fontSize(FS.FS_20).fontWeight(FW.FW_600).margin({bottom:SPACE.SPACE_10})
      List(){
        ListItem(){
          Column(){
            Row({space:SPACE.SPACE_5}){
              //推荐歌单build
              ForEach(this.recommendSings,(item:RecommendSing)=>{
                this.recommendBuild({text:item.text,image:item.image,description:item.description})
              })
            }
          }.alignItems(HorizontalAlign.Start)
        }
      }.listDirection(Axis.Horizontal).width(Constants.FULL_WIDTH)
    }.width(Constants.FULL_WIDTH).alignItems(HorizontalAlign.Start)
  }

  @Builder recommendBuild($$:{text:string,image:Resource,description:string}){
    Column() {
      //头部
      Column(){
        Row() {
          Image($r('app.media.music')).width(15).margin({right:SPACE.SPACE_5})
          Text($$.text).fontSize(FS.FS_12).fontColor(Color.White)
          Text('万').fontSize(FS.FS_12).fontColor(Color.White)
        }.width(Constants.FULL_WIDTH).margin(SPACE.SPACE_8)

          Row() {
            Image($r('app.media.play_icon')).width(Constants.SIZE_20).margin({right:SPACE.SPACE_8})
          }.width(Constants.FULL_WIDTH).justifyContent(FlexAlign.End)
        .margin({top:Constants.SIZE_80})

      }.layoutWeight(1).width(Constants.FULL_WIDTH)
      .backgroundImage($$.image)
      .backgroundImageSize(ImageSize.Cover)
      .borderRadius(Constants.SIZE_5)
      .alignItems(HorizontalAlign.Start)
      //文本
      Text($$.description).height(Constants.SIZE_30)
        .margin({left:SPACE.SPACE_8}).fontSize(FS.FS_14)
        .maxLines(2).textOverflow({overflow:TextOverflow.Ellipsis})

    }.width(Constants.SIZE_150).height(Constants.SIZE_200).alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
  }

}
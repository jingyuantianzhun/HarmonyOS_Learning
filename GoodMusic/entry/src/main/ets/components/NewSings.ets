import Constants, { FS, FW, SPACE } from '../constants/Constants'
import { newSings } from '../model/Model'
import RecommendSing from '../viewmodel/RecommendSing'


@Component
export default struct NewSing {

  //新碟推荐
  xds:RecommendSing[] =newSings

  build() {
    Column({space:SPACE.SPACE_5}) {
      Text('新碟上架').fontSize(FS.FS_20).fontWeight(FW.FW_600)
      List({space:SPACE.SPACE_5}) {
        ForEach(this.xds, (item:RecommendSing) => {
          ListItem() {
            this.NewSingsBuild({text:item.text,image:item.image,author:item.description})
          }
        })
      }.listDirection(Axis.Horizontal)
    }.width('100%').alignItems(HorizontalAlign.Start)
  }

  @Builder NewSingsBuild($$:{text:string,image:Resource,author:string}){
    Column({space:SPACE.SPACE_5}){
      Image($$.image).layoutWeight(1).width(Constants.FULL_WIDTH)
        .borderRadius(SPACE.SPACE_5)
      Text($$.text).fontSize(FS.FS_13).fontColor(Color.Black).fontWeight(FW.FW_600)
        .maxLines(1).textOverflow({overflow:TextOverflow.Ellipsis})
      Text($$.author).fontSize(FS.FS_13).fontColor('#ffa19ea1')
        .maxLines(1).textOverflow({overflow:TextOverflow.Ellipsis})
    }.width(Constants.SIZE_100).height(Constants.SIZE_150)
    .alignItems(HorizontalAlign.Start)


  }
}
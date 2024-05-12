import Constants, { FS, FW, SPACE } from '../constants/Constants'
import { ranks } from '../model/Model'
import RecommendSing from '../viewmodel/RecommendSing'


@Component
export default struct Rank {

  //排行榜
  ranks: RecommendSing[] = ranks

  build() {
    Column({space:SPACE.SPACE_5}){
      Text('排行榜').fontSize(FS.FS_20).fontWeight(FW.FW_600)
      List({ space: SPACE.SPACE_8 }) {
        ForEach(this.ranks, (item: RecommendSing) => {
          ListItem() {
            this.rankBuild({ image: item.image, text: item.description })
          }
        })
      }.listDirection(Axis.Horizontal).width(Constants.FULL_WIDTH)
    }.width(Constants.FULL_WIDTH).alignItems(HorizontalAlign.Start)
  }

  @Builder rankBuild($$: {
    image: Resource,
    text: string
  }) {
    Column({ space: SPACE.SPACE_5 }) {
      Column() {
        Row() {
          Image($r('app.media.play_icon')).width(Constants.SIZE_20)
        }
      }
      .width(Constants.SIZE_100)
      .height(Constants.SIZE_100)
      .backgroundImage($$.image)
      .backgroundImageSize(ImageSize.Cover)
      .justifyContent(FlexAlign.End)
      .alignItems(HorizontalAlign.End)
      .padding(SPACE.SPACE_8)
      .borderRadius(Constants.SIZE_5)

      Text($$.text).fontSize(FS.FS_12)
        .maxLines(2).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width(Constants.SIZE_100)
  }
}
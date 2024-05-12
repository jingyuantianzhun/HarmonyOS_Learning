
import Constants, { FS, FW, SPACE } from '../constants/Constants'
import { mines } from '../model/Model'
import RecommendSing from '../viewmodel/RecommendSing'

@Component
export default struct MySings{

  //我的歌单
  mines: RecommendSing[] = mines

  build() {
    Column({space:SPACE.SPACE_5}){
      Text(`挡我者已死的歌单`).fontSize(FS.FS_20).fontWeight(FW.FW_600)
      List({ space: SPACE.SPACE_8 }) {
        ForEach(this.mines, (item: RecommendSing) => {
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
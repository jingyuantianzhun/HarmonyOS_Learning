import router from '@ohos.router'
import Constants, { FS, FW, SPACE } from '../constants/Constants'
import Song from '../viewmodel/SongItem'

@Component
export default struct RecommendDay {

  //歌曲列表
  @Link songs: Song[]

  @Styles imgStyle(){
    .width(Constants.SIZE_20)
  }

  build() {
    Column() {
      //1.播放设置
      Row({ space: SPACE.SPACE_8 }) {
        Image($r('app.media.play_fill')).imgStyle()
          .onClick(()=>{
            AppStorage.SetOrCreate('isFirst',true)
            router.pushUrl({
              url:"pages/PlayComponent",
              params:{
                musicList:this.songs as Song[]
              }
            })
          })
        Text('播放全部').fontWeight(FW.FW_600)
        Blank()
        Image($r('app.media.list_curve')).imgStyle()
        Image($r('app.media.list_select')).imgStyle()
      }.width(Constants.FULL_WIDTH)
      //2.歌曲列表
      List({ space: Constants.SIZE_15 }) {
        ForEach(this.songs, (item: Song) => {
          ListItem() {
            this.listSong({
              image: item.image,
              name: item.name,
              typeDesc: item.typeDescription,
              author: item.author
            })

          }
          .onClick(()=>{
            AppStorage.SetOrCreate('selectIndex',item.index)
            router.pushUrl({
              url:"pages/PlayComponent",
              params:{
                musicList:this.songs as Song[],
              }
            })
          })
        })
      }.margin({ top: Constants.SIZE_15 })
      .edgeEffect(EdgeEffect.Fade)
    }
    .width(Constants.FULL_WIDTH)
    .height(Constants.FULL_HEIGHT)
    .padding(Constants.SIZE_15)
    .layoutWeight(1)
    .margin({ bottom: SPACE.SPACE_10 })
  }
  //歌曲列表项
  @Builder
  listSong($$: {
    image: Resource,
    name: string,
    typeDesc: string,
    author: string
  }) {
    Row({ space: SPACE.SPACE_8 }) {
      Image($$.image).width(Constants.SIZE_40).borderRadius(Constants.SIZE_5)
      Column() {
        Text($$.name).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
        Row() {
          Row() {
            Text($$.typeDesc).fontSize(10).fontColor(Color.Red)
          }
          .border({
            width: 1,
            color: Color.Red,
            radius: 3
          })
          .padding({ left: Constants.SIZE_2, right: Constants.SIZE_2 })
          .alignItems(VerticalAlign.Top)

          Text($$.author)
            .fontSize(FS.FS_12)
            .margin({ left: SPACE.SPACE_5 })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Blank()
      Image($r('app.media.select_list')).width(Constants.SIZE_20)
    }.width(Constants.FULL_WIDTH)
    .justifyContent(FlexAlign.Start)
  }
}
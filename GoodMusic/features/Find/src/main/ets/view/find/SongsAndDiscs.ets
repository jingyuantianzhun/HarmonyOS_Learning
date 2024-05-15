
@Component
export default struct SongsAndDiscs {
  @State title:string='新歌新碟'
  @State Songs:Resource[][]=[[$r('app.media.SongA'),$r('app.media.SongB'),
    $r('app.media.SongC')],[$r('app.media.SongD'),$r('app.media.SongE'),$r('app.media.SongF')]]
  @State SongsName:string[]=['你的承诺还算不算','风吹又起','淘汰郎','追风赶月的人',
    '同行的我们','Radical Optimism']
  @State Singer:string[]=['宋雨琦','송지효','Stray Kids','窦唯','NCT DREAM','韩红']
  @State introduceSongs:string[]=['这是一首非常好听的音乐，给人带来温暖。','好听！爱听！喜欢听！','好的音乐使人放松',
  '听歌要交税，不听歌也要交税','欢迎来到网易云音乐！','我这一辈子就败在这首音乐里！']
  @State SingTips:string[]=['SQ','Hi-Res','SQ']

  build() {
    Column() {
      Row() {
        Text(this.title)
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .margin(10)
        Image($r('app.media.DropRight'))
          .width(15)
          .height(15)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      Row(){
        List(){
          ForEach(this.Songs,(itemFirst:Resource[],indexF)=>{
            ListItem(){
              List({space:10}){
                ForEach(itemFirst, (itemSecond, indexS) => {
                  ListItem(){
                    Row() {
                      Image(itemSecond)
                        .width(70)
                        .borderRadius(10)
                        .margin({right:10})
                      Column() {
                        Text(this.SongsName[indexF * 3+indexS])
                          .fontWeight(FontWeight.Medium)
                          .width(130)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })
                          .maxLines(1)
                          .letterSpacing(1)
                          .lineHeight(18)
                          .fontSize(16)
                          .margin({ top: 5 })
                        Row() {
                          if(indexF==0){
                            Text(this.SingTips[indexS])
                              .fontColor(Color.Red)
                              .borderStyle(BorderStyle.Solid)
                              .borderWidth(1)
                              .borderColor(Color.Red)
                              .borderRadius(5)
                              .fontSize(10)
                              .padding(3)
                              .margin(5)
                          }
                          Text(this.introduceSongs[indexF * 3+indexS])
                            .width(110)
                            .textOverflow({ overflow: TextOverflow.Ellipsis })
                            .maxLines(1)
                            .letterSpacing(1)
                            .lineHeight(18)
                            .fontSize(13)
                            .margin({ top: 5 })
                          Text('-'+this.Singer[indexF * 3+indexS])
                            .width(110)
                            .textOverflow({ overflow: TextOverflow.Ellipsis })
                            .maxLines(1)
                            .letterSpacing(1)
                            .lineHeight(18)
                            .fontSize(13)
                            .margin({ top: 5,left:20 })
                        }
                      }
                      .alignItems(HorizontalAlign.Start)
                    }
                  }
                })
              }
              .padding({left:10})
              .width(340)
              .listDirection(Axis.Vertical)
            }
          })
        }
        .listDirection(Axis.Horizontal)
        .margin({left:10,right:10})
      }
    }
  }
}
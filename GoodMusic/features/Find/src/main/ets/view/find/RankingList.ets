
@Component
export default struct RankingList {
  @State title:string='排行榜'
  @State Songs:Resource[][]=[[$r('app.media.SongA'),$r('app.media.SongB'),
    $r('app.media.SongC')],[$r('app.media.SongD'),$r('app.media.SongE'),$r('app.media.SongF')]]
  @State SongsName:string[]=['你的承诺还算不算','风吹又起','淘汰郎','追风赶月的人',
    '同行的我们','Radical Optimism']
  @State Singer:string[]=['宋雨琦','송지효','Stray Kids','窦唯','NCT DREAM','韩红']
  @State Tips:string[]=['宝藏','精选','品质','397%','309%','228%']
  @State RankName:string[]=['热歌榜','飙升榜']
  @State RankContent:string[]=['用户都在听','潜力爆款预定']
  RankColor:ResourceColor[]=[Color.Brown,Color.Gray,Color.Orange]

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
        List({space:10}){
          ForEach(this.Songs,(itemFirst:Resource[],indexF)=>{
            ListItem(){
              Column() {
                Row(){
                  Text(this.RankName[indexF])
                    .fontSize(20)
                    .fontWeight(FontWeight.Medium)
                    .margin(10)
                  Image($r('app.media.DropRight'))
                    .width(15)
                    .height(15)
                    .margin({right:110})
                  Text(this.RankContent[indexF])
                    .fontSize(14)
                    .fontColor(Color.Gray)
                    .textAlign(TextAlign.End)
                }
                // .width('100%')

                List({ space: 10 }) {
                  ForEach(itemFirst, (itemSecond, indexS) => {
                    ListItem() {
                      Row() {
                        Image(itemSecond)
                          .width(70)
                          .borderRadius(10)
                          .margin({ right: 10 })
                        Text((indexS+1).toString())
                          .fontSize(20)
                          .fontWeight(FontWeight.Medium)
                          .fontColor(this.RankColor[indexS])
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
                          Text(this.Singer[indexF * 3+indexS])
                            .width(110)
                            .textOverflow({ overflow: TextOverflow.Ellipsis })
                            .maxLines(1)
                            .letterSpacing(1)
                            .lineHeight(18)
                            .fontSize(13)
                            .fontColor(Color.Gray)
                            .margin({ top: 5})
                        }
                        .margin({left:10})
                        .alignItems(HorizontalAlign.Start)

                        Row(){
                          if(indexF>0){
                            Image($r('app.media.TriangleUp'))
                              .width(10)
                              .fillColor(Color.Red)
                          }
                          Text(this.Tips[indexF * 3+indexS])
                            .fontSize(14)
                            .fontColor(Color.Red)
                            .fontWeight(FontWeight.Medium)
                            .margin({left:4})
                        }
                      }
                    }
                  })
                }
                .padding({ left: 10 })
                .width(300)
                .listDirection(Axis.Vertical)
              }
              .padding(10)
              .alignItems(HorizontalAlign.Start)
              .borderRadius(20)
              .backgroundColor(Color.Pink)
            }
          })
        }
        .listDirection(Axis.Horizontal)
        .margin({left:10,right:10})
      }
    }
  }
}
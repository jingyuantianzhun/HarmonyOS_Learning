

@Component
export default struct DigitalAlbums {
  @State title:string='数字专辑'
  @State Albums:Resource[]=[$r('app.media.AlbumsA'),$r('app.media.AlbumsB'),
    $r('app.media.AlbumsC'),$r('app.media.AlbumsD'),$r('app.media.AlbumsE'),$r('app.media.AlbumsF')]
  @State AlbumsName:string[]=['Could It Be','Popcorn','樂-STAR','琴赋',
  'DREAM()SCAPE','沉默的光影']
  @State Singer:string[]=['宋雨琦','송지효','Stray Kids','窦唯','NCT DREAM','韩红']
  @State Price:number[]=[4,3,24,100,18,28]

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
          ForEach(this.Albums,(item:Resource,index)=>{
            ListItem(){
              Column() {
                Image(item)
                  .width(110)
                  .height(110)
                  .borderRadius(10)
                Text(this.AlbumsName[index])
                  .fontWeight(FontWeight.Medium)
                  .width(110)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
                  .letterSpacing(1)
                  .lineHeight(18)
                  .fontSize(16)
                  .margin({ top: 5 })
                Text(this.Singer[index])
                  .fontColor(Color.Grey)
                  .width(110)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
                  .letterSpacing(1)
                  .lineHeight(18)
                  .fontSize(14)
                  .margin({top:5})
                Text('￥'+this.Price[index])
                  .fontColor(Color.Red)
                  .width(110)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
                  .letterSpacing(1)
                  .lineHeight(18)
                  .fontSize(14)
                  .margin({top:5})
              }
            }
          })
        }
        .listDirection(Axis.Horizontal)
        .margin({left:10,right:10})
      }
    }
  }
}
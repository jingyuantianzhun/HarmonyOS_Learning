
@Component
export default struct YunCun {

  @State title:string='云村出品'
  @State recommendYC:Resource[]=[$r('app.media.CarouselA'),$r('app.media.CarouselB'),$r('app.media.CarouselC'),
    $r('app.media.CarouselE'),$r('app.media.CarouselF'),$r('app.media.CarouselG')]
  @State contentYC:string[]=['JYP咖啡店 云村营业中','相约 [乘风2024 ] 姐姐酷飒十足','在歌里，回到风居住的街道',
  '金曲浪潮席卷 [天赐的声音]','复工后，我的精神状态belike ↓','不站在自己的角度上作解释']
  bgColor:ResourceColor[]=[Color.Grey,Color.Black,Color.Blue,Color.Grey,Color.Brown,Color.Blue]

  build() {
    Column(){
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

      List({space:10}){
        ForEach(this.recommendYC,(item,index)=>{
          ListItem(){
            Stack() {
              Image(item)
                .width(260)
                .borderRadius(10)
              //   .overlay("Winter!!!", {
              //   align: Alignment.Bottom,
              //   offset: { x: 0, y: -15 },
              // })

              Row()
                .position({x:0,y:70})
                .width(260)
                .borderRadius({bottomLeft:10,bottomRight:10})
                .height(30)
                .backgroundColor(this.bgColor[index])
              Text(this.contentYC[index])
                .position({x:10,y:75})
                .zIndex(1)
                .width(200)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(1)
                .letterSpacing(1)
                .lineHeight(18)
                .fontSize(13)
                .fontColor(Color.White)
                .margin({ top: 5})
            }
          }
        })
      }
      .listDirection(Axis.Horizontal)
    }
    .margin(10)
  }
}
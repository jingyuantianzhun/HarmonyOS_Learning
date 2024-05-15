@Entry
@Component
struct FindHeader {
  private HeaderCard:string[]=[' ','音乐','播客','派对','直播','听书','      ']
  @State currentIndex: number = 1
  @Builder TabBuilder(name: string, index: number) {
    Column() {
      Text(name)
        .fontSize(18)
        .fontColor(this.selectColor(index))
        .borderRadius(20)
        .padding({left:10,right:10,top:5,bottom:5})
        .fontWeight(FontWeight.Bold)
        .fontWeight(FontWeight.Bold)
      if(this.selectLine(index)) {
        Image($r('app.media.underline'))
          .width(20)
          .fillColor(Color.Red)
          .position({x:20,y:25})
      }
    }
    .margin({left:15})
  }

  selectColor(index: number) {
    return this.currentIndex === index ?  Color.Black:Color.Gray
  }

  selectLine(index:number){
    return this.currentIndex === index ?  true:false
  }

  build() {
    Row({space:10}){
      Stack() {
        //1.导航图标
        Image($r("app.media.navigation"))
          .zIndex(100)
          .width(50)
          .height(50)
          .position({x:0,y:3})
          .padding(10)
          .fillColor(Color.Black)
          .backgroundColor(Color.White)

        Tabs({ barPosition: BarPosition.Start }) {
          ForEach(this.HeaderCard, (item, index) => {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor(Color.Pink)
            }.tabBar(this.TabBuilder(item, index))
          })
        }
        .barMode(BarMode.Scrollable)
        .onChange(index => this.currentIndex = index)

        Image($r('app.media.searchfor'))
          .zIndex(100)
          .width(50)
          .height(50)
          .position({x:300,y:1})
          .padding(10)
          .fillColor(Color.Black)
          .backgroundColor(Color.White)
      }
      // .alignContent(Alignment.TopStart)
    }
    .width('100%')
    .margin(10)
  }
}
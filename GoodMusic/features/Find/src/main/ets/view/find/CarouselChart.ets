

class MyDataSource implements IDataSource {
  private list: Resource[] = []
  private listener: DataChangeListener

  constructor(list: Resource[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): any {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}

@Component
export default struct CarouselChart {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([$r('app.media.CarouselA'),$r('app.media.CarouselB'),$r('app.media.CarouselC'),
    $r('app.media.CarouselE'),$r('app.media.CarouselF'),$r('app.media.CarouselG'),])

  ChartTip:string[]=['新歌首发','独家策划','数字单曲','新碟首发','天籁之音','全网独家']

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item:Resource,index) => {
          Stack(){
            Image(item)
              .width('90%')
              .height(160)
              .borderRadius(10)
            Text(this.ChartTip[index])
              .fontSize(10)
              .borderRadius(5)
              .zIndex(2)
              .width(50)
              .position({x:260,y:130})
              .backgroundColor(Color.White)
              .padding(4)
              .fontColor(Color.Brown)
              .fontWeight(FontWeight.Bold)
          }
        }, item => item)
      }
      .indicatorStyle({left:10,top:400})
      .cachedCount(2)
      .index(1)
      .autoPlay(true)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(10)
      .curve(Curve.Linear)
      .onChange((index: number) => {
        console.info('testInfo','当前轮播图序号为:'+index.toString())
      })
    }
    .width('100%')
    .margin({ top: 10 })
  }
}
import CreateSwiper from '../swipers/CreateSwiper'
import RecentSwiper from '../swipers/RecentSwiper'


// @Entry
@Component
export default struct MusicTabBar{

  private controller:SwiperController=new SwiperController()

  @State index:number=0


  //判断index的滚动是否到达底部，默认为false
  @Consume('ableScroll') ableScroll:boolean

  //判断Music的滚动是否到达顶部部，默认为false
  // @Consume('ableScroll1') ableScroll1:boolean



  build(){


    Scroll(){
      Column(){

        //tabBar标签：近期、创建
        Row(){

          Row({space:30}){
            //近期tabBar
            Text('近期')
              .fontSize(this.index===0?16:15)
              .fontColor(this.index===0?Color.Black:$r('app.color.swiper_gray'))
              .fontWeight(this.index===0?FontWeight.Bold:FontWeight.Normal)
              .onClick(()=>{
                if (this.index === 1) {
                  this.controller.showPrevious()
                }
                // this.index=0
              })

            //创建tabBar
            Badge({count:1,position:BadgePosition.RightTop,style:{
              badgeColor:Color.Transparent,
              color:this.index===1?Color.Black:$r('app.color.swiper_gray')
            }}){
              Text('创建')
                .fontSize(this.index===1?16:15)
                .padding({right:12})
                .fontColor(this.index===1?Color.Black:$r('app.color.swiper_gray'))
                .fontWeight(this.index===1?FontWeight.Bold:FontWeight.Normal)
                .onClick(()=>{
                  // this.index=1
                  if (this.index === 0) {
                    this.controller.showNext()
                  }
                })
            }
          }
          .justifyContent(FlexAlign.Start)
          .padding(10)

          Image($rawfile('../../../resources/rawfile/sandian.svg'))
            .height(15)
            .fillColor(Color.Gray)



        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('94%')


        //近期和创建的内容
        Swiper(this.controller){
          RecentSwiper()
          CreateSwiper()
        }
        .index(this.index)
        .indicator(false)
        .width('92%')
        .onChange((index)=>{
          this.index=index
        })

      }
      .width('100%')
    }
    .scrollBar(BarState.Off)
    .scrollable(this.ableScroll?ScrollDirection.Vertical:ScrollDirection.None)

  }
}
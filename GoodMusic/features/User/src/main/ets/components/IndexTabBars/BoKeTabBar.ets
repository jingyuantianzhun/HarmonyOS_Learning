import AllSwiper from '../swipers/AllSwiper'
import BoKeSwiper from '../swipers/BoKeSwiper'
import CreateSwiper from '../swipers/CreateSwiper'
import ListenerBookSwiper from '../swipers/ListenerBookSwiper'
import RecentSwiper from '../swipers/RecentSwiper'


// @Entry
@Component
export default struct BoKeTabBar{

  private controller:SwiperController=new SwiperController()

  @State index:number=0


  //判断index的滚动是否到达底部，默认为false
  @Consume('ableScroll') ableScroll:boolean

  //判断Music的滚动是否到达顶部部，默认为false
  // @Consume('ableScroll1') ableScroll1:boolean



  build(){


    Scroll(){
      Column(){

        //tabBar标签：全部、播客、有声书
        Row(){

          Row({space:30}){
            //全部tabBar
            Badge({count:1,position:BadgePosition.RightTop,style:{
              badgeColor:Color.Transparent,
              color:this.index===0?Color.Black:$r('app.color.swiper_gray')
            }}){
              Text('全部')
                .fontSize(this.index===0?16:15)
                .fontColor(this.index===0?Color.Black:$r('app.color.swiper_gray'))
                .padding({right:12})
                .fontWeight(this.index===0?FontWeight.Bold:FontWeight.Normal)
                .onClick(()=>{
                  if (this.index !== 0) {
                    this.index=0
                  }
                })
            }

            //播客tabBar
            Badge({count:1,position:BadgePosition.RightTop,style:{
              badgeColor:Color.Transparent,
              color:this.index===1?Color.Black:$r('app.color.swiper_gray')
            }}){
              Text('播客')
                .fontSize(this.index===1?16:15)
                .fontColor(this.index===1?Color.Black:$r('app.color.swiper_gray'))
                .padding({right:12})
                .fontWeight(this.index===1?FontWeight.Bold:FontWeight.Normal)
                .onClick(()=>{
                  if (this.index !== 1) {
                    this.index=1
                  }
                })
            }



            //有声书tabBar
            Badge({count:1,position:BadgePosition.RightTop,style:{
              badgeColor:Color.Transparent,
              color:this.index===2?Color.Black:$r('app.color.swiper_gray')
            }}){
              Text('有声书')
                .fontSize(this.index===2?16:15)
                .fontColor(this.index===2?Color.Black:$r('app.color.swiper_gray'))
                .padding({right:12})
                .fontWeight(this.index===2?FontWeight.Bold:FontWeight.Normal)
                .onClick(()=>{
                  if (this.index !== 2) {
                    this.index=2
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




        // 近期和创建的内容
        Swiper(this.controller){
          AllSwiper()
          BoKeSwiper()
          ListenerBookSwiper()
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
   // .border({style:BorderStyle.Solid,width:1})
  }
}
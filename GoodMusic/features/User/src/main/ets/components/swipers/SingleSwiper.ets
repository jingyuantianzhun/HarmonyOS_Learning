import  { titles,CommonTitle } from '../../model/CommonTitle'


@Component
export struct SingleSwiper{


  @State titles:Array<CommonTitle>=titles[1]

  @State index:number=0


  @Builder tabBarBuilder(title:string,index:number){
    Text(title)
      .fontSize(index===this.index?18:20)
      .fontColor(this.index===index?Color.White: '#ff626262')
      .backgroundColor(this.index===index?'#fff53f3f':Color.Transparent)
      .padding({left:15,right:15,top:5,bottom:5})
      .borderRadius(15)
      .onClick(()=>{
        this.index=index
      })
  }

  build(){

    Tabs(){

      ForEach(this.titles,(item:CommonTitle)=>{
        TabContent(){
          Column({space:10}){
            Image($rawfile('../../../resources/rawfile/xiangzi.jpg'))
              .height(150)
            Text('暂无本地音乐')
              .fontColor($r('app.color.swiper_gray'))
            Text('一键扫描')
              .width(150)
              .padding(10)
              .border({style:BorderStyle.Solid,width:1,color:$r('app.color.swiper_gray')})
              .borderRadius(100)
              .textAlign(TextAlign.Center)
          }
          .height('80%')
        }
        .tabBar(this.tabBarBuilder(item.title,item.index))
      })
    }

  }
}
import {BuyHeader} from 'user'

@Entry
@Component
struct BuyPage {

  @State index:number=0

  @Builder tabBarBuilder(title:string,index:number){
    Text(title)
      .fontSize(this.index===index?20:18)
      .fontColor(this.index===index?Color.Black:$r('app.color.color_shenGray'))
      .decoration({type:this.index===index?TextDecorationType.Underline:TextDecorationType.None,color:Color.Red})
  }

  build() {
    Column() {

      BuyHeader()


      Tabs(){

        TabContent(){

        }
        // .tabBar(this.tabBarBuilder())
      }


    }
    .width('100%')
    .height('100%')
  }
}
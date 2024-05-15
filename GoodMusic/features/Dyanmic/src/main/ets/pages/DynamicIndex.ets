import router from '@ohos.router'
import AttentionList from '../attention/AttentionList'

import SquareList from '../square/SquareList'
import SongItem from '../viewmodel/SongItem'
import SharePanel from './SharePanel'



@Component
 export struct DynamicIndex {
  @State currentIndex:number = 0
  @State showPanel:boolean = false


  showPane(){
    this.showPanel = true
  }
@Builder HeadPandel(){
  Row(){
    Text('分享')
      .fontColor('#D3D3D3')
      .width('100%')
      .margin(20)
      .fontSize(20)
      .layoutWeight(1)
    Text('取消')
      .fontColor('#D3D3D3')
      .fontSize(20)
      .onClick(()=>this.showPanel = false)

  }

}
  @Builder TabBarBuilder1(title:string,image:ResourceStr,index:number){
    Row(){

      Text(title)
        .fontSize(20)
        .margin({left:100})
        .fontColor(this.SelectColor(index))

    }
  }
  @Builder TabBarBuilder2(title:string,image:ResourceStr,index:number){
    Row(){
      Text(title)
        .fontSize(20)
        .fontColor(this.SelectColor(index))
        .margin({right:100})
      Image(image)
        .onClick(()=>{

          router.pushUrl({
            url:"pages/AppPanelIndex",

          },router.RouterMode.Single)
            .then(()=> console.info('success'))
            .catch(()=>console.info('fail'))

        })
        .width(25)
        .height(25)

    }
  }
SelectColor(index:number){
return this.currentIndex===index?Color.Black:Color.Gray
}

  build() {
        Row({space:10}){
          if(this.showPanel){
            Panel(true){
              this.HeadPandel()
              SharePanel()
            }
          }
          Tabs(){
            TabContent(){
              AttentionList({showPanel:this.showPane.bind(this)})

            }
            .tabBar(this.TabBarBuilder1('关注',$r('app.media.other_choose'),0))
            TabContent(){
              SquareList({showPanel:this.showPane.bind(this)})
            }
            .tabBar(this.TabBarBuilder2('广场',$r('app.media.add'),1))


          }
          .width('100%')
          .height('100%')
          .onChange(index=>{this.currentIndex = index})
        }
        .height('100%')

  }
}
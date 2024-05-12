import userStatusList, { UserStatus } from '../../model/UserStatus'


// @Entry
@Component
export default struct IndexStatusPanel{


  @Link screenSize:string

  @Link showPanel:boolean

  @State userStatus:Array<UserStatus>=userStatusList

  @Builder gridBuilder(screenSize:string){
    if (screenSize==='sm'){
      Grid(){
        ForEach(this.userStatus,(item:UserStatus)=>{
          GridItem(){
            Row(){
              Image(item.image)
                // .width(25)
                .height(25)
                .margin({right:12})
              Text(item.statusName)
                .fontSize(18)
            }
            .padding({left:15,right:15,top:10,bottom:10})
            .borderRadius(20)
            .width(150)
            .backgroundColor(Color.White)
          }
        })

      }
      .columnsGap(10)
      .rowsGap(10)
      .columnsTemplate('1fr 1fr')
    }else if (screenSize==='md'){
      Grid(){
        ForEach(this.userStatus,(item:UserStatus)=>{
          GridItem(){
            Row(){
              Image(item.image)
                // .width(25)
                .height(25)
                .margin({right:12})
              Text(item.statusName)
                .fontSize(18)
            }
            .padding({left:15,right:15,top:10,bottom:10})
            .borderRadius(20)
            .width(170)
            .backgroundColor(Color.White)
          }
        })

      }
      .columnsGap(10)
      .rowsGap(15)
      .columnsTemplate('1fr 1fr 1fr')
    }else if (screenSize==='lg'){
      Grid(){
        ForEach(this.userStatus,(item:UserStatus)=>{
          GridItem(){
            Row(){
              Image(item.image)
                // .width(30)
                .height(30)
                .margin({right:15})
              Text(item.statusName)
                .fontSize(25)
            }
            .padding({left:20,right:15,top:15,bottom:15})
            .borderRadius(20)
            .width(200)
            .backgroundColor(Color.White)
          }
        })

      }
      .columnsGap(10)
      .rowsGap(20)
      .columnsTemplate('1fr 1fr 1fr 1fr')
      // .border({style:BorderStyle.Solid,width:1})
    }
  }

  build(){

    Panel(this.showPanel){
      Column(){
        Row(){
          Text('选择状态')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
          Blank()
          Text('完成')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(()=>{
              this.showPanel=false
            })
        }
        .margin({bottom:10})
        .width('92%')
        this.gridBuilder(this.screenSize)
      }
      .padding(10)
    }
    .mode(PanelMode.Full)
    .dragBar(true)
    .fullHeight(500)
    .backgroundColor('#fff3f3f3')


  }
}
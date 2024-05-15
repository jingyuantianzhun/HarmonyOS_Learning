import router from '@ohos.router'


@Component
// @Entry
export struct ExtendPageHeader{


  @Prop titles:Array<string>=['最近播放']

  build(){

    Column(){
      Row({space:15}){
        Image($rawfile('../../../resources/rawfile/back.svg'))
          .height(25)
          .interpolation(ImageInterpolation.High)
          .onClick(()=>{
            router.back()
          })
        List({space:15}){
          ForEach(this.titles,item=>{
            ListItem(){
              Text(item)
                .fontSize(22)
            }
          })
        }
        .listDirection(Axis.Horizontal)
        .height(28)
        .alignListItem(ListItemAlign.Center)
        // .border({style:BorderStyle.Solid,width:1})
      }
      .padding(15)
      .width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    // .border({style:BorderStyle.Solid,width:1})

  }
}
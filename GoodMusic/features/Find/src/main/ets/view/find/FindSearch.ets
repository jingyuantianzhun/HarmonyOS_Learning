
// 创建新实例
let storageF = new LocalStorage({ 'ToolTip': 'Slow Down' });

@Entry(storageF)
@Component
struct FindSearch {

  //FindSearch-1
  @LocalStorageLink('ToolTip') storageLink: string = 'Slow Down';
  private PromptContent:string[]=['Slow Down','Catch My Breath','离别开出花','5:20AM']
  intervalFS:number

  //FindSearch-2
  private SelectCard:string[]=['精选','排行榜','VIP','经典','国风','民谣','全球','DJ','助眠','摇滚','   ']
  @State currentIndex: number = 0
  @Builder TabBuilder(name: string, index: number) {
    Row() {
      Text(name)
        .backgroundColor(this.selectColor(index))
        .borderRadius(20)
        .padding({left:10,right:10,top:5,bottom:5})
    }
    .margin({left:15})
  }

  selectColor(index: number) {
    return this.currentIndex === index ?  '#E8E8E8':Color.White
  }

  aboutToDisappear(){
    clearInterval(this.intervalFS);
  }

  build() {
    Column({space:10}) {
      //发现模块-搜索栏
      Row({ space: 20 }) {
        //1.导航图标
        Image($r("app.media.navigation"))
          .width(20)

        //2.搜索框
        Row({ space: 10 }) {
          Image($r('app.media.searchfor'))
            .width(20)

            TextInput({ placeholder: this.storageLink })
              .width(165)
              .backgroundColor('#E8E8E8')
              .style(TextInputStyle.Default)
              .onAppear(() => {
                console.log('textTag', '开启:发现栏-搜索框-定时器');
                this.intervalFS = setInterval(function (PromptContent) {
                  //在定时器里this.ToolTip根本不存在
                  // 查询当前提示文本下标
                  let toolTip = storageF.link('ToolTip')
                  for (var i = 0; i < PromptContent.length; i++) {
                    if (PromptContent[i] ==toolTip.get()) {
                      console.log('testTag', '原先提示文本为:' + toolTip.get())
                      break
                    }
                  }
                 toolTip.set(PromptContent[((i + 1) % PromptContent.length)])
                 console.log('testTag', '当前提示文本为:' + toolTip.get())
                }, 4000, this.PromptContent);
              })
          Image($r('app.media.scan'))
            .width(20)
        }
        .width(245)
        .padding({ left: 10, right: 10 })
        .backgroundColor('#E8E8E8')
        .borderRadius(20)

        //3.麦克风
        Image($r('app.media.microphone'))
          .width(20)

      }
      .margin({left:20,right:20,top:20})

      Stack(){
        Tabs({ barPosition: BarPosition.Start}) {
          ForEach(this.SelectCard,(item,index)=>{
            TabContent() {
              Column().width('100%').height('100%').backgroundColor(Color.Pink)
            }.tabBar(this.TabBuilder(item,index))
          })
        }
        .barMode(BarMode.Scrollable)
        .onChange(index => this.currentIndex = index)

        Image($r("app.media.dropdownp"))
          .width(40)
          .height(40)
          .position({x:320,y:8})
          .padding(10)
          .backgroundColor(Color.White)
      }
    }
  }
}



export class CommonTitle{

  title:string
  index:number

  constructor(title: string, index: number) {
    this.title=title
    this.index=index

  }
}

//通用标题
const titles:Array<CommonTitle>[]=[
  [
    new CommonTitle('单曲',0),
    new CommonTitle('声音',1),
    new CommonTitle('MV',2),
    new CommonTitle('乐谱',3),
  ],
  [
    new CommonTitle('单曲',0),
    new CommonTitle('歌手',1),
    new CommonTitle('专辑',2),
    new CommonTitle('文件夹',3),
  ]
]




export  {titles}


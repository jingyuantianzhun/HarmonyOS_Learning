
import { SongItem } from './SongData'

// const MusicList:SongItem[] = [
//   {id:1,title:'WILD',singer:'小碗你好',src:'WILD.mp3',index:0},
//   {id:2,title:'起风了',singer:'小碗你好',src:'qifenle.mp3',index:1},
//   {id:3,title:'Temple',singer:'小碗你好',src:'Template.mp3',index:2}
// ]

const MusicList:SongItem[] = [
  {id:11 ,image:$rawfile('m1.jpg') ,name:'ロクデナシ',typeDescription: '超清母带',author: 'にんじん/ninzin',src:'m1.mp3' ,index: 10,like:36,comment:78},
  {id: 12,image:$rawfile('m2.jpg') ,name: 'ありがとう (カバー)',typeDescription: '超清母带',author: '磐田みゆき',src:'m2.mp3' ,index: 11,like:36,comment:78},
  {id: 13,image: $rawfile('m3.jpg'),name:'勾指起誓' ,typeDescription:'超清母带' ,author: '泠鸢yousa',src:'m3.mp3' ,index:12,like:36,comment:78 }
]

export {MusicList}
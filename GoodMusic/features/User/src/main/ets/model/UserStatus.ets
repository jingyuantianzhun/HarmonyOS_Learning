




export class UserStatus{


  image:Resource
  statusName:ResourceStr

  constructor(image: Resource, statusName: ResourceStr) {
    this.image=image
    this.statusName=statusName
  }
}

const userStatusList:Array<UserStatus>=[
  new UserStatus($rawfile('../../resources/rawfile/jiayou.svg'),'加油'),
  new UserStatus($rawfile('../../resources/rawfile/emo.svg'),'emo'),
  new UserStatus($rawfile('../../resources/rawfile/meigui.svg'),'等待春天'),
  new UserStatus($rawfile('../../resources/rawfile/kaixin.svg'),'超开心'),
  new UserStatus($rawfile('../../resources/rawfile/lianaizhong.svg'),'恋爱中'),
  new UserStatus($rawfile('../../resources/rawfile/xianglianai.svg'),'想恋爱'),
  new UserStatus($rawfile('../../resources/rawfile/qiutuige.svg'),'求推歌'),
  new UserStatus($rawfile('../../resources/rawfile/xuyuan.svg'),'许个愿'),
  new UserStatus($rawfile('../../resources/rawfile/zhunbeikaoshi.svg'),'准备考试'),
  new UserStatus($rawfile('../../resources/rawfile/dengdai.svg'),'等待中'),
  new UserStatus($rawfile('../../resources/rawfile/toutu.svg'),'头秃'),
  new UserStatus($rawfile('../../resources/rawfile/shimian.svg'),'失眠'),
  new UserStatus($rawfile('../../resources/rawfile/aixuexi.svg'),'爱学习'),
  new UserStatus($rawfile('../../resources/rawfile/shuijiaozhong.svg'),'睡觉中'),
  new UserStatus($rawfile('../../resources/rawfile/hufenbiguan.png'),'互粉必关'),
]
export default userStatusList as Array<UserStatus>
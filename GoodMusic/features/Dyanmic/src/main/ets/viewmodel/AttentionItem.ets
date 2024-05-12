import Song from './Song'

export default class AttentionItem{
  /**
   * id
   */
  id:number
  /**
   * 网名
   */
  name:string
  /**A
   * 头像
   */
  headImage:ResourceStr
  /**
   * 评论
   */
  comment:string

  commentImg:Resource

  song:Song
  time:string
  constructor(id:number,name:string,headImage:Resource,comment:string,commentImg:Resource = null,song:Song,time:string) {
    this.id = id
    this.name = name
    this.headImage = headImage
    this.comment = comment
    this.commentImg = commentImg
    this.song = song
    this.time = time
  }
}
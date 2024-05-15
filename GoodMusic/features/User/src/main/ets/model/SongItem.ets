@Observed
export default class SongItem{
  /**
   * 歌曲id
   */
  id:number

  /**
   * 歌曲路径
   */
  image:Resource

  /**
   * 歌曲名称
   */
  name:string

  /**
   * 歌曲类型描述
   */
  typeDescription:string

  /**
   * 歌曲作者
   */
  author:string

  /**
   * 歌曲音频路径
   */
  src:string

  /**
   * 歌曲歌曲下标
   */
  index:number

  /**
   * 歌曲id
   */
  like:number

  /**
   * 歌曲id
   */
  comment:number

  constructor(id: number, image: Resource, typeDescription: string, author: string, src: string, index: number, like: number, comment: number) {
    this.id=id
    this.image=image
    this.typeDescription=typeDescription
    this.author=author
    this.src=src
    this.index=index
    this.like=like
    this.comment=comment
  }



}



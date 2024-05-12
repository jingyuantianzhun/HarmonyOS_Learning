
export default class Song{
  id:number
  image:Resource
  name:string
  typeDescription:string
  author:string
  src:string
  index:number

  constructor(id:number,image:Resource,name:string,typeDescription:string,author:string,src:string='juhao.mp3',index:number=0) {
    this.id = id
    this.image = image
    this.name = name
    this.typeDescription = typeDescription
    this.author = author
    this.src = src
    this.index = index
  }
}


/**
 * 打印项目日志工具类
 */
class LogUtil{

  private prefix:string;
  private suffix:string;

  constructor(suffix:string,prefix: string='GoodMusic') {
    this.prefix=prefix
    this.suffix=suffix
  }

  info(...args:string[]):void{
    console.info(this.prefix,args,this.suffix)
  }

  log(...args:string[]):void{
    console.log(this.prefix,args,this.suffix)
  }

  debug(...args:string[]):void{
    console.debug(this.prefix,args,this.suffix)
  }

  error(...args:string[]):void{
    console.error(this.prefix,args,this.suffix)
  }

}

export default class Logger{
  static readonly READ:LogUtil=new LogUtil('Read')
  static readonly BOOKS:LogUtil=new LogUtil('Books')
  static readonly LISTENER:LogUtil=new LogUtil('Listener')
  static readonly USER:LogUtil=new LogUtil('User')
  static readonly COMMON:LogUtil=new LogUtil('Common')
}



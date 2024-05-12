/**
 * 地区
 */
export class Region{

  /**
   * 省份，已经在Province中封装了很多省份
   */
  province:string

  /**
   * 城市，已经在City中封装了很多城市
   */
  city:string

  constructor(province:string,city:string) {
    this.province=province
    this.city=city
  }
}
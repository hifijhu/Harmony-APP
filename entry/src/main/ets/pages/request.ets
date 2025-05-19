import http from '@ohos.net.http';


export default async function getHttpData(): Promise<string[]> {
  let dataList: string[] = []

  let httpRequest = http.createHttp();
  let response = httpRequest.request(
    // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
    "https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=5&mkt=zh-CN",
    {
      method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
      // 开发者根据自身业务需要添加header字段
      header: {
        'Content-Type': 'application/json'
      },
      expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
    }
  );
  // 使用await和async，等待请求完成处理数据后返回

  await response.then((data) => {
    console.log(data.responseCode.toString())
    if (data.responseCode === 200) {
      // 处理返回结果
      console.info("0")
      const response = data.result + "";
      console.info("1")
      const res : object = JSON.parse(response)

      const images : object[] = res["images"]
      console.info("3")
      for (let item of images) {
        let url : string = item['url']
        dataList.push(url)
      }
    } else {
      // todo 请求失败，进行失败逻辑处理
    }
  }).catch((err: Error) => {
    // todo 请求失败，进行失败逻辑处理
    console.info('error:' + JSON.stringify(err));
  })
  return dataList;
}
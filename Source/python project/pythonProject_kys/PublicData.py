import requests
import xmltodict
import json
import time

now = time.localtime()

def getPublicData(beginDate=str(now.tm_year)+'0801', endDate=str(now.tm_year)+'1231', numOfRows='10'):
    pageNo = '1'
    requestUrl = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=' + beginDate + '&endde=' + endDate + '&pageNo=' + pageNo + '&numOfRows=' + numOfRows + '&ServiceKey='
    serviceKey = 'Cs8el%2FuhtlYCY%2BHBBp9jCapmuo%2FmEjVkn0P%2BU6BY78tnS%2BTrPlz7BUEk%2BDfKOvvioI9hcaSuAJT%2FpgGsqAQG9A%3D%3D'
    result = requests.get(requestUrl+serviceKey)
    dataFromXml = xmltodict.parse(result.content)
    itemList = list(dataFromXml['response']['body']['items']['item'])
    print(itemList)
    print(type(itemList))
    print(len(itemList))

    print(type(itemList))
    jsonObject = json.dumps(itemList)
    print('json 변환 ...', type(jsonObject))
    return jsonObject
getPublicData()
# if(sys.argv[1]=='1'):
#     getPublicData()
# else:
#     getPublicData(sys.argv[2], sys.argv[3], sys.argv[4])


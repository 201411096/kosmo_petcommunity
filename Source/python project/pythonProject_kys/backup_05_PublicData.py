# 좌표로 변환
# 0808 좌표 변환 테스트
# 좌표 변환 성공한 개수 : 1000 -> 559
import requests
import xmltodict
import json
import time
import sys

now = time.localtime()

def getPublicData(beginDate=str(now.tm_year)+'0801', endDate=str(now.tm_year)+'1231', numOfRows='1000'):
    pageNo = '1'
    requestUrl = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=' + beginDate + '&endde=' + endDate + '&pageNo=' + pageNo + '&numOfRows=' + numOfRows + '&ServiceKey='
    serviceKey = 'Cs8el%2FuhtlYCY%2BHBBp9jCapmuo%2FmEjVkn0P%2BU6BY78tnS%2BTrPlz7BUEk%2BDfKOvvioI9hcaSuAJT%2FpgGsqAQG9A%3D%3D'
    result = requests.get(requestUrl+serviceKey)
    dataFromXml = xmltodict.parse(result.content)
    itemList = list(dataFromXml['response']['body']['items']['item'])
    # print(itemList)
    for item in itemList:
        item['y'], item['x'] = getLatLng(item['happenPlace'])
    with open('publicData.json', 'w', encoding="utf-8") as make_file:
        json.dump(itemList, make_file, ensure_ascii=False, indent=4)
    cnt = 0;
    for item in itemList:
        if(item['y']!=0):
            cnt=cnt+1
    print('주소 변환 개수 확인 ... ', cnt)

def getLatLng(addr):
    url = 'https://dapi.kakao.com/v2/local/search/address.json?query='+addr
    headers = {"Authorization": "KakaoAK ec8f6fd46ab832e10395eecfabaa2c5a"}
    result = json.loads(str(requests.get(url, headers=headers).text))
    if(len(result['documents'])>=1):
        if(result['documents'][0]['address']==None): # 주소 좌표 변환이 잘 이루어지지 않은 경우에 ...
            return 0, 0
        match_first = result['documents'][0]['address']
        print('result 확인 ...', result['documents'][0])
        return float(match_first['y']), float(match_first['x'])
    else: # 주소 좌표 변환이 잘 이루어지지 않은 경우에 ...
        return 0, 0
getPublicData()




# if(sys.argv[1]=='1'):
#     getPublicData()
# else:
#     getPublicData(sys.argv[2], sys.argv[3], sys.argv[4])


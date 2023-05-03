# 와이파이 정보 수집 서비스
<br/>
<div align="center">

![Screenshot 2023-05-03 at 6 19 35 PM](https://user-images.githubusercontent.com/82052272/235878225-9412525a-9ff2-43bb-9a3e-cf66d5bdddd1.png)

</div>
<br/>

## Introduction
와이파이 정보 검색 서비스는 사용자의 위치를 기반으로 주변 와이파이 정보를 수집하고, 가장 가까운 거리에 있는 20개의 와이파이 정보를 사용자에게 제공합니다. 와이파이 정보는 서울시에서 제공하는 공공와이파이 서비스 위치 정보를 기반으로 검색하게 됩니다.

와이파이 정보 검색 서비스는 크게 4가지의 기능을 제공합니다.

1. 위치 기반 와이파이 정보 검색
2. 조회한 위치의 기록 기능
3. 검색한 와이파이 정보 북마크 기능
4. 북마크 그룹 기능

<br/>

## Quickstart guide

### Requirements
- Java 11.x.x
- JDK 1.8
- Tomcat 9.x.x
- SQLite3

### Installation


```shell
$ git clone https://github.com/DevFrog92/Mission01.git
$ cd Mission1
```

<br/>

## Stack

### Environment 

- Intellij Ultimate
- Git
- GitHub

### Development
- Java
- JSP
- Maven
- Tomcat
- OkHttp
- Gson

<br/>

## View

|메이페이지|Open API 정보 가져오기|위치 히스토리 목록|
| :---: | :---: | :---: |
| <img width="1786" alt="Screenshot 2023-05-03 at 4 22 07 PM" src="https://user-images.githubusercontent.com/82052272/235854148-1e9b1f85-dddc-448a-80ed-f2d11284eba2.png">| <img width="1440" alt="Screenshot 2023-05-03 at 4 22 35 PM" src="https://user-images.githubusercontent.com/82052272/235854233-2d51a545-88ff-4a2e-b4d7-ee8230f38b17.png"> | <img width="1793" alt="Screenshot 2023-05-03 at 4 22 45 PM" src="https://user-images.githubusercontent.com/82052272/235854259-0b365f80-1180-4812-8870-90be1359b7a6.png"> |

|북마크 보기|북마크 그룹 관리|와이파이 상세 정보|
| :---: | :---: | :---: |
|<img width="1789" alt="Screenshot 2023-05-03 at 4 27 21 PM" src="https://user-images.githubusercontent.com/82052272/235855093-14834e69-2fba-4827-8e1d-1edc28c0efcb.png"> | <img width="1792" alt="Screenshot 2023-05-03 at 4 26 38 PM" src="https://user-images.githubusercontent.com/82052272/235854959-f3632244-c12d-42c8-bfb1-cd1387d0faf1.png"> | <img width="1049" alt="Screenshot 2023-05-03 at 4 25 24 PM" src="https://user-images.githubusercontent.com/82052272/235854770-afe15c84-9c7e-4105-be99-0366c9a793c7.png"> |

<br/>


## Feature

- 위치 기반 와이파이 정보 검색 기능
  - 사용자의 위도와 경도를 조회
  - 조회한 위도와 경도를 기반으로 가장 가까운 위치에 있는 와이파이 20개의 정보를 검색

- 위치 기록 기능
  - 와이파이 정보를 검색하기 위해서 참조된 위도와 경도를 기록

- 북마크 그룹 기능
  - 북마크 그룹의 생성 기능
  - 북마크 그룹의 조회 기능
  - 북마크 그룹의 수정 기능
  - 북마크 그룹의 삭제 기능

- 북마크 기능 
  - 북마크 그룹으로 관리
  - 위치 기반으로 검색한 와이파이 정보의 북마크 기능
    - 북마크 생성
    - 북마크 조회
    - 북마크 삭제

<br/>


## Architecture

```
Mission1
├─ README.md
├─ pom.xml
└─ src
   └─ main
      ├─ java
      │  ├─ bookmark
      │  │  ├─ BookmarkDAO.java
      │  │  ├─ BookmarkDTO.java
      │  │  ├─ BookmarkGroupDAO.java
      │  │  └─ BookmarkGroupDTO.java
      │  ├─ common
      │  │  └─ JDBConnect.java
      │  ├─ http
      │  │  └─ HttpRequest.java
      │  ├─ utils
      │  │  └─ JSFunction.java
      │  └─ wifi
      │     └─ data
      │        ├─ HistoryDAO.java
      │        ├─ HistoryDTO.java
      │        ├─ TbPublicWifiInfoObjectDTO.java
      │        ├─ WIFIInfoDetailDTO.java
      │        └─ WifiApiJsonDTO.java
      ├─ resources
      │  └─ application-env.properties
      └─ webapp
         ├─ Bookmark
         │  ├─ BookmarkAdd.jsp
         │  ├─ BookmarkAddProcess.jsp
         │  ├─ BookmarkDeleteProcess.jsp
         │  ├─ BookmarkDetail.jsp
         │  ├─ BookmarkGroup.jsp
         │  ├─ BookmarkGroupDeleteProcess.jsp
         │  ├─ BookmarkGroupDetail.jsp
         │  ├─ BookmarkGroupEditProcess.jsp
         │  ├─ BookmarkGroupProcess.jsp
         │  ├─ BookmarkList.jsp
         │  └─ BookmarkUpdate.jsp
         ├─ Common
         │  ├─ HeadTag.jsp
         │  └─ Navigation.jsp
         ├─ History
         │  ├─ HistoryAddProcess.jsp
         │  ├─ HistoryDeleteProcess.jsp
         │  └─ HistoryList.jsp
         ├─ Resources
         │  └─ css
         │     └─ main.css
         ├─ WEB-INF
         │  └─ web.xml
         ├─ WifiInfo
         │  ├─ GetWifiListProcess.jsp
         │  ├─ InfoDetail.jsp
         │  └─ OpenWifiInfo.jsp
         └─ index.jsp

```

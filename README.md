# Java小專題-網路投保系統 DEMO
模擬一個網路投保平台(未串接金流)，提供三種保險商品試算保費、投保及查詢保單等服務。  
  
 DEMO(Youtube)
 [影片連結](https://youtu.be/8HXu-Y0e3ho "Java小專題-網路投保系統 DEMO")  
   
#主要架構與`package`說明如下:  
  
**`controller`**:  
3種保險各一個:`Accident`、`Life`、`Tour`  
簽發保單:`Underwriter`  
會員管理:`MemberServlet`  
  
**`model`**:分為  
(1)`model.premium`:計算保費  
定期壽險`LifeCalculator`及旅遊平安險`TourCalculator`,意外險由後述`calculateAccident.js`計算  
(2)`model.policy`:簽發保單  
3種保險各一個:`AccidentUnderwriter`、`LifeUnderwriter`、`TourUnderwriter`;產生保單號碼:`PolicyNumber`  
(3)`model.member`:  
會員相關邏輯:`MemberService`;檢查身分證字號:`CheckID`  
  
**`beans`**:專案所用到的java bean  
保單`Policy`  
3種保險各一個:`PolicyAccident`、`PolicyLife`、`PolicyTour`，並繼承`Policy`  
會員`Member`  
  
**`api`**:專案共用的類別  
`BCrypt`&`CheckPasswd`:密碼加解密  
`ConnectionPool`:資料庫連線池 JNDI Data Source名稱

**`view`**(jsp)  
試算保費:`calculate`、`calculate_accident`、`calculate_life`、`calculate_tour`  
保單投保:`apply`、`applyAccident`、`applyLife`、`applyTour`  
保單預覽:`previewAccident`、`previewLife`、`previewTour`  
會員相關:`member`、`myPolicy`、`myPolicyDetail`、`register`、`edit`、`forget`  
  
**`vendor/js`**(javascript)  
試算保費相關:`calculateAccident`、`calculateLife`、`calculateTour`  
旅平險自動調整出發時間:`selectTime`  
註冊會員身分證字號檢查:`checkID`

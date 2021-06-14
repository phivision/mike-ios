# mike-ios
# Directory structure
## Fonts
* Nuntio Family Fonts ttf Files
## Base
### BaseViewController 
* ``` func setNavLeftBtn(imageName:String)``` 
	 > set navigator left btn with image from assets
* ``` func setNavRightBtn(imageName:String)```
	 > set navigator right btn with image from assets
* ```func changeRootController(controller:UIViewController) ```
	 > change the current rootVC to another
* ``` @objc func leftButtonPressed() ```
	 > left btn clicked response super method
* ``` @objc func rightButtonPressed()```
	 > right btn clicked response super method
## ThirdPartSDK
* TZImagePickerController
	 > select image from photo library or camera
* ZFPlayer 
	> video player which could be Highly customized
* MBProgressHUD 
	> MBProgressHUD is an iOS drop-in class that displays a translucent HUD with an indicator and/or labels while work is being done in a background thread. The HUD is meant as a replacement for the undocumented, private UIKit UIProgressHUD with some additional features.
* Utils
* UITextView+Placeholder 
	> A missing placeholder for UITextView.
* UIColorExtension 
	> A Color Extension
	+ ```class func hexColorWithAlpha(color: String, alpha:CGFloat) -> UIColor``` 
		> color from 16hex string and alpha
* StringUtils 
	> A String Handle Utils
	+ ```static func isBlank(value: String?) -> Bool``` 
		> judge the string is blank or not
	+ ```static func handleVideoKey(filename:String?) -> String``` 
		> generate a key for video file upload
	+ ```static func thumbnailImgKey() -> String``` 
		> generate a key for thumbnail prefix for image file upload
* UIViewExtension
	+ ```var origin:CGPoint``` 
	+ ```var size:CGSize``` 
	+ ```var left:CGFloat```
	+ ```var top:CGFloat```
	+ ```var right:CGFloat```
	+ ```var bottom:CGFloat```
	+ ```var width:CGFloat```
	+ ```var height:CGFloat```
* DateExtention
	+ ```func dayOfWeek() -> String``` 
		> week of cur date
* TimeFormatUtils
	+ ```static func timeStrWithDate(dateStr:String) -> String``` 
		> date to str
	+ ```static func curTimeStr(format:String) -> String``` 
		> cur date str
* HealthKitTools
	+ ```func authorizeHealthKit(completion: ((_ success:Bool, _ error:NSError?) -> Void)!)``` 
		> fetch the authorize by healthkit
	+ ```func getCalories(completion: ((_ success:Bool,_ height:Double, _ error:NSError?) -> Void)!)``` 
		> fetch calories today
	+ ```func getBodyMass(completion: ((_ success:Bool,_ bodyMass:Double, _ error:NSError?) -> Void)!)``` 
		> fetch body mass
	+ ```func getWater(completion: ((_ success:Bool,_ water:Double, _ error:NSError?) -> Void)!)``` 
		> fetch water
	+ ```func getStepCount(completion: ((_ success:Bool,_ stepCount:Double, _ error:NSError?) -> Void)!)```  
		> fetch steps
* AgeUtils
	+ ```static func getAge(birthdayStr:String) ->Int``` 
		> get age by birthday
* JSONUtils
	+ ```static func getArrayFromJSONString(jsonString:String) ->NSArray``` 
		> jsonstring to array
* ImageCacheUtils
	+ ```func imageUrl(key:String?,imgUrlCompletion:@escaping (_ img:String?,_ urlIsNull:Bool)->Void)``` 
		> image url cache from aws S3
	+ ```func clearAllUserDefaultsData()``` 
		> clear all image url which has cached by userDefaults
* HeightUtils
	+ ```static func getHeightForInch(height:String) ->String``` 
		> cm to inch
* NotificationConstMacro 
	>notification const defines
## Backend
* Backend
	+ ```static func initialize() -> Backend``` 
		> singleton
	+ ```private init()``` 
		> init and add amplify plugins
	+  ```public func signIn()```
		> signin with Cognito web user interface
	+  ```public func login(userName:String!,pwd:String!,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void)```
		> login with userName and password
	+ ```func signUp(username: String, password: String, firstName: String,lastName: String,needConfirm:@escaping ()->Void,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void)```
	+ ```func confirmSignUp(for username: String, with confirmationCode: String,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void)```
	+ ```func resetPassword(username: String,needConfirm:@escaping ()->Void,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void)```
	+ ```func confirmResetPassword```
	+ ```public func signOut(suc:@escaping ()->Void,fail:@escaping ()->Void)```
	+ ```public func fetchSession(suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void)```
	+ ```public func fetchUserProfile(userId:String,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void)```
		> fetchUserProfile After fetchSession Success
	+ ```func fetchSubscriptionList(userId:String?,suc:@escaping (_ list:Array<UserSubscriptionTrainerListModel>)->Void)```
		> fetch subscription trainer by userId
	+ ```func fetchUserProfileModel(userId:String?,suc:@escaping (_ userCenterModel:UserCenterModel)->Void,fail:@escaping (_ msg:String)->Void)```
		> fetch UserProfile for user profile page,get trainerList and favoriteList
	+ ```func fetchUserFavList(userId:String?,suc:@escaping (_ contentList:Array<UserCenterContent>)->Void,fail:@escaping (_ msg:String)->Void)```
		> fetch FavList for user profile page
	+ ```func fetchTrainerSimpleInfo(userId:String?,suc:@escaping (_ userCenterModel:UserCenterModel)->Void,fail:@escaping (_ msg:String)->Void)```
		> fetch UserProfile For Trainer Simple Info,for example,LastName、FirstName、UserImage
	+ ```func fetchTrainerDetail(trainerId:String?,suc:@escaping (_ trainerDetail:TrainerDetailModel)->Void,fail:@escaping (_ msg:String)->Void)```
		> fetch Trainer's Profile
	+ ```func fetchTrainerContentList(trainerId:String?,suc:@escaping (_ list:Array<UserCenterContent>)->Void,fail:@escaping (_ msg:String)->Void)```
	 	> fetch Trainer's Content
	+ ```func fetchContentIsFav(contentId:String?,suc:@escaping (_ isFav:Bool)->Void,fail:@escaping (_ msg:String)->Void)```
		> favUserList by ContentId
	+ ```func addContentToFav(contentId:String?,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void)```
	+ ```func delContentToFav(favRelationId:String?,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void)```
	+ ```func fetchFavIdList(suc:@escaping (_ relationDic:[String:Any])->Void,fail:@escaping (_ msg:String)->Void)```
		> fetch fav relationship id for content
	+ ```func editUserProfile(firstname:String?,lastname:String?,descValue:String?,userImage:String?,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void)```
		> edit user profile
	+ ```func uploadVideo(videoData:Data!,videoKey:String?,progressBlock:@escaping (_ progress:Progress)->Void,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void)```
		> upload video by data and key use AWSS3TransferUtility
	+ ```func uploadImage(imgData:Data!,imgName:String?,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void)```
		> upload image to aws S3
	+ ```func createUserContent(title:String!,desc:String!,isDemo:Bool!,contentName:String!,thumbnail:String!,segments:String!,suc:@escaping (_ isSuc:Bool)->Void,fail:@escaping (_ msg:String)->Void)```
		> trainer create new Content
* GraphQLRequestExt 
	> graphql query and mutation document
## Functions
* Comman
	+ DatePickerViewController
		> select hour minutes and second picker
* Trainer
	+ Cell
		+ TrainerContentListCell
			> trainer home content list cell
		+ SegmentSectionHeaderView
			> segment heaer section view
		+ TrainerBaseInfoCell
			> trainer's weight age height 
		+ VideoUploadCell
			> upload action cell
		+ ContentInputCell
			> input action cell
		+ CheckBoxCell
			> check true or false action cell
		+ SingleBtnCell
			> single btn cell
		+ SelectVideoCell
			> when selected video will show this cell instead VideoUploadCell
	+ Model
		+ TrainerDetailContent 
			> trainer detail content model
		+ TrainerDetailFavorite
			> trainer's favlist
		+ TrainerDetailModel
			> trainer detail's base info model
	+ TrainerDetailViewController
		> when user click the subscriped trainer's avatar in user profile,then will jump to this controller
		+ ``` func fetchTrainerList() ```
			> fetch trainer's uploaded content list and fav content list
		+ ```func configCollectionView()```
			> config collection 
		+ ```func userContentClicked(model: UserCenterContent)```
			> userContent clicked 
	+ TrainerProfileViewController
		> when the login user's userRole is a trainer,show this as a user profile
	+ ContentUploadViewController
		> trainer upload content by this step-1:base video info complete
		+ ```func addBtnClicked()```
			> add video btn clicked
		+ ```func inputTextChanged(textValue: String?, indexPath: IndexPath) ```
			> observer title and desc input
		+ ```func checkChanged(isChecked: Bool) ```
			> observer is demo value changed
		+ ```func reselectBtnClicked()```
			> reselect video btn clicked
		+ ```func addCaptureBtnClicked()```
			> add video capture image
		+ ``` func reselectCoverBtnClicked()```
			> reslect video capture image 
		+ ```func singleBtnClicked() ```
			> continue jump to next page for segments input
		+ ```func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])```
			> video or image select result delegate,then handle them
	+ ContentUploadSectionConfigViewController
		> trainer upload content by this step-2:segments complete
		+ ```func doneBtnClicked(timeValue: String)```
			> datepicker click done button
		+ ```func inputTextChanged(textValue: String?, indexPath: IndexPath)```
			> observer textfield input event
		+ ```@IBAction func addBtnClicked()```
			> add new section for segments
		+ ```func delBtnClicked(sectionIndex: NSInteger)```
			> del section from exists segments
		+ ```func singleBtnClicked()```
			> submit btn clicked
		+ ```func uploadVideo()```
			> upload video to s3
		+ ```func uploadVideoCapture()```
			> upload video capture to s3
		+ ```func createUserContent()```
			> when uploaded video and capture,then you can create new userContent by amplify graphql.
	+ TrainerContentListViewController
		> when the login user's userRole is a trainer,show this as home page
* User
	+ Model
		+ UserContentSegmentListModel
			> user content segment model for video timestmp and so on
		+ UserMatricsListModel
			> healthkit list model for user profile
		+ UserCenterContent
			> user content list model
		+ UserCenterFavorite
			> user favorite list
		+ UserCenterItem
			> subscriped trainers or user contents
		+ UserCenterModel
			> user base info model
		+ UserCenterTrainer
			> subscriped trainer's simple info
	+ Cell
		+ UserProfileTrainerListCell
			> trainer gridCell in user profile
		+ UserProfileSectionTitleView
			> section header title for user profile
		+ UserProfileFavoriteListCell
			> favorite collection cell for UserProfileFavHorizonListCell
		+ UserProfileHealthKitListCell
			> healthkit cell for user profile
		+ UserProfileTopCell
			> base top info for user profile
		+ UserProfileFavHorizonListCell
			> container for UserProfileFavoriteListCell to scroll horizonal
		+ UserContentDetailTopTabCell
			> user content detail top cell
		+ UserContentSegmentListCell 
			> video segment list cell
		+ UserContentSectionTitleView
			> video segments section title header
	+ UserProfileViewController
		> user profile for userRole
		+ ```@objc func fetchFavList()```
			> refresh user's fav list
		+ ```func fetchTrainerList()```
			> fetch user‘s subscription trainer list
		+ ```func configUserId()```
			> make sure which userid is current
		+ ```func configMetricsList()```
			> init healthkit to fetch calories and steps
		+ ```func getHealthInfo()```
			> fetch calories and steps
	+ UserProfileSettingViewController
		> user setting page 
	+ UserContentDetailViewController
		> content detail
		+ ```func configData()```
			> config segments string to segment list object
		+ ```func fetchFavRelationIdList()```
			> fetch fav relationship db list
		+ ```func fetchIsFav()```
			> fetch fav status for conent
		+ ```func handleFavBtnState()```
		+ ```func fetchTrainerInfo()```
			> for showing trainer info on the top
	+ UserProfileEditViewController
		> eidt user profile by user themself
		+ ```@IBAction func selectAvatar()```
			> select image for avatar upload
		+ ```func refreshUserProfile()```
			> refresh user profile
* Root
	+ HomeTabViewController
		> root page after sign in
* Video
	+ VideoViewController
		> video player page
		+ ```@objc func receiverNotification()```
			> when the iphone rotate,the notification will function
		+ ```func orientationPortraitConfig()```
			> handle rotate for portrait
		+ ```func orientationLandScapeConfig()```
			> handle rotate for landscape
		+ ```func configData()```
			> config segments data
		+ ```func configVideoView()```
		+ ```@IBAction func playBtnPressed()```
			> handle play button by video play state
		+ ```@IBAction func cameraBtnPressed()```
			> start up camera
		+ ```func configCamera()```
		+ ```func startCapture()```
			> start camera
		+ ```func stopCapture()```
			> stop camera
		+ ```func resetCaptureOrientation()```
		+ ```func configCaptureOrientation(captureConnection:AVCaptureConnection?)```
		+ ```func handlePlayBtn(byState:VideoPlayType)```
		+ ```func handleSegmentTime(currentTime:TimeInterval)```
* Home
	+ Cell
		+ HomeListCell
	+ Model
		> user subscription trainer list model
		+ UserSubscriptionTrainerListModel
		+ UserSubscriptionTrainerListContent
		+ UserSubscriptionTrainerListItem
		+ UserSubscriptionTrainerListTrainer
	+ HomeListViewController
		> home list for userRole is user
* Login
	+ Tools
		+ UserManager
			> save login base user info
		+ ArchiveTool
			> archive tool
		+ LoginTools
			> singleton for handle login action
	+ Model
		+ LoginInfoModel
			> login base user info
	+ LoginSecondViewController
		> login info input page
	+ LoginViewController
		> first leading page
	+ RegisterViewController
		> sign up action page
	+ RegisterConfirmViewController
		> confirm register by email
	+ FogotPwdViewController
		> fogot pwd action page
	+ FogotConfirmViewController
		> confirm fogot pwd by email
## Macros
* ColorConst 
	> color const by Class UIColor
* Global
	+ kScreenBounds
	+ kScreenHeight
	+ kScreenWidth
	+ kScreenSize
	+ keyWindow
	+ public let HexRGBAlpha:((Int,Float) -> UIColor)
	+ kAppdelegate
* ApiMacro
	+ kVideoHostUrl
		> video endpoint
* FontConst
	> font const for custom family
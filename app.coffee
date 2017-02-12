m = require 'material-kit'
# Import file "ghostred"
sketch = Framer.Importer.load("imported/ghostred@1x")
data = JSON.parse Utils.domLoadDataSync "data/finaljson.json"

flow = new FlowComponent
  width: Screen.width
  height: Screen.height


flow.width = 1080
flow.height=1920

flow.footer= sketch.navigationbar

flow.showNext(sketch.screen1)
sketch.button.onClick ->
	flow.showNext(sketch.screen2)
	
	
sketch.switch_on.onClick ->
	flow.showNext(sketch.screenprototype, animate:false)
	
layerA = new Layer
    x: 0
    y: 356
    #color: 'white'
    superLayer: sketch.screen2
    width: 1080
    height: 1282

layerB = new Layer
    x: 0
    y: 0
    color: '#333333'
    superLayer: sketch.Group2
    width: 1080
    height: 1282
    backgroundColor: 'transparent'
layerA.html = "<iframe src='https://www.google.com/maps/d/embed?mid=1zg_OdPRg-S0dMa9xHrcQWAkRpKI' width='1080' height='1282'></iframe>"
#Utils.insertCSS "
#	.blah {
#		background-color: white
#		min-height: 100vh;
#	}
#"
trans=[]
for i in[0..15]
	transaction=new Layer
		width:Screen.width
		height:216
		backgroundColor: "#333333"
		superLayer:layerB
		y:255*i
	trans.push(transaction)
	merchantName=new m.Text
		text:"IP:"+" "+data.transactions[i].ip
		fontSize:13
		fontWeight:300
		width:320
		color:'#fff'
		name:"ip"
		superLayer:transaction
		x:93
		y:55
	category=new m.Text
		text:"Location:"+" "+data.transactions[i].address
		fontSize:13
		fontWeight:300
		width:320
		color:'#fff'
		name:"address"
		opacity:1
		superLayer:transaction
		x:93
		y:115
	datahere=new m.Text
		text:"Business Name? No"
		fontSize:13
		fontWeight:300
		width:320
		color:'#fff'
		name:"contact"
		opacity:1
		superLayer:transaction
		x:93
		y:175	

	m.layout.set()

animlower = new Animation
	layer: sketch.Group2
	properties:
		y: 1900 
	time: .5
animlower2 = new Animation
	layer: sketch.Grouptop
	properties:
		y: 1900 
	time: .5	

animup = new Animation
	layer: sketch.Group2
	properties:
		y: 611	
	time: .5

animup2 = new Animation
	layer: sketch.Grouptop
	properties:
		y: 611 
	time: .5

animslide = new Animation
	layer: sketch.slide
	properties:
		x: 1080-584
	time:.3
animslide2 = new Animation
	layer: sketch.slide2
	properties:
		x: 1080-584
	time:.3

sketch.info.onClick ->
	animlower.start()
	animlower2.start()

sketch.button11.onClick ->
	sketch.dialog.visible=true

sketch.buttonclose.onClick ->
	sketch.dialog.visible=false

sketch.menu3.onClick ->
	sketch.menushow.visible=true
	animslide.start()
	
sketch.contact.onClick ->
	flow.showNext(sketch.screenlist)
	
#sketch.buttonexport.onClick ->
	
sketch.back1.onClick ->
	animup.start()
	animup2.start()
trans2=[]
for i in[0..15]
	transaction=new Layer
		width:Screen.width
		height:255
		backgroundColor: "#333333"
		superLayer:sketch.Grouplist
		y:255*i
	trans2.push(transaction)
	merchantName=new m.Text
		text:"IP:"+" "+data.transactions[i].ip
		fontSize:13
		fontWeight:300
		width:320
		color:'#fff'
		name:"ip"
		superLayer:transaction
		x:93
		y:55
	category=new m.Text
		text:"Location:"+" "+data.transactions[i].address
		fontSize:13
		fontWeight:300
		width:320
		color:'#fff'
		name:"address"
		opacity:1
		superLayer:transaction
		x:93
		y:115
	datahere=new m.Text
		text:"Business Name? No"
		fontSize:13
		fontWeight:300
		width:320
		color:'#fff'
		name:"contact"
		opacity:1
		superLayer:transaction
		x:93
		y:175	
	
	
	m.layout.set()	
	
sketch.buttonexport.onClick ->
	sketch.dialogconfirm.visible=true
	
sketch.buttoncloselist.onClick ->
	sketch.dialogsent.visible=true
	sketch.dialogconfirm.visible=false
sketch.buttonclosesent.onClick ->
	sketch.dialogsent.visible=false
	
	
sketch.menu4.onClick ->
	sketch.menushow2.visible=true
	animslide2.start()
sketch.find.onClick ->
	flow.showNext(sketch.screenprototype)
	sketch.menushow2.visible=false

sketch.menushow.onClick ->
	sketch.menushow.visible=false
sketch.menushow2.onClick ->
	sketch.menushow2.visible=false
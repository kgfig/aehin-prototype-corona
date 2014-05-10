local module

local sceneKeys = {
	home = "home",
	program = "program",
	countries = "aehin",
	rssFeed = "hingx"
}

local textTemplates = {
	intro = "The Asia eHealth Information Network in collaboration wit the World Health Organization and the Asian Development bank is organizing the Evidence and Information for UHC COnference in Manila this December 1 to 5, 2014. More than 100 participants form over 20 countries are expected to attend. More information is available at the <link>AeHIN website</link>. \n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur imperdiet consectetur euismod. Phasellus non ipsum vel eros vestibulum consequat. Integer convallis quam id urna tristique eu viverra risus eleifend.\n\nAenean suscipit placerat venenatis. Pellentesque faucibus venenatis eleifend. Nam lorem felis, rhoncus vel rutrum quis, tincidunt in sapien. Proin eu elit tortor. Nam ut mauris pellentesque justo vulputate convallis eu vitae metus. Praesent mauris eros, hendrerit ac convallis vel, cursus quis sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum, dui in vehicula dapibus, lorem nisi placerat turpis, quis gravida elit lectus eget nibh. Mauris molestie auctor facilisis.\n\nCurabitur lorem mi, molestie eget tincidunt quis, blandit a libero. Cras a lorem sed purus gravida rhoncus. Cras vel risus dolor, at accumsan nisi. Morbi sit amet sem purus, ut tempor mauris.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur imperdiet consectetur euismod. Phasellus non ipsum vel eros vestibulum consequat. Integer convallis quam id urna tristique eu viverra risus eleifend.\n\nAenean suscipit placerat venenatis. Pellentesque faucibus venenatis eleifend. Nam lorem felis, rhoncus vel rutrum quis, tincidunt in sapien. Proin eu elit tortor. Nam ut mauris pellentesque justo vulputate convallis eu vitae metus. Praesent mauris eros, hendrerit ac convallis vel, cursus quis sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum, dui in vehicula dapibus, lorem nisi placerat turpis, quis gravida elit lectus eget nibh. Mauris molestie auctor facilisis.\n\nCurabitur lorem mi, molestie eget tincidunt quis, blandit a libero. Cras a lorem sed purus gravida rhoncus. Cras vel risus dolor, at accumsan nisi. Morbi sit amet sem purus, ut tempor mauris.",
	tabs = {"Home", "Program", "AeHIN", "HINGx"}
}

local countryList = {
	"Bangladesh","Brunei", "Cambodia", "China", "India", "Indonesia", "Lao PDR",
	"Mongolia", "Nepal", "Pakistan", "Philippines", "Sri Lanka", "Thailand", "Timor Leste",
	"Vietnam"
}

local images = {
	listMaskFile = "mask-320x448.png",
	rowArrow = "rowArrow.png",
	tabDefaultIcon = "assets/tabIcon.png",
	tabDownIcon = "assets/tabIcon-down.png",
	tabCountriesDefaultIcon = "assets/tabIcon-countries.png",
	tabCountriesDownIcon = "assets/tabIconDown-countries.png",
	tabHomeDefaultIcon = "assets/tabIcon-home.png",
	tabHomeDownIcon = "assets/tabIconDown-home.png",
	tabFeedDefaultIcon = "assets/tabIcon-feed.png",
	tabFeedDownIcon = "assets/tabIconDown-feed.png",
	tabProgramDefaultIcon = "assets/tabIcon-program.png",
	tabProgramDownIcon = "assets/tabIconDown-program.png",
	tabBarBG = "assets/tabbar.png",
	tabSelectedLeft = "assets/tabBar_tabSelectedLeft.png",
	tabSelectedMiddle = "assets/tabBar_tabSelectedMiddle.png",
	tabSelectedRight = "assets/tabBar_tabSelectedRight.png",
	tabBarTopBG = "assets/tabBarTop.png"
}

local urls = {
	hingx = "http://kyleschaeffer.com/feed/"
}

local files = {
	rss = {
		filename = "hingx.rss", 
		path = system.TemporaryDirectory,
	}
}

local dimensions = {
	navBarHeight = 52,
	tabBarTop = 0,
	tabBarHeight = 32,
	tabItemWidth = 32,
	tabSelectedFrameWidth = 20,
	tabSelectedFrameHeight = 52,
	topPadding = 5,
	rowHeight = 36
}

local colors = {
	single = {
		lightGray = 0.9,
		white = 1,
	},
	rgb = {
		lighBlueGray = {0.18, 0.24, 0.34},
		darkBlueGray = {0.07, 0.12, 0.2},
		darkGray = {0.77, 0.77, 0.77},
		lightGray = {0.93, 0.93, 0.93},
		white = {1, 1, 1},	
	}
}

module = {
	sceneKeys = sceneKeys,
	textTemplates = textTemplates,
	countries = countryList,
	images = images,
	urls = urls,
	files = files,
	dimensions = dimensions,
	colors = colors
}

return module
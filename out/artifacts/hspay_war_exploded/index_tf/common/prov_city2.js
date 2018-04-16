function setcity2(opn_bnk_prov,opn_bnk_city) {
    var val_bnk_pro_nm = document.getElementById(opn_bnk_prov).value;
    switch (val_bnk_pro_nm) {
        case "" :
            var cityOptions = new Array("");
            break;
        case "1001" :
            var cityOptions = new Array(
				//北京
				"北京市:1000"
			);
			
            break;
		    case "1101" :
            var cityOptions = new Array(
				//天津
				"天津市:1100" 
			);
            break;
			
		    case "1200" :
            var cityOptions = new Array(
				//河北
    		    "石家庄:1210",
    		    "唐山市:1240",
    		    "秦皇岛市:1260",
    			"邯郸市:1270",
    			"邢台市:1310",
    			"保定市:1340",
    			"张家口市:1380",
    			"承德市:1410",
    			"沧州市:1430",
    			"廊坊市:1460",
    			"衡水市:1480"
			);
            break;
		case "1600" :
            var cityOptions = new Array(
    			//山西 
   				 "太原市:1610",
   				 "大同市:1620",
   				 "阳泉市:1650",
   				 "长治市:1660",
   				 "晋城市:1680",
   				 "朔州市:1690",
   				 "忻州市:1710",
   				 "吕梁市:1730",
   				 "晋中市:1750",
   				 "临汾市:1770",
   				 "运城市:1810"
			);
            break;
		case "1900" :
            var cityOptions = new Array(
    				//内蒙古
    				"呼和浩特市:1910",
    				"包头市:1920",
    				"乌海市:1930",
    				"赤峰市:1940",
    				"呼伦贝尔市:1960",
    				"兴安盟:1980",
    				"通辽市:1990",
    				"锡林郭勒盟:2010",
    				"乌兰察布市:2030",
    				"鄂尔多斯市:2050",
    				"巴彦淖尔市:2070"
    				//"阿拉善盟阿左旗:0483"				
			);
            break;
		case "2200" :
            var cityOptions = new Array(
    			    //辽宁
    				"沈阳市:2210",
    				"大连市:2220",
    				"鞍山市:2230",
    				"抚顺市:2240",
    				"本溪市:2250",
    				"丹东市:2260",
    				"锦州市:2270",
    				"葫芦岛市:2360",
    				"营口市:2280",
    				"阜新市:2290",
    				"辽阳市:2310",
    				"盘锦市:2320",
    				"铁岭市:2330",
    				"朝阳市:2340"							
			);
            break;
		case "2400" :
            var cityOptions = new Array(
    			    //吉林
    				"长春市:2410",
    				"吉林市:2420",
    			    "四平市:2430",
    				"辽源市:2440",
                    "通化市:2450",
    				"白山市:2460",
    				"白城市:2470",
    				"延边朝鲜族自治州:2490",
    				"松原市:2510"
			);
            break;
		case "2600" :
            var cityOptions = new Array(
    			    //黑龙江
    				"哈尔滨市:2610",
    				"齐齐哈尔市:2640",
    				"大庆市:2690",
    				"鸡西市:2660",
    				"鹤岗市:2670",
    				"双鸭山市:2680",
    				"佳木斯市:2720",
    				"伊春市:2710",
    				"牡丹江市:2750",
    				"七台河市:2740",
    				"绥化市:2760",
                    "黑河市:2780",
    				"大兴安岭地区:2790"				
			);
            break;
		case "2901" :
            var cityOptions = new Array(
    			    //上海
    				"上海市:2900"
			);
            break;
		case "3000" :
            var cityOptions = new Array(
    			    //江苏
    				"南京市:3010",
    				"无锡市:3020",
    				"徐州市:3030",
    				"常州市:3040",
    				"苏州市:3050",
    				"南通市:3060",
    				"连云港市:3070",
    				"淮安市:3080",
    				"宿迁市:3180",
    				"盐城市:3110",
    				"扬州市:3120",
    				"泰州市:3160",
    				"镇江市:3140"			
			);
            break;
		case "3300" :
            var cityOptions = new Array(
    			    //浙江
    				"杭州市:3310",
    				"宁波市:3320",
    				"温州市:3330",
    				"嘉兴市:3350",
    				"湖州市:3360",
    				"绍兴市:3370",
    				"金华市:3380",
    				"衢州市:3410",
    				"舟山市:3420",
    				"丽水市:3430",
    				"台州市:3450"					
			);
            break;
		case "3600" :
            var cityOptions = new Array(
    			    //安徽
    				"合肥市:3610",
    				"芜湖市:3620",
    				"蚌埠市:3630",
    				"淮南市:3640",
    				"马鞍山市:3650",
    				"淮北市:3660",
    				"铜陵市:3670",
    				"安庆市:3680",
    				"黄山市:3710",
    				"阜阳市:3720",
    				//"亳州市:3810",
    				"宿州市:3740",
    				"滁州市:3750",
    				"六安市:3760",
    				"宣城市:3770",
    				"巢湖市:3780",
    				"池州市:3790"						
			);
            break;
		case "3900" :
            var cityOptions = new Array(
    			    //福建
    				"福州市:3910",
    				"厦门市:3930",
    				"莆田市:3940",
    				"三明市:3950",
    				"泉州市:3970",
    				"漳州市:3990",
    				"南平市:4010",
    				"宁德市:4030",
    				"龙岩市:4050"				
			);
            break;
		case "4200" :
            var cityOptions = new Array(
    			    //江西
    				"南昌市:4210",
    				"景德镇市:4220",
    				"萍乡市:4230",
    				"九江市:4240",
    				"新余市:4260",
    				"鹰潭市:4270",
    				"赣州市:4280",
    				"宜春市:4310",
    				"上饶市:4330",
    				"吉安市:4350",
    				"抚州市:4370"
			);
            break;
		case "4500" :
            var cityOptions = new Array(
    			    //山东
    				"济南市:4510",
    				"青岛市:4520",
    				"淄博市:4530",
    				"枣庄市:4540",
    				"东营市:4550",
    				"烟台市:4560",
    				"潍坊市:4580",
    				"济宁市:4610",
    				"泰安市:4630",
    				"莱芜市:4790",
    				"威海市:4650",
    				"滨州市:4660",
    				"德州市:4680",
    				"聊城市:4710",
    				"临沂市:4730",
    				"日照市:4770"
    				//"菏泽市:0530"
			);
            break;
		case "4900" :
            var cityOptions = new Array(
    			    //河南
    				"郑州市:4910",
    				"开封市:4920",
    				"洛阳市:4930",
    				"平顶山市:4950",
    				"安阳市:4960",
    				"鹤壁市:4970",
    				"新乡市:4980",
    				"焦作市:5010",
    				"濮阳市:5020",
    				"许昌市:5030",
    				"漯河市:5040",
    				"三门峡市:5050",
    				"商丘市:5060",
    				"周口市:5080",
    				"驻马店市:5110",
    				"南阳市:5130",
    				"信阳市:5150"	
			);
            break;
		case "5200" :
            var cityOptions = new Array(
    			    //湖北
    				"武汉市:5210",
    				"黄石市:5220",
    				"十堰市:5230",
    				"宜昌市:5250",
    		//		"襄阳市:5280",
    		//		"随州市:0722",
    				"鄂州市:5310",
    				"神农架林区:5311",
    				"荆门市:5320",
    				"黄冈市:5330",
    				"孝感市:5350",
    				"咸宁市:5360",
    				"荆州市:5370",
    				"仙桃市:5371",
    				"天门市:5374",
    				"潜江市:5375",
    				"恩施市:5411"
			);
            break;
		case "5500" :
            var cityOptions = new Array(
    			    //湖南
    				"长沙市:5510",
    				"株洲市:5520",
    				"湘潭市:5530",
    				"衡阳市:5540",
    				"邵阳市:5550",
    				"岳阳市:5570",
    				"常德市:5580",
    				"张家界市:5590",
    				"益阳市:5610",
    				"娄底市:5620",
    				"郴州市:5630",
    				"永州市:5650",
    				"怀化市:5670",
    				"吉首市:5691"					
			);
            break;
		case "5800" :
            var cityOptions = new Array(
    			    //广东
    				"广州市:5810",
    				"韶关市:5820",
    				"深圳市:5840",
    				"珠海市:5850",
    				"汕头市:5860",
    				"揭阳市:6050",
    				"潮州市:6040",
    				"佛山市:5880",
    				"江门市:5890",
    				"湛江市:5910",
    				"茂名市:5920",
    				"肇庆市:5930",
    				"云浮市:6060",
    				"惠州市:5950",
    				"梅州市:5960",
    				"汕尾市:5970",
    			    "河源市:5980",
    				"阳江市:5990",
    				"清远市:6010",
    				"东莞市:6020",
    				"中山市:6030"
				);
            break;
		case "6100" :
            var cityOptions = new Array(
    			    //广西
    				"南宁市:6110",
    				"崇左市:6360",
    				"柳州市:6140",
    				"来宾市:6350",
    				"桂林市:6170",
    				"梧州市:6210",
    				"贺州市:6340",
    				"北海市:6230",
    				"玉林市:6240",
    				"贵港市:6330",
    				"百色市:6260",
    				"河池市:6280",
    			    "钦州市:6310",
    				"防城港市:6320"
				);
            break;
		case "6400" :
            var cityOptions = new Array(
    			    //海南
    				"海口市:6410",
    				"三亚市:6420"
			);
            break;
		case "6901" :
            var cityOptions = new Array(
    			    //重庆
    				"重庆市:6900"
			);
            break;
		case "6500" :
            var cityOptions = new Array(
    			    //四川
    				"成都市:6510",
    				"自贡市:6550",
    				"攀枝花市:6560",
    				"泸州市:6570",
    				"德阳市:6580",
    				"绵阳市:6590",
    				"广元市:6610",
    				"遂宁市:6620",
    				"内江市:6630",
    				"资阳市:6880",
    				"乐山市:6650",
    				"峨眉山市:6664",
    				"宜宾市:6710",
    				"南充市:6730",
    				"广安市:6690",
    				"达州市:6750",
    				"巴中市:6870",
    				"雅安市:6770",
    				"阿坝藏族羌族自治州:6790",
    				"甘孜藏族自治州:6810",
    				"凉山彝族自治州:6840"					
			);
            break;
		case "7000" :
            var cityOptions = new Array(
    			    //贵州
    				"贵阳市:7010",
    				"六盘水市:7020",
    				"遵义市:7030",
    				"铜仁市:7051",
    				"黔西南布依族苗族自治州:7070",
    				"毕节市:7091",
    				"安顺市:7110",
    				"黔东南苗族侗族自治州:7130",
    				"黔南布依族苗族自治州:7150"
			);
            break;
		case "7300" :
            var cityOptions = new Array(
    			    //云南
    				"昆明市:7310",
    				"昭通市:7340",
    				"曲靖市:7360",
    				"楚雄彝族自治州:7380",
    				"玉溪市:7410",
    				"红河哈尼族彝族自治州:7430",
    				"文山壮族苗族自治州:7450",
    		//		"普洱市:7470",
    				"西双版纳傣族自治州:7490",
    				"大理白族自治州:7510",
    				"保山市:7530",
    				"德宏傣族景颇族自治州:7540",
    				"丽江市:7550",
    				"怒江傈僳族自治州:7560",
    				"迪庆藏族自治州:7570",
    				"临沧市:7580",
    				"思茅市:7470"
			);
            break;
		case "7700" :
            var cityOptions = new Array(
    			    //西藏
    				"拉萨市:7710",
    				"昌都地区:7720",
    				"山南地区:7740",
    				"日喀则地区:7760",
    				"那曲地区:7790",
    				"阿里地区:7810",
    				"林芝地区:7830"
			);
            break;
		case "7900" :
            var cityOptions = new Array(
    			    //陕西
    				"西安市:7910",
    				"铜川市:7920",
    				"宝鸡市:7930",
    				"咸阳市:7950",
    				"渭南市:7970",
    				"汉中市:7990",
    				"安康市:8010",
    				"商洛市:8030",
    				"延安市:8040",
    				"榆林市:8060"							
			);
            break;
		case "8200" :
            var cityOptions = new Array(
    			    //甘肃
    				"兰州市:8210",
    				"嘉峪关市:8220",
    				"金昌市:8230",
    				"白银市:8240",
    				"天水市:8250",
    				"酒泉市:8260",
    				"张掖市:8270",
    				"武威市:8280",
    				"定西市:8290",
    				"陇南市:8310",
    				"平凉市:8330",
    				"庆阳市:8340",
    				"临夏回族自治州:8360",
    				"甘南藏族自治州:8380"					
			);
            break;
		case "8500" :
            var cityOptions = new Array(
    			    //青海
    				"西宁市:8510",
    				"海东地区:8520",
    				"海北藏族自治州:8540",
    				"黄南藏族自治州:8550",
    				"海南藏族自治州:8560",
    				"果洛藏族自治州:8570",
    				"玉树藏族自治州:8580",
    				"海西蒙古族藏族自治州:8590"
			);
            break;
		case "8700" :
            var cityOptions = new Array(
    			    //宁夏
    				"银川市:8710",
    				"石嘴山市:8720",
    				"吴忠市:8730",
    				"固原市:8740",
    				"中卫市:8750"
			);
            break;
		case "8800" :
            var cityOptions = new Array(
    			    //新疆
    				"乌鲁木齐市:8810",
    				"克拉玛依市:8820",
    				"吐鲁番地区:8830",
    				"哈密地区:8840",
    				"昌吉回族自治州:8850",
    				"博尔塔拉蒙古自治州:8870",
    				"巴音郭楞蒙古自治州:8880",
    				"阿克苏地区:8910",
    				"克孜勒苏柯尔克孜自治州:8930",
    				"喀什地区:8940",
    				"伊犁哈萨克自治州:8980",
    				"塔城地区:9010",
    				"阿勒泰地区:9020"
			);
            break;    
	}
	document.getElementById(opn_bnk_city).options.length = 0;
    for(var i = 0; i < cityOptions.length; i++) {
    	var arr_city=cityOptions[i].split(":");
    	//alert("arr_city=" + arr_city);
		var city_code=arr_city[1];
		var city_nm=arr_city[0];
		//alert("arr_city=" + city_nm + " --> " + city_code);
        document.getElementById(opn_bnk_city).options[i]=new Option(city_nm,city_code);
        if ( document.getElementById(opn_bnk_city).options[i].value=="") {document.getElementById(opn_bnk_city).selectedIndex = i;}
  
}
}
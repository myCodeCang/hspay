function setcity(opn_bnk_prov,opn_bnk_city) {
    var val_bnk_pro_nm = document.getElementById(opn_bnk_prov).value;
    switch (val_bnk_pro_nm) {
        case "" :
            var cityOptions = new Array("");
            break;
        case "01" :
            var cityOptions = new Array(
				//����
				"������:100"
			);
            break;
		    case "02" :
            var cityOptions = new Array(
				//���
				"�����:220" 
			);
            break;
		    case "03" :
            var cityOptions = new Array(
				//�ӱ�
    		    "ʯ��ׯ:311",
    		    "��ɽ��:315",
    		    "�ػʵ���:335",
    			  "������:310",
	    			"��̨��:319",
	    			"������:312",
	    			"�żҿ���:313",
	    			"�е���:314",
	    			"������:317",
	    			"�ȷ���:316",
	    			"��ˮ��:318"
			);
            break;
		case "04" :
            var cityOptions = new Array(
    			//ɽ�� 
   				 "̫ԭ��:351",
   				 "��ͬ��:352",
   				 "��Ȫ��:353",
   				 "������:355",
   				 "������:356",
   				 "˷����:349",
   				 "������:350",
   				 "������:358",
   				 "������:354",
   				 "�ٷ���:357",
   				 "�˳���:359"
			);
            break;
		case "05" :
            var cityOptions = new Array(
    				//���ɹ�
    				"���ͺ�����:471",
    				"��ͷ��:472",
    				"�ں���:473",
    				"�����:476",
    				"�˰���:1980",
    				"ͨ����:475",
    				"��������:482",
    				"������˹��:477",
    				"���ֺ���:479",
    				"�������˰�����:483",
    				"������:470",
    				"����:474",
    				"�ٺ�:478"			
			);
            break;
		case "06" :
            var cityOptions = new Array(
    			    //����
    				"������:240",
    				"������:411",
    				"��ɽ��:412",
    				"��˳��:413",
    				"��Ϫ��:414",
    				"������:415",
    				"������:416",
    				"��«����:429",
    				"Ӫ����:417",
    				"������:418",
    				"������:419",
    				"�̽���:427",
    				"������:410",
    				"������:421"							
			);
            break;
		case "07" :
            var cityOptions = new Array(
    			    //����
    				"������:431",
    				"������:432",
    			  "��ƽ��:434",
    				"��Դ��:437",
            "ͨ����:435",
    				"��ɽ��:439",
    				"�׳���:436",
    				"�Ӽ�:433",
    				"��ԭ��:438",
    				"÷�ӿ�:435",
    				"����:433"
			);
            break;
		case "08" :
            var cityOptions = new Array(
    			    //������
    				"��������:451",
    				"���������:452",
    				"������:459",
    				"������:453",
    				"�׸���:454",
    				"˫Ѽɽ��:454",
    				"��ľ˹��:454",
    				"������:458",
    				"ĵ������:453",
    				"��̨����:453",
    				"�绯��:458",
            "�ں���:456",
    				"���˰������:456",
    				"����:450"				
			);
            break;
		case "09" :
            var cityOptions = new Array(
    			    //�Ϻ�
    				"�Ϻ���:210"
			);
            break;
		case "10" :
            var cityOptions = new Array(
    			    //����
    				"�Ͼ���:250",
    				"������:510",
    				"������:516",
    				"������:519",
    				"������:520",
    				"������:512",
    				"��ͨ��:513",
    				"���Ƹ���:518",
    				"������:517",
    				"��Ǩ��:527",
    				"�γ���:515",
    				"������:514",
    				"̩����:523",
    				"����:511"			
			);
            break;
		case "11" :
            var cityOptions = new Array(
    			    //�㽭
    				"������:571",
    				"������:574",
    				"������:577",
    				"������:573",
    				"������:572",
    				"������:575",
    				"����:579",
    				"������:570",
    				"��ɽ��:580",
    				"��ˮ��:578",
    				"̨����:576"					
			);
            break;
		case "12" :
            var cityOptions = new Array(
    			    //����
    				"�Ϸ���:551",
    				"�ߺ���:553",
    				"������:552",
    				"������:554",
    				"����ɽ��:555",
    				"������:561",
    				"ͭ����:562",
    				"������:556",
    				"��ɽ��:559",
    				"������:558",
    				"������:558",
    				"������:557",
    				"������:550",
    				"������:564",
    				"������:563",
    				"������:565",
    				"������:566"						
			);
            break;
		case "13" :
            var cityOptions = new Array(
    			    //����
    				"������:591",
    				"������:592",
    				"������:594",
    				"������:598",
    				"Ȫ����:595",
    				"������:596",
    				"��ƽ��:599",
    				"������:593",
    				"������:597"				
			);
            break;
		case "14" :
            var cityOptions = new Array(
    			    //����
    				"�ϲ���:791",
    				"��������:798",
    				"Ƽ����:799",
    				"�Ž���:792",
    				"������:790",
    				"ӥ̶��:701",
    				"������:797",
    				"�˴���:795",
    				"������:793",
    				"������:796",
    				"������:794"
			);
            break;
		case "15" :
            var cityOptions = new Array(
    			    //ɽ��
    				"������:531",
    				"�ൺ��:532",
    				"�Ͳ���:533",
    				"��ׯ��:632",
    				"��Ӫ��:546",
    				"��̨��:535",
    				"Ϋ����:536",
    				"������:537",
    				"̩����:538",
    				"������:634",
    				"������:631",
    				"������:543",
    				"������:534",
    				"�ĳ���:635",
    				"������:539",
    				"������:633",
    				"������:530"
			);
            break;
		case "16" :
            var cityOptions = new Array(
    			    //����
    				"֣����:371",
    				"������:378",
    				"������:379",
    				"ƽ��ɽ��:375",
    				"������:372",
    				"�ױ���:392",
    				"������:373",
    				"������:391",
    				"�����:393",
    				"������:374",
    				"�����:395",
    				"����Ͽ��:398",
    				"������:370",
    				"�ܿ���:394",
    				"פ������:396",
    				"������:377",
    				"������:376",
    				"�괨��:376"	
			);
            break;
		case "17" :
            var cityOptions = new Array(
    			    //����
    				"�人��:270",
    				"��ʯ��:714",
    				"ʮ����:719",
    				"�˲���:717",
    				"������:710",
    				"������:722",
    				"������:711",
    				"��ũ������:725",
    				"������:724",
    				"�Ƹ���:713",
    				"Т����:712",
    				"������:715",
    				"������:716",
    				"������:726",
    				"������:727",
    				"Ǳ����:730",
    				"��ʩ��:718",
    				"������:728"
			);
            break;
		case "18" :
            var cityOptions = new Array(
    			    //����
    				"��ɳ��:731",
    				"������:731",
    				"��̶��:731",
    				"������:734",
    				"������:739",
    				"������:730",
    				"������:736",
    				"�żҽ���:744",
    				"������:737",
    				"¦����:738",
    				"������:735",
    				"������:746",
    				"������:745",
    				"������:743"					
			);
            break;
		case "19" :
            var cityOptions = new Array(
    			    //�㶫
    				"������:200",
    				"�ع���:751",
    				"������:755",
    				"�麣��:5850",
    				"��ͷ��:754",
    				"������:663",
    				"������:768",
    				"��ɽ��:757",
    				"������:750",
    				"տ����:759",
    				"ï����:668",
    				"������:758",
    				"�Ƹ���:766",
    				"������:752",
    				"÷����:753",
    				"��β��:660",
    			  "��Դ��:762",
    				"������:662",
    				"��Զ��:763",
    				"��ݸ��:769",
    				"��ɽ��:760"
				);
            break;
		case "20" :
            var cityOptions = new Array(
    			    //����
    				"������:771",
    				"������:6120",
    				"������:772",
    				"������:6155",
    				"������:773",
    				"������:774",
    				"������:6225",
    				"������:779",
    				"������:775",
    				"�����:6242",
    				"��ɫ��:776",
    				"�ӳ���:778",
    			  "������:777",
    				"���Ǹ���:770"
				);
            break;
		case "21" :
            var cityOptions = new Array(
    			    //����
    				"������:898",
    				"������:899"
			);
            break;
		case "31" :
            var cityOptions = new Array(
    			    //����
    				"������:230"
			);
            break;
		case "22" :
            var cityOptions = new Array(
    			    //�Ĵ�
    				"�ɶ���:280",
    				"�Թ���:813",
    				"��֦����:812",
    				"������:830",
    				"������:838",
    				"������:816",
    				"��Ԫ��:839",
    				"������:825",
    				"�ڽ���:832",
    				"������:832",
    				"��ɽ��:833",
    				"üɽ��:833",
    				"�˱���:831",
    				"�ϳ���:817",
    				"�㰲��:826",
    				"������:818",
    				"������:827",
    				"�Ű���:835",
    				"���Ӳ���Ǽ��������:837",
    				"���β���������:836",
    				"��ɽ����������:834"					
			);
            break;
		case "23" :
            var cityOptions = new Array(
    			    //����
    				"������:851",
    				"����ˮ��:858",
    				"������:852",
    				"ͭ����:856",
    				"ǭ���ϲ���������������:7070",
    				"�Ͻ���:857",
    				"��˳��:853",
    				"ǭ�������嶱��������:7130",
    				"ǭ�ϲ���������������:7150"
			);
            break;
		case "24" :
            var cityOptions = new Array(
    			    //����
    				"������:871",
    				"��ͨ��:870",
    				"������:874",
    				"��������������:878",
    				"��Ϫ��:877",
    				"��ӹ���������������:873",
    				"��ɽ׳������������:876",
    				"�ն���:881",
    				"��˫���ɴ���������:691",
    				"��������������:872",
    				"��ɽ��:875",
    				"�º���徰����������:692",
    				"������:888",
    				"ŭ��������������:886",
    				"�������������:887",
    				"�ٲ���:883"
			);
            break;
		case "25" :
            var cityOptions = new Array(
    			    //����
    				"������:891",
    				"��������:895",
    				"ɽ�ϵ���:893",
    				"�տ������:892",
    				"��������:896",
    				"�������:897",
    				"��֥����:894"
			);
            break;
		case "26" :
            var cityOptions = new Array(
    			    //����
    				"������:290",
    				"ͭ����:919",
    				"������:917",
    				"������:290",
    				"μ����:913",
    				"������:916",
    				"������:915",
    				"������:914",
    				"�Ӱ���:911",
    				"������:912"							
			);
            break;
		case "27" :
            var cityOptions = new Array(
    			    //����
    				"������:931",
    				"��������:937",
    				"�����:935",
    				"������:943",
    				"��ˮ��:938",
    				"��Ȫ��:937",
    				"��Ҵ��:936",
    				"������:935",
    				"������:932",
    				"¤����:939",
    				"ƽ����:933",
    				"������:934",
    				"���Ļ���������:930",
    				"���ϲ���������:941"					
			);
            break;
		case "28" :
            var cityOptions = new Array(
    			    //�ຣ
    				"������:971",
    				"��������:972",
    				"��������������:970",
    				"���ϲ���������:973",
    				"���ϲ���������:974",
    				"�������������:975",
    				"��������������:976",
    				"�����ɹ������������:977"
			);
            break;
		case "29" :
            var cityOptions = new Array(
    			    //����
    				"������:951",
    				"ʯ��ɽ��:952",
    				"������:953",
    				"��ԭ��:954"				
			);
            break;
		case "30" :
            var cityOptions = new Array(
    			    //�½�
    				"��³ľ����:991",
    				"����������:990",
    				"��³������:995",
    				"���ܵ���:902",
    				"��������������:994",
    				"���������ɹ�������:909",
    				"���������ɹ�������:992",
    				"�����յ���:997",
    				"�������տ¶�����������:908",
    				"��ʲ����:998",
    				"�������:903",
    				"���������������:999",
    				"���ǵ���:901",
    				"����̩����:906",
    				"ʯ������:993"
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
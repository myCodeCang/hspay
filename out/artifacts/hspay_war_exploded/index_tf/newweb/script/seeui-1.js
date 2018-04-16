	//-- Menu variables -------------
	var timeout    = 0;
	var closetimer = 0;
	var menuItem = 0;
		
	$(document).ready(function(){
		//-- Initialize the editor
		//
		$(".wysiwyg").wysiwyg();
		
		//-- Initialize the style switcher
		//
		$.stylesheetInit();
		$('.styleswitch').bind(
			'click',function(e)
			{
				$.stylesheetSwitch(this.getAttribute('rel'));
				return false;
			}
		); 
		
		//-- Expand subitems or contract on click
		//
		$("#menu>ul>li>a").click(function(e){
			e.stopPropagation();
			
			if ($('ol',this.parentNode).size()){
				$('ol>li[class!=pin]',this.parentNode).slideToggle('fast');
				$(this.parentNode).toggleClass('expanded');	
			}
		});
		
		
		//-- Show pin on mouse over sub items
		//
		$("#menu ul li> ol li").hover(function(){
			$('.pin',this).css('display','block');
		},function(){
			var lipt = $(this);
			if (!$(lipt).hasClass('pin')){
				$('http://www.tftpay.com/newweb/script/span.pin',this).css('display','none');
			}
		});
		
		
		//-- Add/Remove pin
		//
		$("http://www.tftpay.com/newweb/script/span.pin").click(function(e){
			//e.preventDefault();
			e.stopPropagation();
			
			var exp = $(this.parentNode.parentNode.parentNode.parentNode).hasClass('expanded');
			var lipt = $(this.parentNode.parentNode);
			
			if (exp){
				$(lipt).toggleClass('pin');
			}else{
				$(lipt).slideUp('fast',function(){
					$(lipt).removeClass('pin');
				});
			}
		});
		
		
		//-- Colapse widget content
		//
		$("#menu>ul>li.widget>a").click(function(e){
			e.preventDefault();
			e.stopPropagation();
			
			if ($('div.content',this.parentNode).size()){
				$('div.content',this.parentNode).slideToggle('fast');
				$(this).toggleClass('expanded');
			}
		});
		
		$("#menu li>div.content, #pannelDash .menu ul li").click(function(e){
			e.preventDefault();
			e.stopPropagation();
		});
		
		
		//-- Dashbroad tabs
		//
		$("#pannelDash>.menu li").click(function(){
			$("#pannelDash .menu li").removeClass('selected');
			$(this).addClass('selected');
		});
		
		

		//-- main_tab tabs
		//
		$(".main_tab .tabs a").click(function(){
			$(".main_tab .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
                //-- checkstand_tab tabs
		//
		 //-- checkstand_tab tabs
		//
		$(".checkstand_tab .tabs a").click(function(){
			$(".checkstand_tab .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
		$(".login_r_tab .tabs a").click(function(){
			$(".login_r_tab .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
                //-- help_tab tabs
		//
		$(".help_tab .tabs a").click(function(){
			$(".help_tab .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
                 //-- purview_tab tabs
		//
		$(".purview_tab .tabs a").click(function(){
			$(".purview_tab .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
                 //-- accout_recharge_tab tabs
		//
		$(".accout_recharge_tab .tabs a").click(function(){
			$(".accout_recharge_tab .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
		                 //-- accout_recharge_tab3 tabs
		//
		$(".accout_recharge_tab3 .tabs a").click(function(){
			$(".accout_recharge_tab3 .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
                //-- record_tab tabs
		//
		$(".record_tab .tabs a").click(function(){
			$(".record_tab .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
		 //-- ive_credit_tab tabs
		//
		$(".ive_credit_tab .tabs a").click(function(){
			$(".ive_credit_tab .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
         //-- advance_tab tabs
		//
		$(".advance_tab .tabs a").click(function(){
			$(".advance_tab .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
		 //-- paychange tabs
		//
		$(".paychange_tab .tabs a").click(function(){
			$(".paychange_tab .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
		
		//-- General UI Tab Component 
		//
		$(".tabbar .tabs a").click(function(){
			$(".tabbar .tabs a").removeClass('selected');
			$(this).addClass('selected');
		});
		
		//-- Hide tooltip on close
		//
		$('.toolTip .close').click(function(){
			$(this.parentNode).fadeOut(function(){
				$(this).remove();
			});
		});
		
		
		//-- Page dropdown menu
		//
		document.onclick = dropMenu_close;
			
		$('#pgmenu > li').bind('mouseover', dropMenu_open);
		$('#pgmenu > li').bind('mouseout',  dropMenu_timer);		
		
		$('#pgmenu>li>ul,#pgmenu>li>ul>li').mouseover(function(){
			var parent = $(this).parents('li');
			$(parent).addClass('pgmv');
		});
		
		$('#pgmenu>li>ul, #pgmenu>li>ul>li').mouseout(function(){
			var parent = $(this).parents('li');
			$(parent).removeClass('pgmv');
		});
		
	});
	
	function dropMenu_open()
	{  
		dropMenu_canceltimer();
		dropMenu_close();
		menuItem = $(this).find('ul').css('visibility', 'visible');
		}

	function dropMenu_close()
	{  
		if(menuItem) menuItem.css('visibility', 'hidden');
		}

	function dropMenu_timer()
	{  
		closetimer = window.setTimeout(dropMenu_close, timeout);
		}

	function dropMenu_canceltimer()
	{  
		if(closetimer){
			window.clearTimeout(closetimer);
			closetimer = null;
			}
		}
	
	function showOnly(tab,toolbar)
	{
		$('.'+toolbar+' .tabContent div[class^="tab"]').css('display','none');
		$('.'+toolbar+' .tabContent .'+tab).css('display','block');
		}
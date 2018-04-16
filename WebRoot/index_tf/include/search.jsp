<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <script type="text/javascript" language="javascript">
        document.getElementById('ins6').className = 'on';
    </script>
  <!--logo tel 结束-->
  <div id="help_search">
      <div id="help_search_content">
			<div class="left marginl140 inline width116">
				<img src="pic/help_search_icon.gif" />
			</div>
			<form id="form1" name="form1" method="post" action="">
				<div class="left width450" style="border: 0px solid #000;">
					<input type="text" name="TITLE" id="TITLE"
						class="help_search_input" value="请输入问题关键字 如：提现"
						onclick="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}" />
				</div>
				<div class="left width116 marginl10 inline"
					style="margin-left: 18px; border: 0px solid #000;">
					&nbsp;<input type="button" class="btn_help_search"
						onclick="searchTitle()" value="快速搜索" />
				</div>
			</form>
      </div>
  </div> 
  <!--搜索结束-->

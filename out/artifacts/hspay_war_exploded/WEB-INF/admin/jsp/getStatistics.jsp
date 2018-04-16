<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../page/page.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="<%=basePath%>/js/echarts-plain-map.js"></script>
</head>
<body>
	<div id="main"
		style="height: 520px; width:100%; padding: 10px;"></div>
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'));
		myChart.setOption({
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '交易金额','实际交易金额','收益金额' ]
			},
			toolbox : {
				show : true,
				feature : {
					mark : true,
					magicType : [ 'line', 'bar' ],
					restore : true,
					saveAsImage : true
				}
			},
			calculable : true,
			dataZoom : {
				show : true,
				realtime : true,
				start : 40,
				end : 60
			},
			xAxis : [ {
				type : 'category',
				boundaryGap : true,
				data : function() {
					return ${nettime};
				}()
			} ],
			yAxis : [ {
				type : 'value',
				splitArea : {
					show : true
				}
			} ],
			series : [ {
				name : '交易金额',
				type : 'line',
				data : function() {
					return ${p3_Amt};
				}()
			}, {
				name : '实际交易金额',
				type : 'line',
				data : function() {
					return ${amount};
				}()
			}, {
				name : '收益金额',
				type : 'line',
				data : function() {
					return ${deducted};
				}()
			} ]
		});
	</script>
</body>
</html>
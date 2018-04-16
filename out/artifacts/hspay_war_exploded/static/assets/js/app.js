$(function() {
    // 读取body data-type 判断是哪个页面然后执行相应页面方法，方法在下面。
    var dataType = $('body').attr('data-type');
    for (key in pageData) {
        if (key == dataType) {
            pageData[key]();
        }
    }
    saveSelectColor.Color = 'theme-white';
    // 保存选择项
    storageSave(saveSelectColor);
    //     // 判断用户是否已有自己选择的模板风格
    //    if(storageLoad('SelcetColor')){
    //      $('body').attr('class',storageLoad('SelcetColor').Color)
    //    }else{
    //        storageSave(saveSelectColor);
    //        $('body').attr('class','theme-black')
    //    }

    autoLeftNav();
    $(window).resize(function() {
        autoLeftNav();
    });

    //    if(storageLoad('SelcetColor')){

    //     }else{
    //       storageSave(saveSelectColor);
    //     }
})


// 页面数据
var pageData = {
    // ===============================================
    // 首页
    // ===============================================
    'index': function indexData() {
        $('#member-nav').addClass('active');
        $('#member-ul').show();
        $('#member-info').addClass('sub-active');
        $('#titleSpan').html('用户信息');

        var orderDay=document.getElementById('orderDay').value;
        orderDay=orderDay.split(',');
        var orderCount=document.getElementById('orderCount').value;
        orderCount=orderCount.split(',');
        var orderNum=document.getElementById('orderNum').value;
        orderNum=orderNum.split(',');
        // ==========================
        // 百度图表A http://echarts.baidu.com/
        // ==========================

        var echartsA = echarts.init(document.getElementById('tpl-echarts'));
        option = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data:['订单数量','当日金额']
            },
            grid: {
                top: '3%',
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: false,
                data: orderDay.sort()
            }],
            yAxis: [{
                type: 'value'
            }],
            textStyle: {
                color: '#838FA1'
            },
            series: [{
                name: '订单数量',
                type: 'line',
                stack: '总量',
                areaStyle: { normal: {} },
                data: orderCount
            },{
                name: '当日金额',
                type: 'line',
                stack: '总量',
                areaStyle: { normal: {} },
                data: orderNum,
                label: {
                    normal: {
                        show: true,
                        position: 'top'
                    }
                },
            }]
        };

        echartsA.setOption(option);
    },
    // ===============================================
    // 接口信息
    // ===============================================
    'index-payment': function indexPaymentData() {
        $('#member-nav').addClass('active');
        $('#member-ul').show();
        $('#member-payment').addClass('sub-active');
        $('#titleSpan').html('商户接入信息');
    },
    // ===============================================
    // 个人信息
    // ===============================================
    'index-member': function indexPaymentData() {
        $('#member-nav').addClass('active');
        $('#member-ul').show();
        $('#member-member').addClass('sub-active');
        $('#titleSpan').html('个人资料');
    },
    // ===============================================
    // 修改密码
    // ===============================================
    'index-password': function indexPaymentData() {
        $('#member-nav').addClass('active');
        $('#member-ul').show();
        $('#member-password').addClass('sub-active');
        $('#titleSpan').html('修改密码');
    },
    // ===============================================
    // 修改手机号
    // ===============================================
    'index-phone': function indexPaymentData() {
        $('#member-nav').addClass('active');
        $('#member-ul').show();
        $('#member-phone').addClass('sub-active');
        $('#titleSpan').html('修改手机号');
    },
    // ===============================================
    // 
    // ===============================================
    'index-log': function indexPaymentData() {
        $('#member-nav').addClass('active');
        $('#member-ul').show();
        $('#member-log').addClass('sub-active');
        $('#titleSpan').html('登陆日志');
    },
    'exchange-0': function indexPaymentData() {
        $('#exchange-nav').addClass('active');
        $('#exchange-ul').show();
        $('#exchange-net').addClass('sub-active');
        $('#titleSpan').html('网银订单');
    },
    'exchange-44': function indexPaymentData() {
        $('#exchange-nav').addClass('active');
        $('#exchange-ul').show();
        $('#exchange-weixin').addClass('sub-active');
        $('#titleSpan').html('微信扫码订单');
    },
    'exchange-46': function indexPaymentData() {
        $('#exchange-nav').addClass('active');
        $('#exchange-ul').show();
        $('#exchange-alipay').addClass('sub-active');
        $('#titleSpan').html('支付宝扫码订单');
    },
    'exchange-49': function indexPaymentData() {
        $('#exchange-nav').addClass('active');
        $('#exchange-ul').show();
        $('#exchange-wxwap').addClass('sub-active');
        $('#titleSpan').html('微信H5订单');
    },
    'exchange-45': function indexPaymentData() {
        $('#exchange-nav').addClass('active');
        $('#exchange-ul').show();
        $('#exchange-aliwap').addClass('sub-active');
        $('#titleSpan').html('支付宝H5订单');
    },
    'exchange-50': function indexPaymentData() {
        $('#exchange-nav').addClass('active');
        $('#exchange-ul').show();
        $('#exchange-qqmobile').addClass('sub-active');
        $('#titleSpan').html('QQ钱包订单');
    },
    'exchange-card': function indexPaymentData() {
        $('#exchange-nav').addClass('active');
        $('#exchange-ul').show();
        $('#exchange-card').addClass('sub-active');
        $('#titleSpan').html('点卡订单');
    },
    'recharge-info': function indexPaymentData() {
        $('#payment-nav').addClass('active');
        $('#payment-ul').show();
        $('#recharge-info').addClass('sub-active');
        $('#titleSpan').html('充值');
    },
    'recharge-log': function indexPaymentData() {
        $('#payment-nav').addClass('active');
        $('#payment-ul').show();
        $('#recharge-log').addClass('sub-active');
        $('#titleSpan').html('充值记录');
    },
    'card-info': function indexPaymentData() {
        $('#payment-nav').addClass('active');
        $('#payment-ul').show();
        $('#card-info').addClass('sub-active');
        $('#titleSpan').html('销卡');
    },
    'card-log': function indexPaymentData() {
        $('#payment-nav').addClass('active');
        $('#payment-ul').show();
        $('#card-log').addClass('sub-active');
        $('#titleSpan').html('销卡记录');
    },
    'settlement-info': function indexPaymentData() {
        $('#settlement-nav').addClass('active');
        $('#settlement-ul').show();
        $('#settlement-info').addClass('sub-active');
        $('#titleSpan').html('提现申请');
    },
    'settlement-log': function indexPaymentData() {
        $('#settlement-nav').addClass('active');
        $('#settlement-ul').show();
        $('#settlement-log').addClass('sub-active');
        $('#titleSpan').html('提现记录');
    },
    'settlement-num': function indexPaymentData() {
        $('#settlement-nav').addClass('active');
        $('#settlement-ul').show();
        $('#settlement-num').addClass('sub-active');
        $('#titleSpan').html('提现账号');
    },
    'another-pay': function indexPaymentData() {
        $('#settlement-nav').addClass('active');
        $('#settlement-ul').show();
        $('#another-pay').addClass('sub-active');
        $('#titleSpan').html('代付账号');
    },
    'another-log': function indexPaymentData() {
        $('#settlement-nav').addClass('active');
        $('#settlement-ul').show();
        $('#another-log').addClass('sub-active');
        $('#titleSpan').html('代付记录');
    },
    'transfer-info': function indexPaymentData() {
        $('#transfer-nav').addClass('active');
        $('#transfer-ul').show();
        $('#transfer-info').addClass('sub-active');
        $('#titleSpan').html('转账');
    },
    'transfer-log': function indexPaymentData() {
        $('#transfer-nav').addClass('active');
        $('#transfer-ul').show();
        $('#transfer-log').addClass('sub-active');
        $('#titleSpan').html('转账记录');
    },
    'announcement': function indexPaymentData() {
        $('#member-announcement').addClass('active');
        $('#titleSpan').html('公告信息');
    },
    'about': function indexPaymentData() {
        $('#member-about').addClass('active');
        $('#titleSpan').html('联系我们');
    },
    // ===============================================
    // 图表页
    // ===============================================
    'chart': function chartData() {
        // ==========================
        // 百度图表A http://echarts.baidu.com/
        // ==========================

        var echartsC = echarts.init(document.getElementById('tpl-echarts-C'));


        optionC = {
            tooltip: {
                trigger: 'axis'
            },

            legend: {
                data: ['蒸发量', '降水量', '平均温度']
            },
            xAxis: [{
                type: 'category',
                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
            }],
            yAxis: [{
                    type: 'value',
                    name: '水量',
                    min: 0,
                    max: 250,
                    interval: 50,
                    axisLabel: {
                        formatter: '{value} ml'
                    }
                },
                {
                    type: 'value',
                    name: '温度',
                    min: 0,
                    max: 25,
                    interval: 5,
                    axisLabel: {
                        formatter: '{value} °C'
                    }
                }
            ],
            series: [{
                    name: '蒸发量',
                    type: 'bar',
                    data: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                },
                {
                    name: '降水量',
                    type: 'bar',
                    data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                },
                {
                    name: '平均温度',
                    type: 'line',
                    yAxisIndex: 1,
                    data: [2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
                }
            ]
        };

        echartsC.setOption(optionC);

        var echartsB = echarts.init(document.getElementById('tpl-echarts-B'));
        optionB = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                x: 'center',
                data: ['某软件', '某主食手机', '某水果手机', '降水量', '蒸发量']
            },
            radar: [{
                    indicator: [
                        { text: '品牌', max: 100 },
                        { text: '内容', max: 100 },
                        { text: '可用性', max: 100 },
                        { text: '功能', max: 100 }
                    ],
                    center: ['25%', '40%'],
                    radius: 80
                },
                {
                    indicator: [
                        { text: '外观', max: 100 },
                        { text: '拍照', max: 100 },
                        { text: '系统', max: 100 },
                        { text: '性能', max: 100 },
                        { text: '屏幕', max: 100 }
                    ],
                    radius: 80,
                    center: ['50%', '60%'],
                },
                {
                    indicator: (function() {
                        var res = [];
                        for (var i = 1; i <= 12; i++) {
                            res.push({ text: i + '月', max: 100 });
                        }
                        return res;
                    })(),
                    center: ['75%', '40%'],
                    radius: 80
                }
            ],
            series: [{
                    type: 'radar',
                    tooltip: {
                        trigger: 'item'
                    },
                    itemStyle: { normal: { areaStyle: { type: 'default' } } },
                    data: [{
                        value: [60, 73, 85, 40],
                        name: '某软件'
                    }]
                },
                {
                    type: 'radar',
                    radarIndex: 1,
                    data: [{
                            value: [85, 90, 90, 95, 95],
                            name: '某主食手机'
                        },
                        {
                            value: [95, 80, 95, 90, 93],
                            name: '某水果手机'
                        }
                    ]
                },
                {
                    type: 'radar',
                    radarIndex: 2,
                    itemStyle: { normal: { areaStyle: { type: 'default' } } },
                    data: [{
                            name: '降水量',
                            value: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 75.6, 82.2, 48.7, 18.8, 6.0, 2.3],
                        },
                        {
                            name: '蒸发量',
                            value: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 35.6, 62.2, 32.6, 20.0, 6.4, 3.3]
                        }
                    ]
                }
            ]
        };
        echartsB.setOption(optionB);
        var echartsA = echarts.init(document.getElementById('tpl-echarts-A'));
        option = {

            tooltip: {
                trigger: 'axis',
            },
            legend: {
                data: ['邮件', '媒体', '资源']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: true,
                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
            }],

            yAxis: [{
                type: 'value'
            }],
            series: [{
                    name: '邮件',
                    type: 'line',
                    stack: '总量',
                    areaStyle: { normal: {} },
                    data: [120, 132, 101, 134, 90, 230, 210],
                    itemStyle: {
                        normal: {
                            color: '#59aea2'
                        },
                        emphasis: {

                        }
                    }
                },
                {
                    name: '媒体',
                    type: 'line',
                    stack: '总量',
                    areaStyle: { normal: {} },
                    data: [220, 182, 191, 234, 290, 330, 310],
                    itemStyle: {
                        normal: {
                            color: '#e7505a'
                        }
                    }
                },
                {
                    name: '资源',
                    type: 'line',
                    stack: '总量',
                    areaStyle: { normal: {} },
                    data: [150, 232, 201, 154, 190, 330, 410],
                    itemStyle: {
                        normal: {
                            color: '#32c5d2'
                        }
                    }
                }
            ]
        };
        echartsA.setOption(option);
    }
}


// 风格切换

$('.tpl-skiner-toggle').on('click', function() {
    $('.tpl-skiner').toggleClass('active');
})

$('.tpl-skiner-content-bar').find('span').on('click', function() {
    $('body').attr('class', $(this).attr('data-color'))
    saveSelectColor.Color = $(this).attr('data-color');
    // 保存选择项
    storageSave(saveSelectColor);

})




// 侧边菜单开关


function autoLeftNav() {



    $('.tpl-header-switch-button').on('click', function() {
        if ($('.left-sidebar').is('.active')) {
            if ($(window).width() > 1024) {
                $('.tpl-content-wrapper').removeClass('active');
            }
            $('.left-sidebar').removeClass('active');
        } else {

            $('.left-sidebar').addClass('active');
            if ($(window).width() > 1024) {
                $('.tpl-content-wrapper').addClass('active');
            }
        }
    })

    if ($(window).width() < 1024) {
        $('.left-sidebar').addClass('active');
    } else {
        $('.left-sidebar').removeClass('active');
    }
}


// 侧边菜单
$('.sidebar-nav-sub-title').on('click', function() {
    $(this).siblings('.sidebar-nav-sub').slideToggle(80)
        .end()
        .find('.sidebar-nav-sub-ico').toggleClass('sidebar-nav-sub-ico-rotate');
})
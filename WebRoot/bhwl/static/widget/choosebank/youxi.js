define('modules/widget/choosebank/youxi', function(require, exports, module) {

  /**
   * Created by Administrator on 2016/9/23.
   */
  var $ = require('components/jquery/jquery');
  
  console.log('youxi.js');
  
  
  
  $(function() {
  
      $("#yx-kmcz").bind("click", function() {
          $(".card_sp").removeClass("active");
          $(this).addClass("active");
      });
  
      $("#yx-zc").bind("click", function() {
          $(".card_sp").removeClass("active");
          $(this).addClass("active");
      });
  
  });

});

define('modules/widget/choosebank/index', function(require, exports, module) {

  var $ = require('components/jquery/jquery');
  
  console.log('choosebank.js');
  
  $(function() {
  
      $("#tabcard-cxk").bind("click", function() {
          $(".card_sp").removeClass("active");
          $(this).addClass("active");
          $(".card_bo").hide();
          $("#cxk").show();
      });
  
      $("#tabcard-xyk").bind("click", function() {
          $(".card_sp").removeClass("active");
          $(this).addClass("active");
          $(".card_bo").hide();
          $("#xyk").show();
      });
      $("#tabcard-yhhk").bind("click", function() {
          $(".card_sp").removeClass("active");
          $(this).addClass("active");
          $(".card_bo").hide();
          $("#yhhk").show();
      });
      $("#tabcard-yjsk").bind("click", function() {
          $(".card_sp").removeClass("active");
          $(this).addClass("active");
          $(".card_bo").hide();
          $("#yjsk").show();
      });
  });
  

});

Bacancy_Apptitude_Test.Questions = {
  form: {
    singleCheck: function(){
      $('input.option-check').on('change', function() {
        $('input.option-check').not(this).prop('checked', false);
      });
    },
    saveDisable: function(){
      $("input:checkbox[class=option-check]").click(function(){
        if($("input:checkbox[class=option-check]:checked").length >=  1){
          $('button').attr('disabled', false);
        }
        else{
          $('button').attr('disabled', true);
        }
      });
    }
  }
}

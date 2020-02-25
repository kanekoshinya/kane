$(function() {
  $("#q_name_cont").on("keyup", function() {
    let input = $("#q_name_cont").val();
    var url = $(this).attr('action');
    $.ajax({
      type:"GET",
      url:"url",
      data:{keyword:input},
      dataType:"json"
    })
      .done(function(groups){
        console.log("成功です");
      })
      .fail(function(){
        console.log("失敗です");
      })
  });
});

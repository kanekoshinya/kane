$(function(){
  function buildHTML(message){
    var html =
    `<div class="contents__message" data-message-id = "${message.id}">
    <div class="contents__message-message">
     ${message.content}
    </div>
    <div class="contents__message-contents">
    <div class="contents__message-contents-good">
    いいね
    </div>
    <div class="contents__message-contents-name">
     ${message.user_name}
    </div>
    </div>
    </div>`
    return html;
  };
  $('#new_message').on('submit',function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url:url,
      type:"POST",
      data:formData,
      dataType:'json',
      processData: false,
      contentType: false
    })
      .done(function(data){
        var html = buildHTML(data);
        $('.message__contents').append(html);
        $('form')[0].reset();
        $('.message_contents').animate({ scrollTop: $('.contents__message')[0].scrollHeight});
      })
      .fail(function(){
        console.log("error");
      })
      .always(function() {
        $('.submit-btn').prop('disabled', false);
      });
  });
  var reloadMessages = function(){
  var last_message_id = $('.contents__message:last').data("message-id");
  $.ajax({
    url:"api/messages",
    type:'get',
    dataType:'json',
    data:{id:last_message_id}
  })
  .done(function(messages){
    if (messages.length !==0){
    var insertHTML = '';
    $.each(messages,function(i,message){
      insertHTML += buildHTML(message)
    });
    $('.message__contents').append(insertHTML);
  }
  })
  .fail(function(){
    console.log("no");
  })
  }
  if (document.location.href.match(/\/groups\/\d+\/messages/)){
    setInterval(reloadMessages,7000);
  }
});
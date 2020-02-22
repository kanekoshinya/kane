$(function(){
  function buildHTML(message){
    var html =
    `<div class="contents__message">
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
      })
      .fail(function(){

      })
  });
});
$(function() {
  function buildHTML(message) {
    var image_html = ''
    if(message.image) {
      image_html = `<img src= ${ message.image } alt= ${ message.image } >`;
    };

    var html = `<p class="chat-main__message-name">
                  ${ message.name }
                </p>
                <p class="chat-main__message-time">
                  ${ message.time }
                </p>
                ${ image_html }
                <p class="chat-main__message-body">
                  ${ message.body }
                </p>`;
    return html;
  };

  function buildFlash_notice(notice) {
    var flash = `<div class="flash-alert-notice">
                  ${ notice }
                </div>`;
    return flash;
  }

  function buildFlash_alert(alert) {
    var flash = `<div class="flash-alert-alert">
                  ${ alert }
                </div>`;
    return flash;
  }

  function scroll() {
    var height = $('.chat-main__message.clearfix#319').outerHeight();
    $('.chat-main__body').animate({scrollTop: height}, 300);
  };

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var message = new FormData($('#new_message')[0]);
    $('.flash-alert-notice').remove();
    $('.flash-alert-alert').remove();
    $.ajax({
      type: 'POST',
      url: './messages',
      data: message,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(message) {
      var html = buildHTML(message);
      var notice = "メッセージが投稿されました";
      var flash = buildFlash_notice(notice);
      $('body').prepend(flash);
      $('.chat-main__message.clearfix#319').append(html);
      $('#new_message')[0].reset();
      scroll();
    })
    .fail(function() {
      var alert = "メッセージを入力してください";
      var flash = buildFlash_alert(alert);
      $('body').prepend(flash);
    });
    return false;
  });
});
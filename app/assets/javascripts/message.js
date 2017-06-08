$(function() {
  function buildHTML(message) {
    var html = `<p class="chat-main__message-name">
                  ${ message.name }
                </p>
                <p class="chat-main__message-time">
                  ${ message.time }
                </p>
                <p class="chat-main__message-body">
                  ${ message.body }
                </p>`;
    return html;
  };

  function scroll() {
    var height = $('.chat-main__message.clearfix#319').outerHeight();
    $('.chat-main__body').animate({scrollTop: height}, 300);
  };

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    var message = textField.val();

    $.ajax({
      type: 'POST',
      url: './messages',
      data: {
        message: {
          body: message
        }
      },
      dataType: 'json'
    })

    .done(function(message) {
      var html = buildHTML(message);
      $('.chat-main__message.clearfix#319').append(html);
      $('#new_message')[0].reset();
      scroll();
    })
    .fail(function() {
      alert("メッセージを入力してください");
    });
    return false;
  });
});
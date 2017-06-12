$(document).on('turbolinks:load', function() {
  function buildHTML(user) {
    var html = `<li class='chat-group-user clearfix'>
                  <div class='chat-group-user__name'>${ user.name }</div>
                  <div class='chat-group-user__btn chat-group-user__btn--add'
                  data-name="${ user.name }" data-id="${ user.id }">追加</div>
                </li>`;
    return html;
  };

  function removeHTML(user) {
    var html = `<li class='chat-group-user clearfix'>
                  <div class='chat-group-user__name'>${ user.name }</div>
                  <div class='chat-group-user__btn
                  chat-group-user__btn--remove'>削除</div>
                  <input type='hidden' value="${ user.id }" name="group[user_ids][]">
                </li>`;
    return html;
  };

  $('.chat-group-form__input').on('keyup', function() {
    $('#user-search-result').empty();
    var name = $('#user-search-field').val();
    $.ajax ({
      type: 'GET',
      url: '/users/search',
      data: {
        keyword: name
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = "";
      if(name.length !== 0) {
        $.each(data.users, function(i, user) {
          html += buildHTML(user);
        });
      };
      $('#user-search-result').append(html);
    })
    .fail(function() {
      alert("ユーザー検索に失敗しました");
     });
    return false;
  });

  $('#user-search-result').on('click', '.chat-group-user__btn--add', function(user) {
    var name = $(this).data(name);
    var id = $(this).data(id);
    var rmv_html = removeHTML(name, id);
    $('#chat-group-users').append(rmv_html);
    $('this').parent('chat-group-from__field--right').remove();
  });

  $('#chat-group-users').on('click', '.chat-group-user__btn--remove', function() {
    $(this).parent().remove();
  });
});
$(function() {

  var search_list = $(".text");

  function appendProgramminglog (prolog) {

    var html =  `<div class="textonly">
                  <div class="text__left">
                    <div class="text__image" style="background-image: url(${prolog.image});"></div>
                  </div>
                  <div class="text__right">
                    <div class="text__title">
                      <a href = "/programminglogs/${prolog.id}" data-method="get" class: "content__right__top--title">${prolog.title}</a>
                    </div>
                    <div class="text__bottom">
                      <div class="text__time">
                        ${prolog.created_at}
                      </div>
                      <div class="user__name">
                        <img src=${prolog.user_image} class = "icon_image">
                        <div class="content__right__bottom--username">
                          <a href = "/users/${prolog.id}" data-method="get" class: "content__right__bottom--userName--btn">${prolog.name}</a>
                        </div>
                      </div>
                      $('span').each(function(){
                        if($(this).text() > 100000) return false;
                        var html = $(this).html().replace(/(\d*)/g,"<b>$1</b>");
                      $(this).html(html);
                    })
                      <span style="background-color: #EEEEEE; color: #666666; border-radius: 5px; padding: 5px">${prolog.tags.name}</span>
                      <div class="good">
                        <i class="far fa-thumbs-up"></i>
                        ${prolog.likes}
                      </div>
                    </div>
                  </div>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class="content__right__bottom--username">${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/programminglogs/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(prologs) {
      search_list.empty();
      if (prologs.length !== 0) {
        prologs.forEach(function(prolog){
          appendProgramminglog(prolog);
        });
      }
      else {
        appendErrMsgToHTML("一致する投稿がありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});
$(function() {

  let search_list = $(".text");

  function appendProgramminglog (prolog) {

    let html =  `<div class="textonly">
                  <div class="text__left">
                    <div class="text__image" style="background-image: url(${prolog.image});"></div>
                  </div>
                  <div class="text__right">
                    <div class="text__title">
                      <a href = "/programminglogs/${prolog.id}" data-method="get" class: "content__right__top--title">${prolog.title}</a>
                    </div>
                    <div class="text__bottom">
                      <div class="content__right__bottom--username">
                        <a href = "/users/${prolog.id}" data-method="get" class: "content__right__bottom--userName--btn">
                          ${prolog.user.name}
                        </a>
                      </div>
                      <div class="text__time">
                        ${prolog.created_at}
                      </div>
                    </div>
                  </div>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class="content__right__bottom--username">${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
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
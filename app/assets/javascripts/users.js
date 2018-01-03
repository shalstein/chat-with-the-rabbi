


$(function() {
  attachListners()

  function addUserInfo(user) {
    var source = $('#user-template').html()
    var template = Handlebars.compile(source)
    var html = template(user)

    $(`ul a[data-id='${user.id}']`).after(html)
  }//addUserInfo function

  function usersHtml(users) {
    var users_string = ""
    users.forEach(function(user) {
      users_string += ` <ul> <h3> <a href='#' class='user' data-id='${user.id}'>  ${user.name} </a> </h3> </ul>`
    }) //forEach and function

    $('article').after(users_string)
    $('.user').one('click', function(event) {
      event.preventDefault()
      $.getJSON(`/users/${this.dataset.id}`)
      .done(function(user) {


        addUserInfo(user)

      })//done function

    })
  }//usersHtml

  function attachListners() {
    $('#users').one('click', function(event) {
      event.preventDefault()
      $.get("/users")
        .done(function(users) {
        usersHtml(users)
      })

    })
  }//attachListners
Handlebars.registerHelper("formatedTime", function() {
  return new Date(this.time_and_date)
})//helper


const chatConsole = $('#chat-console')
chatConsole.draggable({ containment: "body", scroll: false });


})//document ready

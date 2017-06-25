



$(function() {
  attachListners()
})

function attachListners() {
  $('#users').on('click', function(event) {
    event.preventDefault()
    $.get("/users")
      .done(function(users) {
      usersHtml(users)
      console.log("in thte get method")
    })

  })
}

function usersHtml(users) {
  var users_string = ""
  users.forEach(function(user) {
    users_string += `<li><a href='#' class='user' data-id='${user.id}'>  ${user.name} </a> </li> `
  })

  $('article').html(users_string)
}

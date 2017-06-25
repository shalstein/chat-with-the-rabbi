



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
    users_string += `<ul><a href='#' class='user' data-id='${user.id}'>  ${user.name} </a> </ul> `
  })

  $('article').html(users_string)
  $('article a').on('click', function(event) {
    event.preventDefault()
    $.getJSON(`/users/${this.dataset.id}`).done(function(user) {
      var userHtml = `<li>  ID: ${user.id} - ${user.email} - Wallet: $${user.wallet} - Role: ${user.role}  </li>`
      $(`ul a[data-id='${user.id}']`).after(userHtml)
    })
  })
}

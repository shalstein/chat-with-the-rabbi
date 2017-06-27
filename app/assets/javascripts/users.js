



$(function() {
  attachListners()
})

function attachListners() {
  $('#users').on('click', function(event) {
    event.preventDefault()
    $.get("/users")
      .done(function(users) {
      usersHtml(users)
    })

  })
}

function usersHtml(users) {
  var users_string = ""
  users.forEach(function(user) {
    users_string += `<ul><a href='#' class='user' data-id='${user.id}'>  ${user.name} </a> </ul> `
  })

  $('article').html(users_string)
  $('.user').on('click', function(event) {
    event.preventDefault()
    $.getJSON(`/users/${this.dataset.id}`)

    .done(function(user) {
      var userHtml = `<li>  ID: ${user.id} - ${user.email} - Wallet: $${user.wallet}.00 - Role: ${user.role}  </li>  <a href='#' data-user-id='${user.id}' class='appointments' > Get ${user.name}'s' Appointments </a>`

      $(`ul a[data-id='${user.id}']`).after(userHtml)
      $('.appointments').on('click', function(event) {
        var userId = this.dataset.userId
        event.preventDefault()
        $.getJSON(`/users/${userId}/appointments`)
        .done(function(appointments) {
          var appointmentHtml = "<ol>"
          appointments.forEach(function(appointment) {
            appointmentHtml += ` <li> ${appointment.time_and_date} with Rabbi ${appointment.rabbi.last_name}</li>`
          })
          $(`.appointments[data-user-id="${userId}"]`).after(appointmentHtml)

        })
      })
    })
  })
}

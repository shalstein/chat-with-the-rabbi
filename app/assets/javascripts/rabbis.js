$(function() {
  $("form").on('submit', function(event) {
    event.preventDefault()
    var rabbiObject = {rabbi: {first_name: $('#rabbi_first_name').val(), last_name: $('#rabbi_last_name').val(), dob: $('#rabbi_dob').val(), branch_of_judaism: $('#rabbi_branch_of_judaism').val(), charisma_level: $('#rabbi_charisma_level').val()}}
    $.ajax({
      method: 'POST',
      url: "/rabbis",
      data: JSON.stringify(rabbiObject),
      dataType: "json",
      contentType: "application/json"
    })//ajax
    .done(function(rabbi) {

      var html = `<li><a href='/rabbis/${rabbi.id}'> Rabbi ${rabbi.first_name} ${rabbi.last_name} </a> Charisma Level: ${rabbi.charisma_level} </li>`
      $("ol").append(html)
      debugger
      $('form').trigger('reset')
    })//done
  })//on
})//doc ready

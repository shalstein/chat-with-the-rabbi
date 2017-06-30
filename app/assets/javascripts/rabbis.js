$(function() {
  $("#new_rabbi").on('submit', function(event) {
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
      var rabbiObject = new Rabbi(rabbi.id, rabbi.first_name, rabbi.last_name, rabbi.charisma_level )

      //var html = `<li><a href='/rabbis/${rabbi.id}'> Rabbi ${rabbi.first_name} ${rabbi.last_name} </a> Charisma Level: ${rabbi.charisma_level} </li>`
      $("ol").append(rabbiObject.html())
      $('form').trigger('reset')
    })//done
  })//on


})//doc ready

function Rabbi(id, first_name, last_name, charisma_level) {
  this.id = id
  this.first_name = first_name
  this.last_name = last_name
  this.charisma_level = charisma_level
}

Rabbi.prototype.html = function() {
  return  `<li><a href='/rabbis/${this.id}'> Rabbi ${this.first_name} ${this.last_name} </a> Charisma Level: ${this.charisma_level} </li>`
}

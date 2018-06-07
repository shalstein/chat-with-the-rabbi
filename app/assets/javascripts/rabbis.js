
$(function() {

  deleteRabbiListner($('.delete-rabbi'))


  $("#new_rabbi").on('submit', function(event) {
    event.preventDefault()
    var rabbiObject = {rabbi: {first_name: $('#rabbi_first_name').val(), last_name: $('#rabbi_last_name').val(), dob: $('#rabbi_dob').val(), branch_of_judaism: $('#rabbi_branch_of_judaism').val(), charisma_level: $('#rabbi_charisma_level').val()}}
    $.ajax({
      method: 'POST',
      url: "/rabbis",
      data: JSON.stringify(rabbiObject),
      dataType: "json",
      contentType: "application/json"
    })
    .done(function(json) {
      const { rabbi, isAdmin } = json; //#uglifier does not like this syntax
      //const rabbi = json.rabbi
      //const isAdmin =json.isAdmin
      var rabbiObject = new Rabbi(rabbi.id, rabbi.first_name, rabbi.last_name, rabbi.charisma_level )
      $("ol").append(rabbiObject.html(isAdmin))
      $('form').trigger('reset')
      deleteRabbiListner($("button[data-rabbi-id=" + rabbi.id + "]"))
    })
  })
})

var deleteRabbiListner = jquery => {
  jquery.on('click', event => {
    const rabbiId = event.target.dataset.rabbiId
    const rabbi = event.target.parentElement.firstElementChild.innerText
    const isDestroyable = confirm(`Are you sure you want to delete ${rabbi} and all appointments associated with it?`)

    if (isDestroyable) {
      $.ajax({
      method: 'DELETE',
      url: '/rabbis/' + rabbiId,
    })
    .done(function(response) {
      if (response.status === 201) {
        $(`button[data-rabbi-id='${response.rabbi_id}']`).parents('.rabbi').empty()
      }
    })}

    })
  }



function Rabbi(id, first_name, last_name, charisma_level) {
  this.id = id
  this.first_name = first_name
  this.last_name = last_name
  this.charisma_level = charisma_level
}

Rabbi.prototype.html = function(isAdmin) {
  if (isAdmin) {
    return (`
      <div class="rabbi">
      <p></p>
        <li>
          <a href='/rabbis/${this.id}'>
            Rabbi ${this.first_name} ${this.last_name}
          </a> Charisma Level: ${this.charisma_level}
          <br> <button data-rabbi-id="${this.id}" class='delete-rabbi' type="button">Delete</button>
        </li>
        <p></p>
      </div>
    `);
  }
  return ( `
    <div class="rabbi">
    <p></p>
      <li>
        <a href='/rabbis/${this.id}'>
          Rabbi ${this.first_name} ${this.last_name}
        </a> Charisma Level: ${this.charisma_level}
      </li>
      <p></p>
    </div>
      `)
}

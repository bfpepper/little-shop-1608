$(document).on('turbolinks:load', function(){
  $('#destination-search').on('click', function(){
    if ($(this).val() == "Find your next lilypad"){
        $(this).val("")
    }
  });
});

$(document).ready(function(){

  $("#user_password").keypress(function(){
    var pwordLength = $("#user_password").val().length;

    if ( pwordLength < 3 ) {
      $("#strength").text("password strength: weak");
      $("#strength").css('color', 'red');

    } else if ( pwordLength < 6) {
      $("#strength").text("password strength: ok");
      $("#strength").css('color', 'orange');

    } else if ( pwordLength < 9) {
      $("#strength").text("password strength: good");
      $("#strength").css('color', 'green');

    } else if ( pwordLength < 13) {
      $("#strength").text("password strength: oustanding");
      $("#strength").css('color', 'navy');

    } else if ( pwordLength < 17) {
      $("#strength").text("password strength: god-like");
      $("#strength").css('color', 'purple');
    };
  });

  $("#user_password").keydown(function(key){
    if ( key.which === 8 ) {
      var pwordLength = $("#user_password").val().length;

      if ( pwordLength < 5 ) {
        $("#strength").text("password strength: weak");
        $("#strength").css('color', 'red');

      } else if ( pwordLength < 8) {
        $("#strength").text("password strength: ok");
        $("#strength").css('color', 'orange');

      } else if ( pwordLength < 11) {
        $("#strength").text("password strength: good");
        $("#strength").css('color', 'green');

      } else if ( pwordLength < 15) {
        $("#strength").text("password strength: oustanding");
        $("#strength").css('color', 'navy');

      } else if ( pwordLength < 19) {
        $("#strength").text("password strength: god-like");
        $("#strength").css('color', 'purple');
      };
    };
  });

});

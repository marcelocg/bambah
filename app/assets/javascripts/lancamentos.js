$(function() {
  $( "#spinMes" ).spinner({
    spin: function( event, ui ) {
            if ( ui.value > 12 ) {
              $( this ).spinner( "value", 1 );
              return false;
            } else if ( ui.value < 1 ) {
              $( this ).spinner( "value", 12 );
              return false;
            }
          }
  });
});
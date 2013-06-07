$(function() {

  var cache = {};
  $( "#inputNatureza" ).autocomplete({
    minLength: 1,
    source: "naturezas.json",
    select: function( event, ui ) {
      $( "#inputNatureza" ).val( ui.item.nome );
      $( '#inputNaturezaId').val( ui.item.id );      
      return false;
    }
  })
  .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
    return $( "<li>" )
    .append( "<a>" + item.id + " - " + item.nome + "</a>" )
    .appendTo( ul );
  };

  $( '#btnCriarLancamento' ).click( function() {
    $( '#inputId' ).val('');
    $( '#inputMes' ).val( $( '#spinMes' ).val());
    $( '#editarLancamentoModal' ).modal('show');
  });

  $( '#editarLancamentoModal' ).on('shown', function () {
    $( '#inputNatureza' ).focus();
  });

  $( '#spanCarregando' ).hide();

  $('#filtroLancamentos').submit(loadLancamentos);

  $( "#spinAno" ).spinner();

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

  $( "#spinMes" ).on( "spinstop", function( event, ui ) {
    $('#filtroLancamentos').submit();
  });

  $( "#spinAno" ).on( "spinstop", function( event, ui ) {
    $('#filtroLancamentos').submit();
  });

  var buscarLancamentos = null;

  function loadLancamentos(event) {
    event.preventDefault();

    if (buscarLancamentos) {
      buscarLancamentos.abort();
    }

    var form = $(this).serialize();
    buscarLancamentos = $.ajax('/lancamentos', {
      data: form,
      dataType: 'script',
      cache: false,
      timeout: 10000, //dez segundos
      beforeSend: function(result) { 
        $( "#spanCarregando" ).show();
        $('#flash').hide();
      },
      complete: function(result) { 
        $( "#spanCarregando" ).hide();
        buscarLancamentos = null;
      },
      error: function(result) {
        $( "#spanCarregando" ).hide();
        if (result.statusText != "abort") {
          $('#flash').show();
        }
      }
    });
    
  }
});
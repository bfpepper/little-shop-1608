var changeCart = function(trip_id, select){
  $.ajax({
    type:'POST',
    url:'/update_cart',
    data: { trip_id: trip_id, quantity: select.value }
  });
}

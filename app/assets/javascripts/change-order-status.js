$(document).ready(function(){
   $("#admin-order-status").change(function(){
     $.ajax({
       type:'GET',
       url: '/admin/change_status_view',
       data: {status: document.getElementById('admin-order-status').value}
     });
   });
});

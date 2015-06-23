<div class="datasSent">
   Datas sent to the server :
   <p></p>
</div>
<div class="serverResponse">
   Server response :
   <p></p>
</div>
   <script type="text/javascript">
      $(document).ready(function(){
         $(".exemple6").jRating({
           length:5,
           decimalLength:1,
           showRateInfo:false,
           onSuccess : function(){
           alert('Success : your rate has been saved :)');}

         });
      });
   </script>
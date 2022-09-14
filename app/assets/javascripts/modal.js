$(document).ready(function(){
  if ($('#audition-index'))
  {
    $('.audition_list').click(function(element){
      const url = element.currentTarget.dataset
      $.ajax(url, { type: 'Get' });
    });
  }
});

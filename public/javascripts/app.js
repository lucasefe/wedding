function CloudInit() {
  var width = $(window).width() + 'px top';  
  $('.nube#uno').animate({
   marginTop: "40px",
   backgroundPosition: width
  }, 73000);
  setTimeout("CloudReset()", 53100 );
}
function CloudReset() {
  $('.nube#uno').css({marginTop: '50px', backgroundPosition: '-100px top'});
  setTimeout("CloudInit()", 7000 );
}


function CloudInit2() {
  var width = $(window).width() + 'px top';  
  $('.nube#dos').delay(10000).css({ opacity: 0.8 }).animate({
   backgroundPosition: width
  }, 83000);
  setTimeout("CloudReset2()", 83100 );
}
function CloudReset2() {
  $('.nube#dos').css({backgroundPosition: '-100px top'});
  setTimeout("CloudInit2()", 12000 );
}


$(window).load(function() {   
  CloudInit();
  CloudInit2();
  
});



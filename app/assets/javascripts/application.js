// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

(function(window, document, undefined) {
  
  $('#pintrest-share').live('click', function() {
    var e = document.createElement('script');
    e.setAttribute('type','text/javascript');
    e.setAttribute('charset','UTF-8');
    e.setAttribute('src','http://assets.pinterest.com/js/pinmarklet.js?r='+Math.random()*99999999);
    document.body.appendChild(e);
    return false;
  });
  
  $('#facebook-share, .facebook-share-link').live('click', function() {
    var url = "https://www.facebook.com/dialog/feed?" +
              "app_id=379298132126259&" +              
              "link=" + "https://www.qt2.me&" +
              "picture=" + "http://www.qt2.me/assets/qt_1.jpg&" +
              "name=qt2me&" + 
              "caption=" + encodeURIComponent("Make someone's day!") + 
              "&description=" + encodeURIComponent("Send them a photo postcard of this QT!") +
              "&redirect_uri=https://www.qt2.me";
    window.open(url);
    return false;
  });
  
  $('#twitter-share, .twitter-share-link').live('click', function() {
    window.open('https://twitter.com/intent/tweet?text=' + encodeURIComponent(document.title) + '&url=' + encodeURIComponent(document.location.href) + '&via=qt2me');
    return false;
  });
  
  $('#google-plus-share').live('click', function() {
    window.open('https://plus.google.com/share?url=' + encodeURIComponent(document.location.href) + '&hl=en-US');
    return false;
  });
  
})(this, this.document);
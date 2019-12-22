$(function(){
	var tag = document.createElement('script');
	tag.src = "https://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
});

function onYouTubeIframeAPIReady() {
  ytPlayer = new YT.Player(
       'sample', // 埋め込む場所の指定
        {
           width: 640, // プレーヤーの幅
          height: 390, // プレーヤーの高さ
            videoId: '__uOlOneKiI'
      }
   );
}
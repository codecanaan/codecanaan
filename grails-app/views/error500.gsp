<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="error"/>
<title>Error 500</title>
</head>
<body>

<div class="container">
	<section class="justfont">
		<h1>網站發生無法抹滅的錯誤</h1>
		<p>Sorry！由於系統內部發生一些問題，可能導致您暫時無法存取此網站，造成不便敬請見諒。</p>
		<p>除了等待系統復原，您還可以嘗試這些動作：</p>
		<ul>
			<li><a href="/">回到主畫面</a>。</li>
			<li><a href="http://fallback.codecanaan.com/">Remove Cookies</a>，清理瀏覽器對此網站保留的設定資料。</li>
			<li>手動清除瀏覽器快取和 Cookies，請參考 Google 的<a href="http://support.google.com/accounts/bin/answer.py?hl=zh-Hant&answer=32050" target="_blank">說明</a>。</li>
			<li>將問題回報給網站管理者（lyhcode@gmail.com）。</li>
			<li>休息片刻，可以保護眼睛及消除疲勞。</li>
		</ul>
	</section>
</div>
<div class="container">
	<button class="show-detail btn btn-small">詳細檢視 / Details</button>
	<div class="details justfont" style="display:none;margin-top:60px">
		<g:renderException exception="${exception}" />
	</div>
</div>

<script type="text/javascript">
(function() {
	$('.show-detail').toggle(function() {
		$('.details').show();
	}, function() {
		$('.details').hide();
	});
})();
</script>
</body>
</html>
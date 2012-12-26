<html>
<head>
<title>Home</title>
<meta name="layout" content="bootstrap"/>
</head>
<body>
<div class="row">
    <div class="span8">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#announce-tab" data-toggle="tab"><g:message code="postType.ANNOUNCE.label" /></a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="announce-tab">
                <g:if test="${posts?.size()>0}">
                    <ul class="links">
                        <g:each in="${posts}" var="post" status="i">
                            <li class="${i==0?'first':'show-lines'}">
                                <g:link controller="post" action="show" params="[name: post.name]">${post.title}</g:link>
                                <small><em>(${post.hits})</em></small>
                                <small class="muted"><g:formatDate date="${post.dateCreated}" type="date" /></small>
                            </li>
                        </g:each>
                    </ul>
                    <div style="text-align:right">
                        <g:link controller="post" action="list"><g:message code="default.more.label" args="[message(code:'postType.ANNOUNCE.label')]" /> ...</g:link>
                    </div>
                </g:if>
                <g:else>
                    <g:message code="default.empty.description" />
                </g:else>
            </div>
        </div>
    </div>
    <div class="span4">

        <div style="text-align:center;padding:2em 0">
            <font style="font-size:32pt" class="popover-auto logo-font" title="關於 CodeCanaan" data-placement="bottom" data-content="根據聖經記載，Canaan（迦南）是上帝賜給以色列人祖先的應許之地，選民在流奶與蜜的迦南美地自由安居。CodeCanaan 是程式設計學習者的迦南美地，我們致力於創造一個自由開放且樂趣無窮的學習環境。">CodeCanaan</font><br/>
            <small style="font-family:'Droid Sans Mono';color:#000099">程式設計數位學習方舟計畫</small>
        </div>
        <r:script>$('.popover-auto').popover({trigger: 'hover'});</r:script>

        <div>
            <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fplweb.org&amp;width=292&amp;height=62&amp;show_faces=false&amp;colorscheme=light&amp;stream=false&amp;border_color&amp;header=false&amp;appId=102994276528232" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px; height:62px;" allowTransparency="true"></iframe>
        </div>

        <sec:ifLoggedIn>
            <g:link controller="home" action="client" class="btn btn-primary">
                <i class="icon icon-download"></i>
                客戶端工具
            </g:link>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <div class="alert">
                登入後啟動客戶端工具
            </div>
        </sec:ifNotLoggedIn>
    </div>
</div>
<hr />
<div class="row">
    <div class="span5">
        <h4>專業電腦認證教學平台</h4>
        <ul class="icons">
            <li><i class="icon-ok"></i> 完美結合 TQC+ 認證題庫與教材</li>
            <li><i class="icon-ok"></i> 軟體設計領域實作導向練習</li>
            <li><i class="icon-ok"></i> 雲端運算架構，僅需 Java 及瀏覽器即可執行</li>
            <li><i class="icon-ok"></i> 整合 Facebook 帳號登入</li>
            <li><i class="icon-ok"></i> 支援程式碼實作練習，簡化程式執行及測試</li>
        </ul>
    </div>
    <div class="span7">
        <div id="myCarousel" class="carousel slide">
        <div class="carousel-inner">
            <div class="active item">
                <g:img dir="images" file="home-slide-1.png" />
                <div class="carousel-caption">
                    <h4>不打烊的雲端教室</h4>
                    <p>瀏覽器連網就能學習，教學效率提昇百分百！</p>
                </div>
            </div>
            <div class="item">
                <g:img dir="images" file="home-slide-2.png" />
                <div class="carousel-caption">
                    <h4>數位化教材與全球同步</h4>
                    <p>彈指之間就能取得來自各地頂尖教學機構的資源共享！</p>
                </div>
            </div>
        </div>
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div>
        <r:script>$('.carousel').carousel();</r:script>
    </div>
</div>
<hr />
<div class="row">
    <div class="span6">
        <h4>使用手冊</h4>
        <ul>
            <li>開始實作練習題之前，請先<a href="http://www.java.com/zh_TW/" target="_blank">安裝 Java 軟體</a>，依照教材指示正確設定開發環境，並確認「客戶端工具」已經啟動！</li>
            <li>個人帳號免註冊，請使用 Facebook 帳號直接登入；TQC+ Java 課程序號請洽<strong>電腦技能基金會</strong>索取試用。</li>
        </ul>
    </div>
    <div class="span6">
        <h4>瀏覽器相容性</h4>
        <ul>
            <li>建議使用 Google Chrome 瀏覽器以獲得最佳體驗</li>
            <li>支援各式 HTML5 相容的瀏覽器閱讀教材內容</li>
            <li>程式碼實作練習支援 Google Chrome 及 Firefox 瀏覽器</li>
            <li>已針對平板電腦提供最佳化閱讀效果</li>
        </ul>
        <img src="${resource(dir:'images', file:'browsers.png')}" alt="browsers" />
    </div>
</div>
<hr class="soften" />
<div class="row">
    <div class="span4">
        <img src="${resource(dir:'images', file:'responsive_web_design.png')}" alt="responsive" />
        <h4><i class="icon icon-cloud"></i> Responsive Web Design</h4>
        <p>可以放進口袋的雲端教室，結合行動通訊提供全年無休數位內容服務；針對各種尺寸螢幕提供最佳化閱讀效果，隨時使用智慧型手機或平板電腦複習教材，獲得前所未有的學習效果。</p>
    </div>
    <div class="span4">
        <img src="${resource(dir:'images', file:'education.png')}" alt="education" />
        <h4><i class="icon icon-certificate"></i> Certified Academy Program</h4>
        <p>校園課程與專業認證的完美結合；本教學系統的前導計畫每年均獲得良好成效，培育出無數優秀的專業人才，不僅擁有實作能力，也取得企業認可的專業認證。</p>
    </div>
    <div class="span4">
        <img src="${resource(dir:'images', file:'learning_ark.png')}" alt="ark" />
        <h4><i class="icon icon-thumbs-up"></i> Learner's Ark</h4>
        <p>數位學習方舟計畫運用最新科技，致力於發展教學解決方案，領航優秀程式設計人才養成之路，從校園到就業進修課程規劃，研發團隊結合最具公信力的認證機構、產業專家及學者，提供最好的教材與培訓。</p>
    </div>
</div>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title>${course.title}</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div id="menu-container" class="span3 hidden-phone">
            <!--課程單元列表-->
            <g:render template="/course/menu" />
        </div>
        <div id="content-container" class="span9">
            <div class="clearlook-wrapper padding-around justfont">
                <g:if test="${authoring&&params.editor}">
                    <!--切換編輯介面-->
                    <g:render template="course_editor"/>
                </g:if>
                <g:else>
                    <g:render template="course"/>
                </g:else>
            </div>
        </div>
    </div>
</div>
</body>
</html>

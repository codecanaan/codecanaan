<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="schedule.label" /></title>
</head>
<body>
<div class="row">
    <div class="span12">
        <sec:ifAnyGranted roles="ROLE_TEACHER">
            <!--功能清單-->
            <div class="btn-group pull-right">
                <a class="btn dropdown-toggle" data-toggle="dropdown">
                    <i class="icon icon-wrench"></i>
                    <g:message code="default.page.options.label" default="Options" />
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <g:link controller="schedule" action="edit" id="${schedule.id}">
                            <i class="icon icon-edit"></i>
                            <!--修改學習進度-->
                            <g:message code="default.edit.label" default="Delete {0}" args="[message(code: 'schedule.label', default: 'Schedule')]" />
                        </g:link>
                    </li>
                    <li>
                        <g:link controller="schedule" action="delete" id="${schedule.id}" onclick="return confirm('Are you sure???')">
                            <i class="icon icon-remove"></i>
                            <!--刪除學習進度-->
                            <g:message code="default.delete.label" default="Delete {0}" args="[message(code: 'schedule.label', default: 'Schedule')]" />
                        </g:link>
                    </li>
                    <li>
                        <g:link controller="schedule" action="join" id="${schedule.id}">
                            <i class="icon icon-book"></i>
                            <!--加入單元-->
                            <g:message code="default.join.label" default="Join {0}" args="[message(code: 'lesson.label', default: 'Lesson')]" />
                        </g:link>
                    </li>
                    <li>
                        <g:link controller="schedule" action="user" id="${schedule.id}">
                            <i class="icon icon-user"></i>
                            <!--加入使用者-->
                            <g:message code="default.join.label" default="Join {0}" args="[message(code: 'user.label')]" />
                        </g:link>
                    </li>
                </ul>
            </div>
        </sec:ifAnyGranted>

        <div class="page-header">
            <h1>
                <i class="icon icon-tasks"></i>
                ${schedule?.title}
                <small><g:message code="schedule.label" default="Schedule" /></small>
            </h1>
        </div>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th width="30">#</th>
                    <th><g:message code="lesson.title.label" /></th>
                    <th width="100"><g:message code="scheduleLesson.begin.label" /></th>
                    <th width="100"><g:message code="scheduleLesson.end.label" /></th>
                    <th width="100"><g:message code="scheduleLesson.deadline.label" /></th>
                </tr>
            </thead>
            <tbody>
               <g:if test="${!scheduleLessons}">
                    <tr>
                        <td colspan="6"><div style="text-align:center"><g:message code="default.empty.label" /></div></td>
                    </tr>
                </g:if>
                <g:each in="${scheduleLessons}" var="link" status="i">
                    <tr>
                        <td>${i+1}</td>
                        <td>
                            ${link.lesson?.title}
                            <div class="muted"><small>${link.lesson?.course?.title}</small></div>
                            <g:hiddenField name="linkId" value="${link.id}" />
                        </td>
                        <td>${link.begin?.format('yyyy/MM/dd HH:mm:ss')}</td>
                        <td>${link.end?.format('yyyy/MM/dd HH:mm:ss')}</td>
                        <td>${link.deadline?.format('yyyy/MM/dd HH:mm:ss')}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
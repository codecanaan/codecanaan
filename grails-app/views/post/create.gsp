<%@ page import="codecanaan.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:hasErrors bean="${post}">
	<ul class="errors" role="alert">
		<g:eachError bean="${post}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
		</g:eachError>
	</ul>
</g:hasErrors>
<g:form action="save" class="form-horizontal">
	<div class="control-group ${hasErrors(bean: post, field: 'name', 'error')} ">
		<label class="control-label" for="name">
			<g:message code="post.name.label" default="Name" />
			<span class="required-indicator">*</span>
		</label>
		<div class="controls">
			<g:textField name="name" value="${post?.name}" class="input input-medium" />
		</div>
	</div>
	<div class="control-group ${hasErrors(bean: post, field: 'title', 'error')} ">
		<label class="control-label" for="title">
			<g:message code="post.title.label" default="Title" />
			<span class="required-indicator">*</span>
		</label>
		<div class="controls">
			<g:textField name="title" value="${post?.title}" class="input input-xlarge" />
		</div>
	</div>
	<div class="control-group ${hasErrors(bean: post, field: 'content', 'error')} ">
		<label class="control-label" for="title">
			<g:message code="post.content.label" default="Content" />				
		</label>
		<div class="controls">
			<g:textArea name="content" value="${post?.content}" class="input input-xlarge" cols="40" rows="10" />
		</div>
	</div>
	<div class="control-group ${hasErrors(bean: post, field: 'tag', 'error')} ">
		<label class="control-label" for="tag">
			<g:message code="post.tag.label" default="Tag" />
		</label>
		<div class="controls">
			<g:textField name="tag" value="${post?.tag}" class="input input-large" />
		</div>
	</div>
    <div class="control-group ${hasErrors(bean: post, field: 'type', 'error')} required">
	    <label class="control-label" for="type">
		    <g:message code="post.type.label" default="Type" />
		    <span class="required-indicator">*</span>
	    </label>
	    <div class="controls">
		    <g:select name="type" from="${codecanaan.PostType?.values()}" keys="${codecanaan.PostType.values()*.name()}" required="" value="${post?.type?.name()}"/>
	    </div>
    </div>
	<div class="control-group">
		<div class="controls">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			<g:link class="btn">${message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
		</div>
	</div>
</g:form>
</body>
</html>
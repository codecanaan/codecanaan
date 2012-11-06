package codecanaan

import org.springframework.dao.DataIntegrityViolationException

class ContentController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contentList: Content.list(params), contentTotal: Content.count()]
    }

    /**
     * 直接建立內容後回到瀏覽頁面
     */
    def create() {
        def user = springSecurityService.currentUser

        //計算流水號
        def seq = 0
        def lesson = Lesson.get(params.lesson.id)
        if (lesson && lesson.contents) {
            seq = lesson.contents?.size()
        }

        def content = new Content(params)

        //套用預設值
        if (!content.type) {
            content.type = ContentType.TUTORIAL
        }

        //println lesson
        //println seq

        content.title = "${content.type} ${seq+1}"
        content.description = '''Write contents here using **Markdown** syntax.'''

        content.sourceCode = "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n    }\n}\n"
        content.sourceType = SourceType.JAVA
        content.sourcePath = 'Main.java'
        content.partialCode = "public class Main {\n    public static void main(String[] args) {\n        //write here\n    }\n}\n"
        content.answer = 'Hello World'
        content.priority = seq
        content.creator = user

        content.save(flush: true)

        redirect(
            controller: 'course',
            action: 'show',
            id: content.lesson?.course?.id,
            params: [
                lessonId: content.lesson?.id,
                contentId: content.id
            ]
        )
    }

    def save() {
        def content = new Content(params)
        
        if (!content.save(flush: true)) {
            render(view: "create", model: [content: content, lesson: lesson])
            return
        }

        log.info "Link content to lesson: ${lesson}"

        if (lesson) {
            lesson.addToContents(content)
            lesson.save(flush: true)
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'content.label', default: 'Content'), content.id])
        redirect(action: "show", id: content.id)
    }

    /**
     * Ajax 更新資料
     */
    def ajaxSave(Long id) {
        def content = Content.get(id)

        if (content) {
            content.properties = params
            content.save(flush: true)
        }

        render(contentType: 'application/json') {
            [url: createLink(controller: 'course', action: 'show', id: content.lesson?.course?.id, params: [lessonId: content.lesson?.id, contentId: content.id])]
        }
    }

    /**
     * Ajax 更新作答資料
     */
    def ajaxSaveRecord(Long id) {
        def user = springSecurityService.currentUser

        def content = Content.get(id)

        def record = Record.findOrCreateByUserAndContent(user, content)

        if (record) {
            record.properties = params
            record.save(flush: true)
        }

        [record: record]
    }

    def show(Long id) {
        def content = Content.get(id)
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(action: "list")
            return
        }

        [content: content]
    }

    def edit(Long id) {
        def content = Content.get(id)
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(action: "list")
            return
        }

        [content: content]
    }

    def update(Long id, Long version) {
        def content = Content.get(id)
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (content.version > version) {
                content.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'content.label', default: 'Content')] as Object[],
                          "Another user has updated this Content while you were editing")
                render(view: "edit", model: [content: content])
                return
            }
        }

        content.properties = params

        if (!content.save(flush: true)) {
            render(view: "edit", model: [content: content])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'content.label', default: 'Content'), content.id])
        redirect(action: "show", id: content.id)
    }

    /**
     * 刪除內容
     */
    def delete(Long id) {
        def content = Content.get(id)
        
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(controller: 'course')
            return
        }

        def courseId = content.lesson?.course?.id
        def lessonId = content.lesson?.id

        try {
            content.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(controller: 'course', action: 'show', id: courseId, params: [lessonId: lessonId])
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(controller: 'course', action: 'show', id: courseId, params: [lessonId: lessonId, contentId: content.id])
        }
    }

    /**
     * 下載原始碼
     */
    def downloadSource(Long id) {
        def content = Content.get(id)
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(url: '/')
            return
        }

        //fixme: 資料夾斜線處理
        def filename = content.sourcePath?content.sourcePath:'untitled.txt'
        response.addHeader('Content-disposition', "attachment; filename=${filename}")

        render(text: content.sourceCode, contentType:"text/plain", encoding:"UTF-8")
    }
}

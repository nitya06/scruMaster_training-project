import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_iceScrum_projecthome_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/project/home.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
createTagBody(2, {->
createClosureForHtmlPart(2, 3)
invokeTag('captureTitle','sitemesh',4,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',4,[:],2)
printHtmlPart(3)
expressionOut.print(resource(dir: 'css', file: 'bootstrap.css'))
printHtmlPart(4)
expressionOut.print(resource(dir: 'css', file: 'style.css'))
printHtmlPart(5)
expressionOut.print(resource(dir: 'css', file: 'commonDivStyle.css'))
printHtmlPart(6)
expressionOut.print(resource(dir: 'js', file: 'jquery-2.0.3.js'))
printHtmlPart(7)
expressionOut.print(resource(dir: 'js', file: 'datepicker.js'))
printHtmlPart(7)
expressionOut.print(resource(dir: 'js', file: 'bootstrap-datepicker.js'))
printHtmlPart(8)
expressionOut.print(resource(dir: 'js', file: 'angular-flash.js'))
printHtmlPart(9)
expressionOut.print(resource(dir: 'js', file: 'jquery.js'))
printHtmlPart(10)
})
invokeTag('captureHead','sitemesh',46,[:],1)
printHtmlPart(11)
createTagBody(1, {->
printHtmlPart(12)
expressionOut.print(params.sessionToken)
printHtmlPart(13)
expressionOut.print(params.username)
printHtmlPart(14)
expressionOut.print(params.username)
printHtmlPart(15)
expressionOut.print(params.email)
printHtmlPart(16)
expressionOut.print(params.sessionToken)
printHtmlPart(17)
expressionOut.print(resource(dir: 'gspPages', file: 'myAccount.html'))
printHtmlPart(18)
expressionOut.print(resource(dir: 'gspPages', file: 'dashboardFetch.html'))
printHtmlPart(19)
expressionOut.print(resource(dir: 'gspPages', file: 'releaseBoard.html'))
printHtmlPart(20)
expressionOut.print(resource(dir: 'gspPages', file: 'sprintBoard.html'))
printHtmlPart(21)
expressionOut.print(resource(dir: 'gspPages', file: 'taskBoard.html'))
printHtmlPart(22)
})
invokeTag('captureBody','sitemesh',1784,[:],1)
printHtmlPart(23)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1382684675000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'none'
public static final String TAGLIB_CODEC = 'none'
}

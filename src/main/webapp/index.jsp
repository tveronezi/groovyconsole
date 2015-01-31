<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<html lang="en">
<link href="<c:url value='/webjars/bootstrap/3.3.1/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/webjars/bootstrap/3.3.1/css/bootstrap-theme.min.css'/>" rel="stylesheet">
<link href="<c:url value='/webjars/codemirror/4.8/lib/codemirror.css'/>" rel="stylesheet">
<link href="<c:url value='/webjars/jquery-ui/1.11.2/jquery-ui.min.css'/>" rel="stylesheet">
<link href="<c:url value='/webjars/codemirror/4.8/addon/hint/show-hint.css'/>" rel="stylesheet">
<link href="<c:url value='/app.css'/>" rel="stylesheet">
<script src="<c:url value='/webjars/modernizr/2.8.3/modernizr.min.js'/>"></script>
<script src="<c:url value='/webjars/jquery/2.1.1/jquery.min.js'/>"></script>
<script src="<c:url value='/webjars/jquery-ui/1.11.2/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/webjars/bootstrap/3.3.1/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/webjars/codemirror/4.8/lib/codemirror.js'/>"></script>
<script src="<c:url value='/webjars/codemirror/4.8/addon/hint/show-hint.js'/>"></script>
<script src="<c:url value='/webjars/codemirror/4.8/addon/hint/anyword-hint.js'/>"></script>
<script src="<c:url value='/webjars/codemirror/4.8/mode/groovy/groovy.js'/>"></script>
<head>
    <meta charset="utf-8">
    <title>Groovy Console</title>
</head>
<body>
<form target="_blank" action="scripting" class="script-form" method="post">
    <textarea id="script" name="script"></textarea>
    <input class="btn submit-btn" type="submit" value="Submit">
</form>
<script>
    $(document).ready(function () {
        if (Modernizr.localstorage && localStorage.mmas_code) {
            $('#script').val(localStorage.mmas_code);
        }
        var editor = CodeMirror.fromTextArea(document.getElementById("script"), {
            lineNumbers: true,
            matchBrackets: true,
            extraKeys: {"Ctrl-Space": "autocomplete"},
            mode: "text/x-groovy"
        });
        if (Modernizr.localstorage) {
            editor.on("change", function (target, changeObj) {
                localStorage.mmas_code = target.getValue();
            });
        }
        var browser = $(document);
        editor.setSize(browser.width(), browser.height() - 50);
        $(window).on('resize', function () {
            editor.setSize(browser.width(), browser.height() - 50);
        });
    });
</script>
</body>
</html>

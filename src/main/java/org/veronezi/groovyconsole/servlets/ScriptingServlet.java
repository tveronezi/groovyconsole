package org.veronezi.groovyconsole.servlets;

import javax.script.ScriptContext;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.script.SimpleScriptContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

@WebServlet(name = "Scripting", urlPatterns = "/scripting")
public class ScriptingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        execute(req, resp, req.getParameter("script"));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        execute(req, resp, req.getParameter("script"));
    }

    private void execute(HttpServletRequest req, HttpServletResponse resp, String script) throws ServletException, IOException {
        if (script != null && !"".equals(script.trim())) {
            ScriptEngineManager factory = new ScriptEngineManager();
            Writer sw = resp.getWriter();
            PrintWriter pw = new PrintWriter(sw);
            ScriptEngine engine = factory.getEngineByName("groovy");
            ScriptContext scriptContext = new SimpleScriptContext();
            scriptContext.setWriter(pw);
            scriptContext.setErrorWriter(pw);
            scriptContext.setAttribute("req", req, ScriptContext.ENGINE_SCOPE);
            scriptContext.setAttribute("resp", resp, ScriptContext.ENGINE_SCOPE);
            resp.setContentType("text/plain");
            try {
                engine.eval(script, scriptContext);
            } catch (ScriptException e) {
                throw new ServletException(e);
            }
        }
    }

}


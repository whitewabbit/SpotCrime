package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import bean.User;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Spot Crime</title>\n");
      out.write("        <style>\n");
      out.write("\n");
      out.write("            * {\n");
      out.write("                padding: 0;\n");
      out.write("                margin: 0;\n");
      out.write("                font: 12px Arial;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            body {\n");
      out.write("                background: url('assets/img/bg.jpg');\n");
      out.write("                background-size: 100% auto; \n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #loginContainer {\n");
      out.write("                position: absolute;\n");
      out.write("                background: #FFF;\n");
      out.write("                width: 250px;\n");
      out.write("                height: 215px;\n");
      out.write("                right: 17%;\n");
      out.write("                top: 0;\n");
      out.write("                bottom: 0;\n");
      out.write("                margin: auto 0;\n");
      out.write("                box-shadow: 1px 3px 5px #000;\n");
      out.write("                padding: 45px 20px 20px;\n");
      out.write("            }\n");
      out.write("            #loginContainer h1 { \n");
      out.write("                font: 16px Arial;\n");
      out.write("                color: rgb(255,0,100);\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            #loginContainer p {\n");
      out.write("                font: italic 12px Arial;\n");
      out.write("                color: rgb(80,80,80);\n");
      out.write("                text-align: center;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("            #loginContainer form {\n");
      out.write("                width: 100%;\n");
      out.write("                height: 100%;\n");
      out.write("            }\n");
      out.write("            #loginContainer form input {\n");
      out.write("                background: rgb(220,220,220);\n");
      out.write("                width: calc(100% - 20px);\n");
      out.write("                padding: 10px 10px 8px;\n");
      out.write("                margin-bottom: 10px;\n");
      out.write("                font: 14px Arial;\n");
      out.write("                border: none;\n");
      out.write("            }\n");
      out.write("            #loginButton{\n");
      out.write("                background: rgb(255,0,100) !important;\n");
      out.write("                color: #FFF;\n");
      out.write("                width: 100% !important;\n");
      out.write("                padding: 10px 0 7px !important;\n");
      out.write("                font: 16px Arial;\n");
      out.write("                border: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("                margin-top: 10px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        ");

            if(session.getAttribute("name") != null){
                response.sendRedirect("home.jsp");
            }
            if(request.getAttribute("message") != null){
                String status = request.getAttribute("status").toString();
                if(status.equals("true")){
                    User user = (User)request.getAttribute("user");
                    session.setAttribute("name", user.getName());
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("location", user.getLocation());
                    response.sendRedirect("home.jsp");
                }
            }
        
      out.write("  \n");
      out.write("        \n");
      out.write("        <div id=\"loginContainer\">\n");
      out.write("            <h1>Login Account</h1>\n");
      out.write("            <p>Digos City Community Crime Map</p>\n");
      out.write("            <form action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/LoginProcess\" method=\"POST\">\n");
      out.write("                <input type=\"text\" name=\"username\" placeholder=\"Email or Username\" required autocomplete=\"off\">\n");
      out.write("                <input type=\"password\" name=\"password\" placeholder=\"Password\" required autocomplete=\"off\">\n");
      out.write("                <br>\n");
      out.write("                <input id=\"loginButton\" type=\"submit\" value=\"Continue\">\n");
      out.write("                \n");
      out.write("                ");
 if(request.getAttribute("message") != null){ 
                    String status = request.getAttribute("status").toString();
                    String message = request.getAttribute("message").toString();
                    if(status.equals("false")){ 
      out.write("\n");
      out.write("                        <br>\n");
      out.write("                        <p> ");
      out.print( message );
      out.write(" </p>\n");
      out.write("                ");
    }
                }
      out.write("\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("                      \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

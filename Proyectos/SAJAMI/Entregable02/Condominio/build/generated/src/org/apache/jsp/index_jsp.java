package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <title>Inicio</title>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "head.jsp", out, false);
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!--Menú-->\n");
      out.write("        \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menu.jsp", out, false);
      out.write("\n");
      out.write("        <!--Fin del Menú-->\n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <div class=\"container\">\n");
      out.write("        <div class=\"row main-low-margin text-center\">\n");
      out.write("            <div class=\"col-md-4 col-sm-4\">\n");
      out.write("                <div class=\"circle-body\"><i class=\"fa fa-camera fa-5x  icon-set\"></i></div>\n");
      out.write("                <h3>TESTED DESIGN</h3>\n");
      out.write("                <p>\n");
      out.write("                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-4 col-sm-4\">\n");
      out.write("                <div class=\"circle-body\"><i class=\"fa fa-dollar fa-5x  icon-set\"></i></div>\n");
      out.write("                <h3>SAVE YOUR MONEY</h3>\n");
      out.write("                <p>\n");
      out.write("                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-4 col-sm-4\">\n");
      out.write("                <div class=\"circle-body\"><i class=\"fa fa-envelope fa-5x  icon-set\"></i></div>\n");
      out.write("                <h3>WELL DOCUMENTED</h3>\n");
      out.write("                <p>\n");
      out.write("                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row main-low-margin \">\n");
      out.write("\n");
      out.write("            <div class=\"col-md-8 col-sm-8\">\n");
      out.write("                <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h3>\n");
      out.write("                <p>\n");
      out.write("                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                </p>\n");
      out.write("                <p>\n");
      out.write("                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"col-md-4 col-sm-4 text-center\">\n");
      out.write("                <img class=\"img-circle\" src=\"assets/img/person.png\">\n");
      out.write("                <h3>Lorem ipsum dolor</h3>\n");
      out.write("                <h4>Lorem ipsum dolor sit</h4>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row main-low-margin \">\n");
      out.write("            <div class=\"col-md-3 col-sm-3 text-center\">\n");
      out.write("                <i class=\"fa fa-desktop fa-5x\"></i>\n");
      out.write("                <h3>TESTED DESIGN</h3>\n");
      out.write("                <p>\n");
      out.write("                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-3 col-sm-3 text-center\">\n");
      out.write("                <i class=\"fa fa-comments-o fa-5x \"></i>\n");
      out.write("                <h3>READY TO USE</h3>\n");
      out.write("                <p>\n");
      out.write("                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-6 col-sm-6\">\n");
      out.write("                <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h3>\n");
      out.write("                <p>\n");
      out.write("                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n");
      out.write("                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                        Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.\n");
      out.write("                </p>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    <div class=\"space-bottom\"></div>\n");
      out.write("\n");
      out.write("        \n");
      out.write("<div class=\"content\">\n");
      out.write("</div>\n");
      out.write("        \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("        \n");
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*"
         import="java.io.*" %>

<%
  PrintWriter writer = response.getWriter();
  String noteName = request.getParameter("noteName");
  String note = request.getParameter("note");

  try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evernoteDB",
                "evernoteDB", "0633739768z");

        Statement st = con.createStatement();

        st.executeUpdate("INSERT INTO note (noteName, note) VALUES ('" + noteName + "','" + note + "')");

        response.sendRedirect("/userNotes.jsp");
      }
          catch(ClassNotFoundException e)
            {
              writer.println("Couldn't load database driver: " + e.getMessage());
            }
          catch(SQLException e)
            {
              writer.println("SQLException caught: " + e.getMessage());
            }
          catch (Exception e)
            {
              writer.println(e);
            }
    %>

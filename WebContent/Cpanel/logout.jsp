     <%
     // for checking the session is available or not, if not available it will throw exception, "Session already invalidated."
      if (true) {
        session.invalidate();
        response.sendRedirect("index");
      }
     %>
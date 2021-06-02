package com.okky.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; cahrset=UTF-8");

		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length() + 1);

		Action action = null;
		ActionForward forward = null;

		Properties prop = new Properties();

		FileInputStream fis = new FileInputStream(
				"C:\\Users\\SOS\\git\\jspTeamProject\\JspProject\\src\\com\\okky\\controller\\mapping.properties");
		prop.load(fis);
		String value = prop.getProperty(command);

		if (value.substring(0, 7).equals("execute")) {
			StringTokenizer st = new StringTokenizer(value, "|");
			String url_1 = st.nextToken();
			String url_2 = st.nextToken();

			try {
				Class url = Class.forName(url_2);

				action = (Action) url.newInstance();

				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(value);
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}
}

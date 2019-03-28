package com.javalec.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class joinOk
 */
@WebServlet("/joinOk")
public class joinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	//.. �����Ϳ���� ������ ����� ���� ���� ����
	private Connection conn = null;
	private Statement stmt = null;
	private String name, id, pw, gender;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //.. doGet������� �����͸� ���۹޾��� �� actionDo�޼ҵ�� ����
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			actionDo(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	 //.. doPost������� �����͸� ���۹޾��� �� actionDo�޼ҵ�� ����
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			actionDo(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
		
		//.. �ѱ�ó���� ���� ����
		request.setCharacterEncoding("UTF-8");
		
		name = request.getParameter("uname");
		id = request.getParameter("uid");
		pw = request.getParameter("upass");
		gender = request.getParameter("gender");
		
		//.. member1 ���̺� ���۹��� �����͸� ����
		String query = "insert into member1 values('"+name+"','"+id+"','"+pw+"','"+gender+"')";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:SDUDB", "scott", "tiger");
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(query);
			
			//.. �����ͺ��̽��� �����Ͱ� �������� �Էµƴٸ� i�� 1�� �����Ѵ�
			if(i==1) {
				System.out.println("insert success");
				response.sendRedirect("joinResult.jsp");
			} else {
				System.out.println("insert fail");
				response.sendRedirect("join.jsp");
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}

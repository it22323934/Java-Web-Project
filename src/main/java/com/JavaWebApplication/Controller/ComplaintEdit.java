package com.JavaWebApplication.Controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.xmlbeans.impl.tool.Extension.Param;

import com.JavaWebApplication.Beans.Complaint;
import com.JavaWebApplication.Beans.MenuItem;
import com.JavaWebApplication.Model.DataHandlerComplaint;
import com.JavaWebApplication.Model.DataHandlerMenuItem;

/**
 * Servlet implementation class ComplaintEdit
 */
public class ComplaintEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplaintEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		boolean edit;
		RequestDispatcher rd;
		int ComplaintID=Integer.parseInt(request.getParameter("complaintId"));
		int OrderID=Integer.parseInt(request.getParameter("orderId"));
		int UserID=Integer.parseInt(request.getParameter("userId"));
		String Reason=request.getParameter("reason");
		String OtherReason=request.getParameter("otherReason");
		String Status = request.getParameter("status");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = request.getParameter("date");
		Date date = null;
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Complaint comp = new Complaint();
		comp.setComplaintId(ComplaintID);
		comp.setOrderId(OrderID);
		comp.setUserId(UserID);
		comp.setReason(Reason);
		comp.setOtherReason(OtherReason);
		comp.setStatus(Status);
		comp.setTimeStamp(date);
		DataHandlerComplaint DHC =new DataHandlerComplaint();
		edit=DHC.editComplaint(comp);
		if(edit) {
			System.out.println("executeUpdate");
			  request.setAttribute("update", "success");
			  
			  rd=request.getRequestDispatcher("ComplaintEdit.jsp");
		}else {
			System.out.println("Update terminated");
			request.setAttribute("update", "error");
			rd=request.getRequestDispatcher("ComplaintEdit.jsp");
		}
		rd.forward(request, response);
	}

}

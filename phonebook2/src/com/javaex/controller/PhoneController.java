package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.PhoneDao;
import com.javaex.vo.PersonVo;


@WebServlet("/pbc")
public class PhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

//controller 파일이 모든 요청을 받기떄문에 웹페이지 요청을 controller파일로 해야한다.
//list.jsp파일은 내부에서 돌기떄문에 model1번처럼 실행하면 오류가 난다.
//만약 경로인 web-inf밑의 list.jsp파일을 url에 넣어도 내부로 보여주기위해 막아놨기 떄문에 위의 설명대로 오류가 남.
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/pbc --> doGet() 테스트");
		/*
  		PhoneDao pd = new PhoneDao();		
		List<PersonVo> PL = pd.getPersonList();
		System.out.println(PL.toString());
		//de연결 테스트
		 
 */	
	
		
		//리스트
		String action = request.getParameter("action");
		
		if("list".equals(action)) {
			System.out.println("list");
			PhoneDao pd = new PhoneDao();
			List<PersonVo> PL = pd.getPersonList();

			//생성후 확인은 웹창에 뒤에 값넣어주기
			//list.jsp파일 생성후 model1처럼 웹창에 테스트.
			
			
		
			//데이터 리퀘스트에 추가
			request.setAttribute("personlist",PL);
			
			//포워드
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/list.jsp");
			rd.forward(request, response);
			
			
		}
	
		//등록
		else if("wform".equals(action)) {
		//포워드
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/WriteForm.jsp");
			rd.forward(request, response);
			
		}
		else if("insert".equals(action)) {
			
			System.out.println("번호저장");
			
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			PersonVo pv = new PersonVo(name,hp,company);
			PhoneDao pd = new PhoneDao();
			pd.personInsert(pv);
			response.sendRedirect("/pb2/pbc?action=list");
			//포워드는 파일의 위치를 적어 줬지만 redirect는 주소(url)를 적어준다.
		}
		
		else if("uform".equals(action)) {

			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/UpdateForm.jsp");
			rd.forward(request, response);
		}
		
		else if("update".equals(action)) {
			System.out.println("수정 완료.");
			int personId = Integer.parseInt(request.getParameter("personid"));
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			
			PersonVo pv = new PersonVo(personId,name,hp,company);
			PhoneDao pd = new PhoneDao();
			pd.personUpdate(pv);
			response.sendRedirect("/pb2/pbc?action=list");
		}
		
		else if("delete".equals(action)) {
			int personId = Integer.parseInt(request.getParameter("personid"));
			PhoneDao phonedao = new PhoneDao();
			phonedao.personDelete(personId);
			response.sendRedirect("/pb2/pbc?action=list");
		}
		
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

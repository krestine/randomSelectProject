package ezo.mp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ezo.mp.domain.Board;
import ezo.mp.domain.Users;
import ezo.mp.service.BoardService;
import ezo.mp.service.BoardServiceImpl;
import ezo.mp.service.UserService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.POST)
	public String boardWrite(Board board, Model model) {

		System.out.println("게시글 등록");

		if (board.getUserId() == null) {
			model.addAttribute("errorMessage", "로그인을 해주세요");
			
			return "boardError";
		} 
		
		contextViewtoDb(board);
		System.out.println(board);
		boardService.insertBoard(board);
		model.addAttribute("boards", boardService.getAllBoard());
		return "boardList";
	}

	@RequestMapping("/boardWriteForm.do")
	public String BoardWriteForm(Model model, HttpServletRequest request) {
		System.out
				.println("UserController -> boardWriteForm.do -> /boardWriteForm.jsp");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("users");
		if (user != null) {
			return "boardWriteForm";
		}
		model.addAttribute("errorMessage", "로그인을 해주세요");
		return "boardError";
	}

	@RequestMapping(value = "/boardUpdate.do", method = RequestMethod.POST)
	public String BoardUpdate(Board board, Model model) {
		System.out.println("boardUpdate 메소드 실행");
		System.out.println("boardUpdate의 패러미터 ::" + board);
		System.out.println("업데이트 쿼리 실행 전");

		contextViewtoDb(board);

		boardService.updateBoard(board);
		System.out.println("업데이트 쿼리 실행 전");
		model.addAttribute("boards", boardService.getAllBoard());
		return "boardList";
	}

	@RequestMapping(value = "/boardUpdateForm.do", method = RequestMethod.POST)
	public String BoardUpdateForm(Model model, int boardNumber) {
		System.out.println("boardUpateForm 메소드 실행");
		System.out.println("boardUpateForm의 패러미터 ::" + boardNumber);
		Board board = boardService.getBoard(boardNumber);
		model.addAttribute("board", board);
		return "boardUpdateForm";
	}

	@RequestMapping("/boardDelete.do")
	public String BoardDelete(Model model, int boardNumber) {
		System.out
				.println("BoardController -> boardDelete.do -> /boardList.jsp");
		boardService.deleteBoard(boardNumber);

		model.addAttribute("boards", boardService.getAllBoard());
		return "boardList";
	}

	@RequestMapping("/boardList.do")
	public String BoardList(Model model) {

		model.addAttribute("boards", boardService.getAllBoard());
		return "boardList";
	}
	
	@RequestMapping("/myBoardList.do")
	public String myBoardList(Model model ,String userId) {
		
		if (userId == null || userId.trim()=="") {
			model.addAttribute("errorMessage", "로그인을 해주세요");
			
			return "boardError";
		}
		
		
		model.addAttribute("boards", boardService.myBoardList(userId));
		
		return "boardList";
	}
	
	
	
	@RequestMapping("/boardContext.do")
	public String BoardContext(Model model, int boardNumber) {
		System.out
				.println("BoardController -> boardContext.do -> /boardContext.jsp");
		Board board = boardService.getBoard(boardNumber);
		
		contextDbtoView(board);

		System.out.println(board);
		model.addAttribute("board", board);

		return "boardContext";
	}

	public String contextViewtoDb(String dbContext) {
		dbContext = dbContext.replaceAll("'", "`");
		return dbContext;
	}

	public Board contextViewtoDb(Board board) {
		String dbContext = board.getQaContext();
		dbContext = dbContext.replaceAll("'", "`");
		board.setQaContext(dbContext);
		return board;
	}

	public String contextDbtoView(String viewContext) {
		viewContext = viewContext.replaceAll("`", "'")
				.replaceAll("\r\n", "<br>").replaceAll("\u0020", "&nbsp;");
		/*
		 * context = context.replaceAll("\r\n", "<br>"); context =
		 * context.replaceAll("\u0020", "&nbsp;");
		 */
		return viewContext;
	}

	public Board contextDbtoView(Board board) {
		String viewContext = board.getQaContext();
		viewContext = viewContext.replaceAll("`", "'")
				.replaceAll("\r\n", "<br>").replaceAll("\u0020", "&nbsp;");
		board.setQaContext(viewContext);
		/*
		 * context = context.replaceAll("\r\n", "<br>"); context =
		 * context.replaceAll("\u0020", "&nbsp;");
		 */
		return board;
	}

}
/*
 * boardWriteForm boardWrite boardUpdate boardDelete boardList boardContext
 */

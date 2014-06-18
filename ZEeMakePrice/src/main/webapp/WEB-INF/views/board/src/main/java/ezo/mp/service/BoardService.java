package ezo.mp.service;

import java.util.List;

import ezo.mp.domain.Board;

public interface BoardService {
	List<Board> getAllBoard();

	void insertBoard(Board board);

	Board getBoard(int boardNumber);

	void updateBoard(Board board);

	void deleteBoard(int boardNumber);
	
	List<Board> myBoardList(String userid);
}

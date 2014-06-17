package ezo.mp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ezo.mp.dao.BoardMapper;
import ezo.mp.domain.Board;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<Board> getAllBoard() {
		// TODO Auto-generated method stub
		return boardMapper.getAllBoard();
	}

	@Override
	@Transactional
	public void insertBoard(Board board) {
		// TODO Auto-generated method stub
		boardMapper.insertBoard(board);
	}

	@Override
	public Board getBoard(int boardNumber) {
		// TODO Auto-generated method stub
		return boardMapper.getBoard(boardNumber);
	}

	@Override
	@Transactional
	public void updateBoard(Board board) {
		
		boardMapper.updateBoard(board);
		
	}

	@Override
	@Transactional
	public void deleteBoard(int boardNumber) {
		
		boardMapper.deleteBoard(boardNumber);
		
	}

	@Override
	public List<Board> myBoardList(String userid) {
		
		return boardMapper.myBoardList(userid);
	}

}

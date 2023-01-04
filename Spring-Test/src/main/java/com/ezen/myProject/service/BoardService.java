package com.ezen.myProject.service;

import java.util.List;

import com.ezen.myProject.domain.BoardDTO;
import com.ezen.myProject.domain.BoardVO;
import com.ezen.myProject.domain.PagingVO;
import com.ezen.myProject.domain.UserVO;

public interface BoardService {

	int register(BoardVO bvo);

	List<BoardVO> getList();

	BoardVO getDetail(int bno);

	int modify(BoardVO bvo, UserVO user);

	int remove(int bno, UserVO user);

	List<BoardVO> getList(PagingVO pvo);

	int getTotalCount();

	int getTotalCount(PagingVO pvo);

	int register(BoardDTO bdto);

	BoardDTO getDetailFile(int bno);

	int modify(BoardDTO boardDTO, UserVO user);

}

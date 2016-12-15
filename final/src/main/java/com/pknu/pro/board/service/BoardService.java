package com.pknu.pro.board.service;

import org.springframework.ui.Model;

public interface BoardService {
	public String list(String pageNum, Model model);
}

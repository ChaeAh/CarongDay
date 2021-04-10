package com.project.boardproject.ad.service.impI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.boardproject.ad.service.AdService;


/*
 *  @ClassName : AdServiceimpI
 *  @Description :  
 *  @Author : 김채아
 *  @Since : 2019.07.24
 *  @Version : 1.0
 */

@Service
public class AdServiceimpI implements AdService {

	@Autowired
	public AdDAO adDAO;
	
}

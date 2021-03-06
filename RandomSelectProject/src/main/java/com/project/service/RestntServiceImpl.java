package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dao.RestntMapper;
import com.project.domain.LatLngDTO;
import com.project.domain.RestntDTO;
import com.project.domain.SettingDTO;

@Service
public class RestntServiceImpl implements RestntService {

	@Autowired
	RestntMapper restntMapper;

	@Override
	public List<RestntDTO> getRestntList() {
		// TODO Auto-generated method stub
		return restntMapper.getRestntList();
	}
	@Transactional
	@Override
	public void dropRestntById(String restntId) {
		restntMapper.dropRestntById(restntId);

	}
	@Transactional
	@Override
	public void setRestntById(RestntDTO restntDto) {
		restntMapper.setRestntById(restntDto);

	}
	@Transactional
	@Override
	public void putRestnt(RestntDTO restntDto) {
		restntMapper.putRestnt(restntDto);

	}

	@Override
	public RestntDTO getRestntInfoById(String restntId) {

		return restntMapper.getRestntInfoById(restntId);
	}

	@Override
	public List<RestntDTO> getRestntListByAddressCode(String addressCode) {
		// TODO Auto-generated method stub
		return restntMapper.getRestntListByAddr(addressCode);
	}

	// 히원 : 식당하나
	@Override
	public RestntDTO getRestnt(String restntId) {

		return restntMapper.getRestnt(restntId);
	}

	
	
	// 회원: 식당 상세정보
	@Override
	public RestntDTO getRestntInfoByRestntId(String restntId) {
		// TODO Auto-generated method stub
		return restntMapper.getRestntInfoByRestntId(restntId);
	}


	// 식당 추가 : id 지정 로직에 필요: 해당 지역의 마지막으로 등록된 식당의 아이디 값 가져오기
	@Override
	public String getLastRestntId(RestntDTO restntDto) {
		// TODO Auto-generated method stub
		return restntMapper.getLastRestntId(restntDto);
	}
	
	//식당 추가 : id 지정 로직에 필요: 해당 지역의 지역 코드 불러오기
	@Override
	public String getAdressCode(RestntDTO restntDto) {
		// TODO Auto-generated method stub
		return restntMapper.getAdressCode(restntDto);
	}
	@Override
	public List<RestntDTO> getEvalRestntListByMateId(RestntDTO restntDto) {
		// TODO Auto-generated method stub
		return restntMapper.getEvalRestntListByMateId(restntDto);
	}
	
	@Override
	public Integer restntListTotalCount(RestntDTO restntDto) {
		// TODO Auto-generated method stub
		return restntMapper.restntListTotalCount(restntDto);
	}
	
	@Override
	public List<RestntDTO> restntListPaging(RestntDTO restntDto) {
		// TODO Auto-generated method stub
		return restntMapper.restntListPaging(restntDto);
	}
	@Override
	public List<RestntDTO> getRestntListByAddr(RestntDTO restntDto) {
		// TODO Auto-generated method stub
		return restntMapper.getRestntListByAddr(restntDto);
	}
	@Override
	public List<RestntDTO> getRestntFullAddress(RestntDTO restntDto) {
		// TODO Auto-generated method stub
		return restntMapper.getRestntFullAddress(restntDto);
	}
	
	@Override
	public List<RestntDTO> getRestntListByAdress(RestntDTO restntDto) {
		return restntMapper.getRestntListByAdress(restntDto);
	}
	
	@Transactional
	@Override
	public void setRestntLocationInfo(RestntDTO restntDto) {
		restntMapper.setRestntLocationInfo(restntDto);
		
	}
	@Override
	public List<RestntDTO> getRestntListByAdress2(RestntDTO restntDto) {
		return restntMapper.getRestntListByAdress2(restntDto);
	}
	@Override
	public List<RestntDTO> getRestntListByLatLng(LatLngDTO latLngDto) {
		return restntMapper.getRestntListByLatLng(latLngDto);
	}
	

}

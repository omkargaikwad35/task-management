package com.taskmanagement.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskmanagement.dao.MastersDao;
import com.taskmanagement.model.Masters;
@Service
public class MastersServicesImpl implements MastersServices{
	@Autowired
	private MastersDao mastersDao;

	@Override
	public List<Masters> getMasters() {
		
		return this.mastersDao.findAll();
	}

	@Override
	public Masters getMasters(Integer id) {
		Optional<Masters> findById = this.mastersDao.findById(id);
		Masters masters=null;
		if(findById.isPresent()) {
			masters=findById.get();
		}else
		{
			throw new RuntimeException("Data not found::"+id);
		}
		return masters;
		
	}

	@Override
	public String saveMasters(Masters masters) {
		this.mastersDao.save(masters);
		return "Data Added";
	}

	@Override
	public String deleteMasters(Integer id) {
		this.mastersDao.deleteById(id);
		return "Data deleted..";
	}

	
	

}

package com.example.ssm_springbootx.service;

import com.example.ssm_springbootx.dao.TrainingDao;
import com.example.ssm_springbootx.model.Training;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TrainingService {
    @Resource
    private TrainingDao trainingDao;

    public List<Training> getTrainings(Training training) {


        return trainingDao.getTrainings(training);
    }
}

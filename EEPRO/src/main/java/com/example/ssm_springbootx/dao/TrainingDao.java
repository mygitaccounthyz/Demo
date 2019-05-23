package com.example.ssm_springbootx.dao;

import com.example.ssm_springbootx.model.Training;

import java.util.List;

public interface TrainingDao {
    boolean addTraining(Training training);
    boolean deleteTraining(Training training);
    boolean updateTraining(Training training);
    Training getTraining(Training training);
    List<Training> getTrainings(Training training);
}

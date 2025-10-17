package com.example.portfolio.service;


import com.example.portfolio.model.Project;
import com.example.portfolio.repository.ProjectRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProjectService {

    private final ProjectRepository repository;

    public ProjectService(ProjectRepository repository) {
        this.repository = repository;
        repository.findAll();
    }

    public List<Project> getAllProjects() {
    	return repository.findAll();
    }
}

package com.example.portfolio;

import com.example.portfolio.model.Project;
import com.example.portfolio.repository.ProjectRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataInitialiser implements CommandLineRunner {

    private final ProjectRepository repository;

    public DataInitialiser(ProjectRepository repository) {
        this.repository = repository;
    }

    @Override
    public void run(String... args) {
        repository.save(new Project(
                "Socket Programming",
                "A Simple Java Client Server Communication programming",
                "https://github.com/Ali7223/javasocketprogramming",
                "https://yourname.dev"
        ));

        repository.save(new Project(
                "Portfolio Website",
                "My personal portfolio built with Spring Boot and React",
                "https://github.com/Ali7223/portfolio-backend",
                null
        ));
        
        repository.save(new Project(
                "Portfolio Frontend",
                "portfolio project frontend",
                "https://github.com/Ali7223/portfolio-frontend",
                null
        ));
        repository.save(new Project(
                "JWT - Authentication & Authorization",
                "Grant Access to different api only to the Authorised Users",
                "https://github.com/Ali7223/Jwt-Authentication-Authorisation",
                null
        ));
    }
}

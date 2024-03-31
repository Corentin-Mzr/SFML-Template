#pragma once

#include <iostream>
#include <SFML/Graphics.hpp>

// Simple Application class to run SFML program
class App
{
public:
    App(const std::string &title = "SFML Template",
        const unsigned &width = 800,
        const unsigned &height = 800);
    ~App();

    void run();

private:
    sf::RenderWindow window;
    unsigned width;
    unsigned height;

    sf::CircleShape circle;

    void handle_events();
    void clear();
    void draw();
    void display();
};
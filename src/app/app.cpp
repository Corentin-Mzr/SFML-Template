#include "app.hpp"

// Basic constructor
App::App(const std::string &title, const unsigned &width, const unsigned &height) : window(sf::VideoMode(width, height), title)
{
    this->width = width;
    this->height = height;

    circle.setRadius(100.f);
    circle.setOrigin(sf::Vector2f(100.f, 100.f));
    circle.setPosition(sf::Vector2f(width / 2, height / 2));
    circle.setFillColor(sf::Color::Green);
}

// Destructor
App::~App()
{
}

// Handle application running
void App::run()
{
    while (window.isOpen())
    {
        handle_events();
        clear();
        draw();
        display();
    }
}

// Basic events
void App::handle_events()
{
    sf::Event event;

    while (window.pollEvent(event))
    {
        if (event.type == sf::Event::Closed)
            window.close();

        if (event.type == sf::Event::Resized)
        {
            // Get the new size of the window
            const sf::Vector2u size = window.getSize();

            // Calculate the new position of the object to keep it centered
            const sf::Vector2f circle_pos = circle.getPosition();
            const float ratio_w = circle_pos.x / static_cast<float>(width);
            const float ratio_h = circle_pos.y / static_cast<float>(height);
            sf::Vector2f new_pos(size.x * ratio_w, size.y * ratio_h);
            circle.setPosition(new_pos);

            // Update the view
            const sf::FloatRect visibleArea(0, 0, event.size.width, event.size.height);
            window.setView(sf::View(visibleArea));
            width = size.x;
            height = size.y;
        }
    }
}

// Clear the window
void App::clear()
{
    window.clear();
}

// Draw elements on screen
void App::draw()
{
    window.draw(circle);
}

// Update frame
void App::display()
{
    window.display();
}
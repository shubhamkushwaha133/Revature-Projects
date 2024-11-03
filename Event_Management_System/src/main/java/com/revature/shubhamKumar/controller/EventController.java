package com.revature.shubhamKumar.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.revature.shubhamKumar.model.Attendee;
import com.revature.shubhamKumar.model.Event;
import com.revature.shubhamKumar.model.Venue;
import com.revature.shubhamKumar.service.EventService;
import com.revature.shubhamKumar.service.VenueService;

@Controller
@RequestMapping("/events")
public class EventController {

    @Autowired
    private EventService eventService;
    
    @Autowired
    private VenueService venueService;

    @GetMapping
    public String listEvents(Model model) {
        List<Event> events = eventService.findAllEvents();
        model.addAttribute("events", events);
        return "events";
    }

    // Add event form with venues for selection
    @GetMapping("/add")
    public String addEventForm(Model model) {
        List<Venue> venues = venueService.findAllVenues(); // Fetch all venues
        model.addAttribute("venues", venues);              // Pass venues to model
        model.addAttribute("event", new Event());          // Pass new empty event
        return "addEvent";                                // Return the form
    }

    @PostMapping("/add")
    public String saveEvent(@ModelAttribute Event event, @RequestParam("venueId") Long venueId) {
        Venue venue = venueService.findVenueById(venueId); // Fetch the venue from the database
        if (venue != null) {
            event.setVenue(venue); // Set the venue in the event object
        }
        eventService.saveEvent(event); // Save the event
        return "redirect:/events";
    }

    @GetMapping("/edit/{id}")
    public String editEventForm(@PathVariable Long id, Model model) {
        Event event = eventService.findEventById(id); // Fetch event by ID
        List<Venue> venues = venueService.findAllVenues(); // Fetch all venues
        model.addAttribute("event", event); // Add the event object to the model
        model.addAttribute("venues", venues); // Add the list of venues to the model
        return "editEvent"; // Return the JSP page for editing
    }



    @PostMapping("/edit/{id}")
    public String updateEvent(@PathVariable Long id, @ModelAttribute Event event, @RequestParam("venueId") Long venueId) {
        Venue venue = venueService.findVenueById(venueId);  // Fetch the venue from the database
        if (venue != null) {
            event.setVenue(venue);  // Set the updated venue
        }
        event.setId(id);
        eventService.saveEvent(event);  // Save updated event
        return "redirect:/events";
    }

    @GetMapping("/delete/{id}")
    public String deleteEvent(@PathVariable Long id) {
        eventService.deleteEvent(id);
        return "redirect:/events";
    }
    
    
    @GetMapping("/upcoming")
    public String listUpcomingEvents(Model model) {
        List<Event> allEvents = eventService.findAllEvents();  // Fetch all events

        // Filter events to include only those with dates in the future
        List<Event> upcomingEvents = allEvents.stream()
            .filter(event -> event.getDate().toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate().isAfter(LocalDate.now()))
            .collect(Collectors.toList());

        model.addAttribute("events", upcomingEvents);
        return "upcomingEvents"; // Return the JSP page named 'upcomingEvents.jsp'
    }
    
    @GetMapping("/details/{id}")
    public String showEventDetails(@PathVariable Long id, Model model) {
        Event event = eventService.findEventById(id); // Fetch event by ID
        if (event == null) {
            // Handle the case where the event is not found, return an error page or redirect
            return "redirect:/events";
        }
        
        List<Attendee> attendees = event.getAttendees(); // Fetch attendees for the event
        model.addAttribute("event", event); // Add event to model
        model.addAttribute("attendees", attendees); // Add attendees to model
        return "showEventDetails"; // Return JSP page
    }



}

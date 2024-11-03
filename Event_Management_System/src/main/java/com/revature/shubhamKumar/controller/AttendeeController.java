package com.revature.shubhamKumar.controller;

import com.revature.shubhamKumar.model.Attendee;
import com.revature.shubhamKumar.model.Event;
import com.revature.shubhamKumar.service.AttendeeService;
import com.revature.shubhamKumar.service.EmailService;
import com.revature.shubhamKumar.service.EventService;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/attendees")
public class AttendeeController {

    @Autowired
    private AttendeeService attendeeService;

    @Autowired
    private EventService eventService;

    @Autowired
    private EmailService emailService; // Inject the EmailService

    // Show the form to add a new attendee
    @GetMapping("/add")
    public String addAttendeeForm(Model model) {
        List<Event> events = eventService.findAllEvents(); // Fetch all events
        model.addAttribute("events", events); // Add events to the model
        model.addAttribute("attendee", new Attendee()); // New attendee
        return "addAttendee"; // Return the JSP page
    }

    // Handle the submission of the new attendee
    @PostMapping("/add")
    public String saveAttendee(@ModelAttribute Attendee attendee, @RequestParam("eventId") Long eventId) {
        Event event = eventService.findEventById(eventId); // Find the event by ID
        if (event != null) {
            attendee.setEvent(event); // Assign event to attendee
            attendeeService.saveAttendee(attendee); // Save attendee

            // Format the date to remove the time
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = dateFormat.format(event.getDate());

            // Prepare the email content
            String subject = "You're added to the event: " + event.getName();
            String text = "Dear " + attendee.getName() + ",\n\n" +
                    "You have been successfully added to the event \"" + event.getName() + "\".\n" +
                    "Here are the details of the event:\n" +
                    "Event Name: " + event.getName() + "\n" +
                    "Date: " + formattedDate + "\n" +
                    "Venue: " + (event.getVenue() != null ? event.getVenue().getName() : "No venue assigned") + "\n\n" +
                    "Final timing will be informed soon.\n\n" +
                    "Best regards,\nEvent Management Team";

            // Send the email notification
            emailService.sendEmail(attendee.getEmail(), subject, text);
        }
        return "redirect:/events/details/" + eventId; // Redirect back to event details
    }

    // Delete an attendee by ID
    @GetMapping("/delete/{id}")
    public String deleteAttendee(@PathVariable Long id, @RequestParam("eventId") Long eventId) {
        attendeeService.deleteAttendee(id); // Delete attendee by ID
        return "redirect:/events/details/" + eventId; // Redirect back to event details
    }
}

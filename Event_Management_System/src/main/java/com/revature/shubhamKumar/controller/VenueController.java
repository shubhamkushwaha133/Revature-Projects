package com.revature.shubhamKumar.controller;

import com.revature.shubhamKumar.model.Venue;
import com.revature.shubhamKumar.service.VenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/venues")
public class VenueController {

    @Autowired
    private VenueService venueService;

    // Display all venues
    @GetMapping
    public String listVenues(Model model) {
        List<Venue> venues = venueService.findAllVenues();
        model.addAttribute("venues", venues);
        return "venues"; // venues.jsp
    }

    // Show the form to add a new venue
    @GetMapping("/add")
    public String addVenueForm(Model model) {
        model.addAttribute("venue", new Venue());
        return "addVenue"; // addVenue.jsp
    }

    // Handle the submission of the new venue
    @PostMapping("/add")
    public String saveVenue(@ModelAttribute Venue venue) {
        venueService.saveVenue(venue);
        return "redirect:/venues"; // After adding, redirect to the venue list
    }

    @GetMapping("/delete/{id}")
    public String deleteVenue(@PathVariable Long id) {
        venueService.deleteVenue(id);
        return "redirect:/venues"; // After deletion, redirect to the venue list
    }


}

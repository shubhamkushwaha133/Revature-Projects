package com.revature.shubhamKumar.service;


import com.revature.shubhamKumar.model.*;
import com.revature.shubhamKumar.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VenueService {

    @Autowired
    private VenueRepository venueRepository;

    public List<Venue> findAllVenues() {
        return venueRepository.findAll();
    }

    public Venue saveVenue(Venue venue) {
        return venueRepository.save(venue);
    }

    public Venue findVenueById(Long id) {
        return venueRepository.findById(id).orElse(null);
    }

    public void deleteVenue(Long id) {
        venueRepository.deleteById(id);
    }
}

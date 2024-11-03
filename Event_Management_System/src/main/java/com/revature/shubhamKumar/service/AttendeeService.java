package com.revature.shubhamKumar.service;

import com.revature.shubhamKumar.model.*;
import com.revature.shubhamKumar.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendeeService {

    @Autowired
    private AttendeeRepository attendeeRepository;

    public List<Attendee> findAllAttendees() {
        return attendeeRepository.findAll();
    }

    public Attendee saveAttendee(Attendee attendee) {
        return attendeeRepository.save(attendee);
    }

    public Attendee findAttendeeById(Long id) {
        return attendeeRepository.findById(id).orElse(null);
    }

    public void deleteAttendee(Long id) {
        attendeeRepository.deleteById(id);
    }
}

package com.revature.shubhamKumar.repository;

import com.revature.shubhamKumar.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<Event, Long> {
}

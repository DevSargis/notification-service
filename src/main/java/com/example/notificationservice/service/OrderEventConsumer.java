package com.example.notificationservice.service;

import com.example.notificationservice.model.OrderEvent;
import com.example.notificationservice.repository.OrderEventRepository;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class OrderEventConsumer {

    private final OrderEventRepository repository;

    public OrderEventConsumer(OrderEventRepository repository) {
        this.repository = repository;
    }

    @KafkaListener(topics = "order-events", groupId = "notification-group")
    public void consume(OrderEvent event) {
        System.out.println("📥 Received event: " + event);
        repository.save(event);
    }
}

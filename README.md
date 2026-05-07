# Cloud Platforms

## Description
This project implements an **event-driven e-shop** based on WordPress
(WooCommerce), with centralized identity management through
**Keycloak (SSO)** and user activity monitoring using **ThingsBoard**.

Each user action (login, adding products to the cart, placing an order)
is transformed into an event, processed through **Node-RED**,
asynchronously routed with **RabbitMQ**, stored in **MinIO**,
and visualized in real time on a **ThingsBoard** dashboard.

---

## Application Workflow

1. The user logs into WordPress using **Keycloak (Single Sign-On)**.
2. WordPress generates events such as:
   - `login`
   - `cart_add`
   - `order`
3. The events are sent to **Node-RED**.
4. **Node-RED**:
   - forwards events to RabbitMQ (message broker),
   - consumes events from RabbitMQ for further processing,
   - sends telemetry data to **ThingsBoard**,
   - stores events in **MinIO** (object storage).
5. The **ThingsBoard dashboard** displays events in real time.

---

## Technologies Used

- Docker & Docker Compose
- WordPress (WooCommerce)
- Keycloak (Identity & Access Management – SSO)
- RabbitMQ (Message Broker)
- Node-RED (Event Processing & Automation)
- MinIO (Object Storage)
- ThingsBoard (IoT Platform & Dashboards)

---

## High-Level Architecture

WordPress 
→ Node-RED 
→ RabbitMQ 
→ ThingsBoard 
→ MinIO

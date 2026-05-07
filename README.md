# Cloud Platforms 

## Περιγραφή
Η παρούσα εργασία υλοποιεί ένα **event-driven e-shop** βασισμένο σε WordPress
(WooCommerce), με κεντρική διαχείριση ταυτότητας μέσω **Keycloak (SSO)** και
παρακολούθηση ενεργειών χρηστών μέσω **ThingsBoard**.

Κάθε ενέργεια χρήστη (login, προσθήκη προϊόντος στο καλάθι, παραγγελία) μετατρέπεται
σε event, επεξεργάζεται μέσω **Node-RED**, δρομολογείται ασύγχρονα με **RabbitMQ**,
αποθηκεύεται σε **MinIO** και οπτικοποιείται σε πραγματικό χρόνο σε dashboard
του **ThingsBoard**.

---

## Σενάριο Εφαρμογής
1. Ο χρήστης συνδέεται στο WordPress μέσω **Keycloak (Single Sign-On)**.
2. Το WordPress παράγει events:
   - `login`
   - `cart_add`
   - `order`
3. Τα events αποστέλλονται στο **Node-RED**.
4. Το **Node-RED**:
   - προωθεί τα events στο RabbitMQ (message broker),
   - καταναλώνει τα events από το RabbitMQ για περαιτέρω επεξεργασία,
   - αποστέλλει telemetry δεδομένα στο **ThingsBoard**,
   - αποθηκεύει τα events σε **MinIO** (object storage).
5. Το **ThingsBoard dashboard** εμφανίζει τα events σε πραγματικό χρόνο.

---

## Τεχνολογίες που χρησιμοποιούνται
- Docker & Docker Compose
- WordPress (WooCommerce)
- Keycloak (Identity & Access Management – SSO)
- RabbitMQ (Message Broker)
- Node-RED (Event Processing & Automation)
- MinIO (Object Storage)
- ThingsBoard (IoT Platform & Dashboards)

---

## Αρχιτεκτονική (High-Level)
WordPress 
→ Node-RED
→ RabbitMQ
→ ThingsBoard
→ MinIO 

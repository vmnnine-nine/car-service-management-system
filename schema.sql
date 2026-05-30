CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    created_at DATE DEFAULT CURRENT_DATE
);

CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    license_plate VARCHAR(20) UNIQUE NOT NULL,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT,
    mileage INT DEFAULT 0,

    CONSTRAINT fk_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE mechanics (
    mechanic_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50),
    experience_years INT
);

CREATE TABLE service_records (
    service_id SERIAL PRIMARY KEY,
    car_id INT NOT NULL,
    mechanic_id INT NOT NULL,
    service_type VARCHAR(50),
    status VARCHAR(20),
    cost DECIMAL(10,2),
    service_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_car
    FOREIGN KEY(car_id)
    REFERENCES cars(car_id),

    CONSTRAINT fk_mechanic
    FOREIGN KEY(mechanic_id)
    REFERENCES mechanics(mechanic_id)
);
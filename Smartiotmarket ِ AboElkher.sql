CREATE DATABASE SmartIoTMarket;
USE SmartIoTMarket;

-- جدول الفئات
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- جدول المنتجات
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2), 
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- جدول مستشعرات الحرارة في الأقسام
CREATE TABLE Sensors (
    sensor_id INT PRIMARY KEY AUTO_INCREMENT,
    location_name VARCHAR(100) NOT NULL,
    max_allowed_temp DECIMAL(5,2) NOT NULL -- الحد الأقصى المسموح للحرارة (مثال: الثلاجات 4، المجمدات -10)
);

-- سجل قراءات الحرارة
CREATE TABLE Temp_Logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    sensor_id INT,
    recorded_temp DECIMAL(5,2) NOT NULL,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id) ON DELETE CASCADE 
);

-- جدول مهام الطوارئ والتنبيهات
CREATE TABLE Alert_Tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    sensor_id INT,
    issue_description VARCHAR(255),
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);

-- Trigger لمراقبة درجات الحرارة وإنشاء تنبيه تلقائي
DELIMITER //
CREATE TRIGGER check_temp_anomaly
AFTER INSERT ON Temp_Logs
FOR EACH ROW
BEGIN
    IF NEW.recorded_temp > 5 THEN
        INSERT INTO Alert_Tasks (sensor_id, issue_description)
        VALUES (NEW.sensor_id, 'High Temperature Detected!');
    END IF;
END;
//
DELIMITER ;
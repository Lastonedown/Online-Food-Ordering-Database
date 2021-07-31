

-- -----------------------------------------------------
-- Table `customer_audit_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS customer_audit_tbl (
  `customer_audit_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_audit_data` VARCHAR(145) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_audit_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zipcode_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zipcode_tbl` (
  `zipcode` INT(5) NOT NULL,
  `zipcode_city` VARCHAR(45) NULL DEFAULT NULL,
  `zipcode_state` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`zipcode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `customer_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS customer_tbl (
  `customer_ID` VARCHAR(45) NOT NULL,
  `customer_first_name` VARCHAR(45) NULL DEFAULT NULL,
  `customer_last_name` VARCHAR(45) NULL DEFAULT NULL,
  `customer_email` VARCHAR(45) NULL DEFAULT NULL,
  `customer_phone` VARCHAR(45) NULL DEFAULT NULL,
  `customer_zipcode` INT(5) NULL DEFAULT NULL,
  `customer_street` VARCHAR(45) NULL DEFAULT NULL,
  `customer_house#` INT(11) NULL DEFAULT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_ID`),
  INDEX `customer_zipcode_idx` (`customer_zipcode` ASC) VISIBLE,
  CONSTRAINT `customer_zipcode`
    FOREIGN KEY (`customer_zipcode`)
    REFERENCES `zipcode_tbl` (`zipcode`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `department_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `department_tbl` (
  `department_ID` VARCHAR(10) NOT NULL,
  `department_name` VARCHAR(45) NULL DEFAULT NULL,
  `department_loacation` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`department_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_audit_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_audit_tbl` (
  `employee_audit_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_audit_data` VARCHAR(125) NULL DEFAULT NULL,
  PRIMARY KEY (`employee_audit_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_tbl` (
  `employee_ID` VARCHAR(45) NOT NULL,
  `employee_first_name` VARCHAR(45) NULL DEFAULT NULL,
  `employee_last_name` VARCHAR(45) NULL DEFAULT NULL,
  `employee_email` VARCHAR(45) NULL DEFAULT NULL,
  `employee_hrs_worked` INT(3) NULL DEFAULT NULL,
  `employee_salary` VARCHAR(45) NULL DEFAULT NULL,
  `employee_department` VARCHAR(45) NULL DEFAULT NULL,
  `employee_login` VARCHAR(45) NULL DEFAULT NULL,
  `employee_password` VARCHAR(45) NULL DEFAULT NULL,
  `employee_dob` DATE NULL DEFAULT NULL,
  `employee_gender` VARCHAR(45) NULL DEFAULT NULL,
  `employee_type` VARCHAR(45) NULL DEFAULT NULL,
  `employee_phone` VARCHAR(45) NULL DEFAULT NULL,
  `employee_title` VARCHAR(45) NULL DEFAULT NULL,
  `employee_hire_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`employee_ID`),
  INDEX `employee_department_idx` (`employee_department` ASC) VISIBLE,
  CONSTRAINT `employee_department`
    FOREIGN KEY (`employee_department`)
    REFERENCES department_tbl (`department_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payment_method_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payment_method_tbl` (
  `payment_ID` VARCHAR(45) NOT NULL,
  `card_type` VARCHAR(45) NULL DEFAULT NULL,
  `payment_total` DOUBLE NULL DEFAULT NULL,
  `creditcard#` VARCHAR(16) NULL DEFAULT NULL,
  PRIMARY KEY (`payment_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `products_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products_tbl` (
  `product_ID` VARCHAR(45) NOT NULL,
  `product_name` VARCHAR(45) NULL DEFAULT NULL,
  `product_category` VARCHAR(45) NULL DEFAULT NULL,
  `product_price` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`product_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `orders_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  orders_tbl (
  `order_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_ID` VARCHAR(45) NULL DEFAULT NULL,
  `order_date` DATE NULL DEFAULT NULL,
  `quantity` INT(11) NULL DEFAULT NULL,
  `product_ID` VARCHAR(45) NULL DEFAULT NULL,
  `orders_payment` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`order_ID`),
  INDEX `customer_ID_idx` (`customer_ID` ASC) VISIBLE,
  INDEX `product_ID_idx` (`product_ID` ASC) VISIBLE,
  INDEX `orders_payment_idx` (`orders_payment` ASC) VISIBLE,
  CONSTRAINT `customer_ID`
    FOREIGN KEY (`customer_ID`)
    REFERENCES `customer_tbl` (`customer_ID`),
  CONSTRAINT `orders_payment`
    FOREIGN KEY (`orders_payment`)
    REFERENCES `payment_method_tbl` (`payment_ID`),
  CONSTRAINT `product_ID`
    FOREIGN KEY (`product_ID`)
    REFERENCES `products_tbl` (`product_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `shift_times_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shift_times_tbl` (
  `shift_times_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_ID` VARCHAR(45) NULL DEFAULT NULL,
  `shift_times_start_shift` TIME NULL DEFAULT NULL,
  `shift_times_end_shift` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`shift_times_ID`),
  INDEX `employee_ID_idx` (`employee_ID` ASC) VISIBLE,
  CONSTRAINT `employee_ID`
    FOREIGN KEY (`employee_ID`)
    REFERENCES `employee_tbl` (`employee_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `vendor_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendor_tbl` (
  `vendor_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` VARCHAR(45) NULL DEFAULT NULL,
  `vendor_email` VARCHAR(45) NULL DEFAULT NULL,
  `vendor_phone` VARCHAR(45) NULL DEFAULT NULL,
  `vendor_zipcode` INT(5) NULL DEFAULT NULL,
  `vendor_order#` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`vendor_ID`),
  INDEX `vendor_zipcode_idx` (`vendor_zipcode` ASC) VISIBLE,
  CONSTRAINT `vendor_zipcode`
    FOREIGN KEY (`vendor_zipcode`)
    REFERENCES `zipcode_tbl` (`zipcode`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Placeholder table for view `customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer` (`customer_first_name` INT, `customer_last_name` INT);

-- -----------------------------------------------------
-- View `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer`;
CREATE VIEW `customer` AS select 'customer_tbl',`customer_first_name` AS `customer_first_name`,`customer_tbl`.`customer_last_name` AS `customer_last_name` from `customer_tbl`;

DELIMITER $$
CREATE TRIGGER `customer_tbl_BEFORE_INSERT`
BEFORE INSERT ON `customer_tbl`
FOR EACH ROW
BEGIN
INSERT INTO customer_audit_tbl SET customer_audit_data = CONCAT('New customer with ID = ' , NEW.customer_ID, ' was added on ', NOW());
END$$


CREATE TRIGGER `customer_tbl_AFTER_DELETE`
AFTER DELETE ON `customer_tbl`
FOR EACH ROW
BEGIN
INSERT INTO employee_audit_tbl SET customer_audit_data = CONCAT('Customer with ID = ' , OLD.customer_ID, ' was removed on ', NOW());
END$$


CREATE TRIGGER `employee_tbl_BEFORE_INSERT`
BEFORE INSERT ON `employee_tbl`
FOR EACH ROW
BEGIN
INSERT INTO employee_audit_tbl SET employee_audit_data = CONCAT('New employee with ID = ' , NEW.employee_ID, ' was added on ', NOW());
END$$


CREATE TRIGGER `employee_tbl_AFTER_DELETE`
AFTER DELETE ON `employee_tbl`
FOR EACH ROW
BEGIN
INSERT INTO employee_audit_tbl SET employee_audit_data_tbl = CONCAT('Employee with ID = ' , OLD.employee_ID, ' was removed on ', NOW());
END$$


DELIMITER ;
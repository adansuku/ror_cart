# Amenitiz Cash Register Application

This application serves as a simple cash register, capable of adding products to a cart and calculating the total price, including handling special pricing conditions.

## Table of Contents

1. [Objective](#objective)
2. [Technical Requirements](#technical-requirements)
3. [Setup and Execution](#setup-and-execution)
4. [Assumptions and Pricing Rules](#assumptions-and-princing-rules)
5. [Test Data](#test-data)
6. [Models and Controllers Tested in the app](#models-and-controllers-tested-in-the-app)
7. [Contact Information](#contact-information)

## Objective

The goal is to build an application that:

- Has a UI (can be a simple CLI) for adding products to a cart.
- Computes the total price, accommodating special pricing rules.
- Is user-friendly while maintaining simplicity, readability, maintainability, and extensibility.

## Technical Requirements

- **Programming Language:** This project is written in Ruby with RubyonRails Framework.
- **Testing Framework:** RSpec has been used for testing purposes. Ensure you have RSpec installed and set up for running tests.
- **Docker:** Make sure you have Docker installed on your system. Docker is used for containerization and deployment.
- **Database:** This project relies on MySQL as the database system. Ensure you have MySQL set up and configured appropriately for the application.

## Setup and Execution

Follow these steps to get started:

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Build the Docker container:
   > `docker-compose build`
4. Create the database
   > `docker-compose run web bundle exec rake db:create`
5. Apply database migrations
   > `docker-compose run web bundle exec rake db:migrate`
6. Import the dummy data with a seed file
   > `docker-compose run web bundle exec rake db:seed`
7. After the procces, run
   > `docker-compose up`
8. visit http://localhost:3000 to ensure the rails app is working

### Some docker basic commands

- How to login into the shell
  > `docker-compose run web bash`
- How to login into the ruby console
  > `docker-compose run web bundle exec rails c`
- How to runt the rspec suite tests
  > `docker-compose run web bundle exec rspec`

** Fix Possible problems with database permissions **

- docker-compose exec db bash
- mysql -u root -p
- Insert the root password

> `GRANT ALL PRIVILEGES ON development.* TO 'the_user'@'%';` > `GRANT ALL PRIVILEGES ON test.* TO 'the_user'@'%';` > `FLUSH PRIVILEGES;`

## Assumptions and Pricing Rules

**Registered Products**

| Product Code | Name         | Price  |
| ------------ | ------------ | ------ |
| GR1          | Green Tea    | 3.11€  |
| SR1          | Strawberries | 5.00€  |
| CF1          | Coffee       | 11.23€ |

**Special Pricing Conditions**

1. Buy-one-get-one-free offer on Green Tea.
2. Bulk purchase discount on Strawberries. Price drops to 4.50€ for 3 or more.
3. Bulk purchase discount on Coffee. Price drops to two-thirds for 3 or more.

These rules need to be flexible to accommodate changes by the management.

## Command-Line Interface (CLI) Test

For a hands-on experience through the CLI:

1. Set up a new user (or retrieve an existing one):
   > `user = User.create!(
email: 'adangrx@gmail.com',
password: 'password123',
password_confirmation: 'password123'
)`
2. Initialize a new cart for the user:
   > `cart = Cart.new(user: user)`
3. Add products to cart
   > ` tea = Product.find_by(product_code: 'GR1')`` `cart.add_product(tea, 2)``
4. Calculate the total price:
   > `cart.total_price`
5. Destroy the cart
   > `cart.destroy`
6. Note that the process utilizes an additional class, CartItems, where each cart_item records a product's details.

- `User: ["id", "email", "encrypted_password", "reset_password_token", "reset_password_sent_at", "remember_created_at"]`
- `Cart: ["id", "user_id"]`
- `CartItems: ["id", "cart_id", "quantity", "total_price", "discount_amount", "product_id"]`
- `Products: ["id", "product_code", "name", "price", "discount_id", "image"]`
- `Discounts: ["id", "name", "discount_type", "value", "minimum_quantity"]`

Discounts are linked directly to products to facilitate a one-to-one relationship between a discount and a product. Should the need arise to assign multiple discounts to a single product, the data model will require adjustment to support many-to-many relationships, potentially through a junction table.

### UI
If you prefer, you can also use the UI at http://localhost:3000. Here you can add products to cart with amazing discounts! :D

## Test Data

To ensure correctness, the following test data is used:

| Basket                  | Total Price Expected |
| ----------------------- | -------------------- |
| GR1, GR1                | 3.11€                |
| SR1, SR1, GR1, SR1      | 16.61€               |
| GR1, CF1, SR1, CF1, CF1 | 30.57€               |

### Results in the app demostration

![GR1,GR1](https://i.imgur.com/Kfuecl1.png)
![SR1, SR1, GR1, SR1](https://i.imgur.com/8S7MeVe.png)
![GR1, CF1, SR1, CF1, CF1](https://i.imgur.com/yLREJc3.png)

### Models and Controllers Tested in the app

- **User:** Validates presence and uniqueness, association with the cart, and secure password.
- **Cart:** Ensures one-to-one relationship with user, proper addition of products, and total price calculation.
- **CartItem:** Checks relationships, quantity adjustments, and subtotal calculations.
- **Product:** Validates the presence of necessary fields and associations with discounts and cart items.
- **Discount:** Ensures that discounts are applied correctly based on the defined rules.

### Tested

- **CartsController:** Verifies that cart management functions properly, including the creation, update, and destruction of cart sessions.

### Test Coverage

- **Unit tests:** Cover individual components to ensure they function correctly in isolation.
- **Functional tests:** Focus on the interaction between models and controllers to confirm that the system behaves correctly.

### Considerations for Future Testing

While the current test suite provides a solid baseline for ensuring the application functions as expected, we recognize the importance of expanding our tests to cover more scenarios and user interactions. In the future, we aim to include:

- **Regression tests:** A suite of tests that would run before each release to ensure that new changes haven't affected existing functionalities.
- **End-to-End tests:** Simulating user behavior from start to finish, including integration with the UI if one is developed.
  As of now, the test coverage is extensive for the core functionalities, providing confidence for an initial challenge phase. We look forward to enhancing our testing strategy as the application grows and new features are added.

We understand the importance of testing in the development lifecycle and welcome contributors to assist us in creating a more robust suite of regression and end-to-end tests to further ensure application reliability and user satisfaction.

## Frontend

The frontend of the Amenitiz Cash Register Application has been designed with functionality as the priority. To achieve this goal, we have utilized Bootstrap for its extensive library of pre-styled components and responsive design templates. Bootstrap enables us to construct a user interface that is both accessible and straightforward, which aids in streamlining the development process.

## Future Scalability and Enhancements

The current foundation of the Amenitiz Cash Register Application sets the stage for future scalability and the addition of complex features. Here’s how we envision the evolution of the application:

- **Order Management:** The application could be extended to support full order lifecycle management, tracking each step from cart creation to order fulfillment.

- **Payment Processing:** Integration with payment gateways could be implemented, enabling real-time payment processing and financial reporting.

- **Background Jobs:** To ensure the application remains responsive and efficient, background processing (using tools like Sidekiq or similar gems) can be implemented. This would be particularly useful for handling tasks such as sending email notifications, payment processing, or order status updates.

- **Advanced Reporting:** With the addition of orders and payments, the application could include a reporting module to provide insights into sales trends, inventory management, and customer purchasing behavior.

These enhancements would not only provide a more comprehensive user experience but also contribute to the robustness of the application, making it well-suited for businesses looking to scale their operations.

By implementing these features, the Amenitiz Cash Register Application could evolve into a full-fledged e-commerce platform.

## Contact Information

Thank you for considering the Amenitiz Cash Register Application. We look forward to your contributions and feedback.

Adán González
adangrx@gmail.com
+34 692 817 071

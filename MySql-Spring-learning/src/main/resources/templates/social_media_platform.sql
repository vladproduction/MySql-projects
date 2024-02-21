CREATE TABLE users_info (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(255) NOT NULL UNIQUE,
                       email VARCHAR(255) NOT NULL UNIQUE,
                       password_hash VARCHAR(255) NOT NULL,
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       user_id INT NOT NULL,
                       content TEXT NOT NULL,
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                       updated_at DATETIME DEFAULT NULL,
                       deleted_at DATETIME DEFAULT NULL,
                       FOREIGN KEY (user_id) REFERENCES users_info(id)
);

CREATE TABLE likes (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       user_id INT NOT NULL,
                       post_id INT NOT NULL,
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                       FOREIGN KEY (user_id) REFERENCES users_info(id),
                       FOREIGN KEY (post_id) REFERENCES posts(id)
);

CREATE TABLE comments (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          post_id INT NOT NULL,
                          user_id INT NOT NULL,
                          content TEXT NOT NULL,
                          created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (post_id) REFERENCES posts(id),
                          FOREIGN KEY (user_id) REFERENCES users_info(id)
);

/*Relationship:
Each user can create many posts (one-to-many relationship).
Each post can have many likes and comments (one-to-many relationship).
Each like references a user and a post.
Each comment references a user and a post.*/
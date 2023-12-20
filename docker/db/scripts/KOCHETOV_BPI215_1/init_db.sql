CREATE TABLE publishers (
    title VARCHAR(255) PRIMARY KEY,
    address TEXT NOT NULL
);

CREATE TABLE categories (
    title VARCHAR(255) PRIMARY KEY,
    parent_category_title VARCHAR(255),
    FOREIGN KEY (parent_category_title) REFERENCES categories(title)
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE books (
    isbn VARCHAR(13) PRIMARY KEY,
    year INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    pages INT NOT NULL,
    category_title VARCHAR(255),
    publisher_title VARCHAR(255),
    FOREIGN KEY (category_title) REFERENCES categories(title)
    ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (publisher_title) REFERENCES publishers(title)
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE book_copies (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    shelf_position VARCHAR(255) NOT NULL,
    book_isbn VARCHAR(13) NOT NULL,
    FOREIGN KEY (book_isbn) REFERENCES books(isbn)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE reader (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    surname VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    birth_date DATE NOT NULL
);

CREATE TABLE "orders" (
    id INT  PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    reader_id INT NOT NULL,
    book_copy_id INT NOT NULL,
    return_date DATE NOT NULL,
    FOREIGN KEY (reader_id) REFERENCES Reader(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (book_copy_id) REFERENCES book_copies(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

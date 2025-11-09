# Database / Sơ đồ cơ sở dữ liệu
- Có 4 bảng.

SQL (PostgreSQL) definitions:
CREATE TABLE author (                -- Author table (Tác giả)
Lưu thông tin tác giả.
```sql
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  author_name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

CREATE TABLE genre (                 -- Genre table (Thể loại)
Lưu các thể loại sách.
```sql
CREATE TABLE genre (
  id SERIAL PRIMARY KEY,
  genre_name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

CREATE TABLE book (                  -- Book table (Sách)
Lưu thông tin sách, tham chiếu tới tác giả và thể loại.
```sql
CREATE TABLE book (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author_id INT NOT NULL REFERENCES author(id),
  genre_id INT NOT NULL REFERENCES genre(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

CREATE TABLE description (           -- Description table (Mô tả sách)
Lưu các phiên bản mô tả sinh ra liên kết với sách. 'status' dùng kiểu integer: 1 = hiển thị (active), 0 = không hiển thị (inactive).
```sql
CREATE TABLE description (
  id SERIAL PRIMARY KEY,
  book_id INT NOT NULL REFERENCES book(id),
  content TEXT NOT NULL,
  keywords VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status INT DEFAULT 1  -- 1 = active, 0 = inactive
);
```

Ghi chú ngắn:
Lưu ý: dùng constraint FOREIGN KEY để đảm bảo tính toàn vẹn tham chiếu.
Lưu trữ API key và bí mật khác trong biến môi trường hoặc cấu hình bảo mật (không commit).
